package idol.crawling;

import java.util.Vector;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import net.bytebuddy.implementation.bytecode.ByteCodeAppender.Size;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;



@Component
public class InstaPhotoCrawling {
	String url;
	
	private String koreanname2 = "";
	
	public Vector<String> getInstaPhoto(@RequestParam String koreanname)
	{	
		
		String exeURL = InstaPhotoCrawling.class.getClassLoader().getResource("chromedriver.exe").getPath();

		Vector<String> getInstaPhoto=new Vector();
		System.setProperty("webdriver.chrome.driver", exeURL);
			
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
			WebDriver driver = new ChromeDriver();
			driver.get(url);
			for(int i=1;i<=10;i++)
			{
				for(int j=1;j<=3;j++)
				{
					String src="";
					try {					
						WebElement ele1 = driver.findElement(By.cssSelector("div.Nnq7C:nth-child("+i+") > div.v1Nh3:nth-child("+j+")  > a > div > div > img"));
						src=ele1.getAttribute("src");
						String alt=ele1.getAttribute("alt");

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
			driver.quit();

			return getInstaPhoto;
	}
}
