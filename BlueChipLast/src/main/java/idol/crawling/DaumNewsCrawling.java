package idol.crawling;

import java.io.IOException;
import java.util.Vector;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.jsf.el.WebApplicationContextFacesELResolver;

@Component
public class DaumNewsCrawling {
	
		private static String URL = "https://search.daum.net/search?w=news&nil_search=btn&DA=NTB&enc=utf8&cluster=y&cluster_page=1&q=";
			
		public Vector<String> getNaverNews(@RequestParam String koreanname)
		{
			
			Vector<String> list=new Vector<String>();
			
			
			
			Document doc=null;
			try {
				doc = Jsoup.connect(URL+koreanname).get();
			} catch (IOException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
			

			Elements elements2 = doc.select("#clusterResultUL > li > div.wrap_cont > div > div > a");
			for(Element e1:elements2)
			{
				
					String title = e1.text();
					
					list.add(title);
				
				
			}
			
			for(Element e1:elements2)
			{
				
				    String title = e1.attr("href");
					list.add(title);
								
					
				
			}
			
			Elements elements3 = doc.select("#clusterResultUL > li > div.wrap_cont > div > p");
			
			for(Element e1:elements3)
			{
				
					String title = e1.text();
					
					list.add(title);
				
				
			}
			
			/*Elements elements4 = doc.select("#clusterResultUL > li > div.thumb > div > a > img");
			
			for(Element e1:elements4)
			{
				
					String title = e1.attr("src");
					
					list.add(title);
				
			}*/
			
			System.out.println(list);
			return list;
			
		}
		
		
		
}


