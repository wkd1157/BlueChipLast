package idol.crawling;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import net.bytebuddy.implementation.bytecode.ByteCodeAppender.Size;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;



@Component
public class InstaPhotoCrawling {
	String url;
	
	private String koreanname2 = "";
	
	public Vector<String> getInstaPhoto(@RequestParam String koreanname)
	{	
		Vector<String> getInstaPhoto=new Vector();
		
		String exeURL = InstaPhotoCrawling.class.getClassLoader().getResource("chromedriver.exe").getPath();
		System.setProperty("webdriver.chrome.driver", exeURL);
		// System.setProperty("webdriver.chrome.driver", "/usr/local/bin/chromedriver");
			
		koreanname = koreanname.replaceAll(" ", "");
		
		koreanname2 = "";
			for(int i=0; i<koreanname.length();i++)
			{
				
				String spellcheck = koreanname.substring(i,i+1);
				int num = spellcheck.charAt(0);
				if(num>=65 && num<=90 || num>=97 && num<=122)
					koreanname2 += koreanname.substring(i,i+1);
				else if(num >= 0xAC00 && num <= 0xD743)
					koreanname2 += koreanname.substring(i,i+1);
										
			}
			
			
		url="https://www.instagram.com/explore/tags/"+koreanname2+"/";
		
		// 드라이버 실행
			
		ChromeOptions options = new ChromeOptions();
        options.addArguments("headless");
        options.addArguments("window-size=1920x1080");
        options.addArguments("disable-gpu");
        // options.addArguments("--disable-dev-shm-usage"); // overcome limited resource problems
        options.addArguments("--no-sandbox"); // Bypass OS security model
        
        WebDriver driver = new ChromeDriver(options);
		
		driver.get(url);
		
		String cloudText = "";
		
		for(int i=1;i<=10;i++)
		{
			for(int j=1;j<=3;j++)
			{
				String src="";
				try {					
					WebElement ele1 = driver.findElement(By.cssSelector("div.Nnq7C:nth-child("+i+") > div.v1Nh3:nth-child("+j+")  > a > div > div > img"));
					src=ele1.getAttribute("src");
					String alt=ele1.getAttribute("alt");
					// System.out.println("이미지alt:" +alt);
					
					cloudText += alt;

					String splitStrArr[] = alt.split("#");
					String alt2 ="";
					for(int k = 1; k < splitStrArr.length; k++){
						if(splitStrArr[k].length() <=20)
							alt2 += "#" + splitStrArr[k] + " ";
					}

					if (alt.contains("#"))
					{
						getInstaPhoto.add(src+"|"+alt2);
					}
					else {

						ele1.click();

						WebElement ele2 = driver.findElement(By.cssSelector(".KlCQn.EtaWk > ul > li > div > div > div > span > a"));

						String innertag = ele2.getText();

						getInstaPhoto.add(src+"|"+ innertag);


					}
					System.out.println(getInstaPhoto);
				}catch(Exception e) {
					continue;
				}	
			}
		}
		// 드라이버 종료
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		driver.quit();
		
		IdolWordCloud(koreanname, cloudText);

		return getInstaPhoto;
	}
	
	public void IdolWordCloud(String search, String imgComments)
	{
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getContext("/").getRealPath("");
		String RootPath = realPath.replace("\\","/");
		String saveFullPath = RootPath+"wordcloud/";
		imgComments = imgComments.replace("'","");
		imgComments = imgComments.trim();
		System.out.println("imgComments :"+ imgComments);
		System.out.println("saveFullPath :"+saveFullPath);
		
		RConnection connection = null;
		try {
			connection = new RConnection();
			connection.eval("rm(list=ls())");
			connection.eval("library(KoNLP)");
			connection.eval("library(wordcloud2)");
			connection.eval("library(RColorBrewer)");
			connection.eval("useSejongDic");
			connection.eval("txt<-'"+imgComments+"'");
			connection.eval("write(unlist(txt),'"+saveFullPath+search+"_comments.txt')");
			connection.eval("txt2<-readLines('"+saveFullPath+search+"_comments.txt')");
			// connection.eval("file.remove('"+saveFullPath+search+"_comments.txt')");
			connection.eval("place<-sapply(txt2,extractNoun,USE.NAMES = F)");
			connection.eval("head(unlist(place),30)");
			connection.eval("c<-unlist(place)");
			connection.eval("place<-Filter(function(x){nchar(x)>=2},c)");
			connection.eval("place<-gsub('[0-9]','',place)");
			connection.eval("place<-gsub('\\t','',place)");
			connection.eval("place<-gsub('[ㄱ-ㅎ]','',place)");
			connection.eval("place<-gsub('[ㅏ-ㅣ]','',place)");
			connection.eval("place<-gsub('#',' ',place)");
			connection.eval("place<-gsub('[~!@$%^&#*()_+=?<>]','',place)");
			connection.eval("place<-Filter(function(x){nchar(x)>=2},place)");
			connection.eval("write(unlist(place),'"+saveFullPath+search+"_temp.txt')");
			connection.eval("rev<-read.table('"+saveFullPath+search+"_temp.txt')");
			// connection.eval("file.remove('"+saveFullPath+search+"_temp.txt')");
			connection.eval("nrow(rev)");
			connection.eval("wordcount<-table(rev)");
			connection.eval("wordcount2<-head(sort(wordcount,decreasing = T),100)");
			connection.eval("plate<-brewer.pal(9,'Set1')");
			connection.eval("mycloud <- wordcloud2(data=wordcount2, minSize=0, shape='circle', size=1, fontFamily='segoe UI', color='random-light')");
						
			connection.eval("htmltools::save_html(mycloud, file = '"+saveFullPath+search+".html')");
			connection.eval("rm(list=ls())");
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			connection.close();
		}
	}
	
	
}
