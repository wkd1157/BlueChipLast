package idol.crawling;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Component;

@Component
public class InstaTagCrawling {
	
	String url;
	
	public void ImgComments(String search, HttpServletRequest request)
	{
		String imgComments="";
		String realPath = request.getSession().getServletContext().getContext("/BlueChipLast").getRealPath("");
		String chromePath = realPath.replace("\\","/");
		System.out.println("chrome 물리적 경로 :" +chromePath);
		System.setProperty("webdriver.chrome.driver",chromePath+"/assets/app/chromedriver.exe");
		// System.setProperty("webdriver.chrome.driver","/usr/local/bin/chrome");

		url="https://www.instagram.com/explore/tags/"+search+"/";
				
		// 창이 없이 크롬을 실행하는 옵션
		ChromeOptions options = new ChromeOptions();
        options.addArguments("headless");
        options.addArguments("window-size=1920x1080");
        options.addArguments("disable-gpu");
        options.addArguments("--no-sandbox");
        
        // 봇 차단 회피용 크롬 옵션
        options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
        options.addArguments("lang=ko_KR");

    	WebDriver driver = new ChromeDriver(options);
    	JavascriptExecutor jse= (JavascriptExecutor) driver;

		// 드라이버 실행    	
    	driver.get(url);
    	
    	for(int i=0;i<3;i++)
    	{
    		jse.executeScript("window.scrollTo(0, document.body.scrollHeight)");
        	try {
    			Thread.sleep(1000);
    		} catch (InterruptedException e1) {
    			e1.printStackTrace();
    		}
    	}
 	
    	String html= driver.getPageSource(); // 페이지의 html 문자열 모두 가져오기
		Document doc = Jsoup.parse(html);
		Elements imageSrcs=doc.select("div.KL4Bh>img");

		for(Element e:imageSrcs)
		{
			String imageAlt=e.attr("alt");
			// System.out.println("이미지코멘트: "+imageAlt);
			imgComments += imageAlt;
		}
		
		driver.quit();
		
		IdolWordCloud(search, imgComments, request);
		
	}
	
	public void IdolWordCloud(String search, String imgComments,HttpServletRequest request)
	{
		
		String realPath = request.getSession().getServletContext().getContext("/BlueChipLast").getRealPath("");
		System.out.println("WordCloudRealPath :"+realPath);
		imgComments = imgComments.replace("'","");
		imgComments = imgComments.trim();
		System.out.println("imgComments :"+ imgComments);
		RConnection connection = null;
		try {
			connection = new RConnection();
			connection.eval("rm(list=ls())");
			connection.eval("library(KoNLP)");
			connection.eval("library(wordcloud2)");
			connection.eval("library(RColorBrewer)");
			connection.eval("useSejongDic");
			connection.eval("txt<-'"+imgComments+"'");
			connection.eval("place<-sapply(txt,extractNoun,USE.NAMES = F)");
			connection.eval("head(unlist(place),30)");
			connection.eval("c<-unlist(place)");
			connection.eval("place<-Filter(function(x){nchar(x)>=2},c)");
			connection.eval("place<-gsub('[0-9]','',place)");
			connection.eval("place<-gsub('\\t','',place)");
			connection.eval("place<-gsub('[ㄱ-ㅎ]','',place)");
			connection.eval("place<-gsub('[ㅏ-ㅣ]','',place)");
			connection.eval("place<-gsub('[~!@$%^&*#()_+=?<>]','',place)");
			connection.eval("place<-Filter(function(x){nchar(x)>=2},place)");
			
			String saveFileFullName = realPath+"wordcloud\\"+search+".html";
			saveFileFullName = saveFileFullName.replace("\\","/");
			System.out.println("saveFileFullName: "+ saveFileFullName);
			
			connection.eval("write(unlist(place),'temp.txt')");
			connection.eval("rev<-read.table('temp.txt')");
			connection.eval("nrow(rev)");
			connection.eval("wordcount<-table(rev)");
			connection.eval("wordcount2<-head(sort(wordcount,decreasing = T),100)");
			connection.eval("plate<-brewer.pal(9,'Set1')");
			connection.eval("mycloud <- wordcloud2(data=wordcount2, minSize=0, shape='circle', size=1, fontFamily='segoe UI', color='random-light')");
			
			connection.eval("htmltools::save_html(mycloud, file = '"+saveFileFullName+"')");
			} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			connection.close();
		}
	}
}
