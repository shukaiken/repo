package test;

import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.xfire.client.XFireProxyFactory;
import org.codehaus.xfire.service.Service;
import org.codehaus.xfire.service.binding.ObjectServiceFactory;

import cn.com.shukaiken.util.JSONHelper;
import cn.com.shukaiken.webService.IAppNewsWebService;

public class TestCommentWebService {
	
	public static void main(String[] args) {
		
		/*String a = "{&quot;pageSize&quot;:&quot;10&quot;,&quot;pageNum&quot;:&quot;1&quot;,&quot;tag_id&quot;:&quot;2&quot;}";
		String b = "{\"pageSize\":\"10\",\"pageNum\":\"1\",\"tag_id\":\"2\"}";
		String reg4 = "&quot;"; 
	    a = a.replaceAll(reg4,"\""); 
		System.out.println(a);*/
		getCommentLs();
	
	}
	
	public static void getCommentLs(){
		Service serviceModel = new ObjectServiceFactory().create(IAppNewsWebService.class);  
		IAppNewsWebService service;
		try {
			//service = (IAppCustWebService) new XFireProxyFactory().create(serviceModel,"http://42.96.165.121:8086/service/IAppCustWebService");
			service = (IAppNewsWebService) new XFireProxyFactory().create(serviceModel,"http://192.168.1.186:8080/publish/service/IAppNewsWebService");
			//方法一 测试  
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("info_id", 59);
			map.put("pageNum", 1);
			map.put("pageSize", 10);
			
			//String jsonStr = JSONHelper.getJsonByMap(map);
			String jsonStr = service.getHeadNews();
			System.out.println("jsonStr="+jsonStr);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}  
	}
	
	public static void addNewsComment(){
		Service serviceModel = new ObjectServiceFactory().create(IAppNewsWebService.class);  
		IAppNewsWebService service;
		try {
			//service = (IAppCustWebService) new XFireProxyFactory().create(serviceModel,"http://42.96.165.121:8086/service/IAppCustWebService");
			service = (IAppNewsWebService) new XFireProxyFactory().create(serviceModel,"http://192.168.1.186:8080/publish/service/IAppNewsWebService");
			//方法一 测试  
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("type", 1);
			map.put("author_id", 2);
			map.put("info_id", 70);
			map.put("comment_content", "开心你就跳起来");
			
			map.put("cust_id", 4);
			map.put("comment_id", 5);
			
			String jsonStr = JSONHelper.getJsonByMap(map);
			jsonStr = service.addNewsComment(jsonStr);
			System.out.println("jsonStr="+jsonStr);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}  
	}

}
