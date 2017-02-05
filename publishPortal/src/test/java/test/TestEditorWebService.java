package test;

import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.xfire.client.XFireProxyFactory;
import org.codehaus.xfire.service.Service;
import org.codehaus.xfire.service.binding.ObjectServiceFactory;

import cn.com.shukaiken.util.JSONHelper;
import cn.com.shukaiken.webService.IAppEditorWebService;

public class TestEditorWebService {
	
	public static void main(String[] args) {
		viewPublishLs();
	}
	
	public static void viewPublishLs(){
		Service serviceModel = new ObjectServiceFactory().create(IAppEditorWebService.class);  
		IAppEditorWebService service;
		try {
			service = (IAppEditorWebService) new XFireProxyFactory().create(serviceModel,"http://42.96.165.121:8086/service/IAppEditorWebService");
			//service = (IAppEditorWebService) new XFireProxyFactory().create(serviceModel,"http://192.168.1.186:8080/publish/service/IAppEditorWebService");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("cust_id", 8);
			map.put("pageNum", 1);
			map.put("pageSize", 10);
			String jsonStr = JSONHelper.getJsonByMap(map);
		    jsonStr = service.viewPublishLs(jsonStr);
			System.out.println("jsonStr="+jsonStr);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}  
	}
	
	public static void getEditorLs(){
		Service serviceModel = new ObjectServiceFactory().create(IAppEditorWebService.class);  
		IAppEditorWebService service;
		try {
			//service = (IAppNewsWebService) new XFireProxyFactory().create(serviceModel,"http://42.96.165.121:8086/service/IAppNewsWebService");
			service = (IAppEditorWebService) new XFireProxyFactory().create(serviceModel,"http://192.168.1.186:8080/publish/service/IAppEditorWebService");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("pageNum", 1);
			map.put("pageSize", 10);
			String jsonStr = JSONHelper.getJsonByMap(map);
		    jsonStr = service.getEditorLs(jsonStr);
			System.out.println("jsonStr="+jsonStr);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}  
	}
	
	public static void delEditorByCustId(){
		Service serviceModel = new ObjectServiceFactory().create(IAppEditorWebService.class);  
		IAppEditorWebService service;
		try {
			//service = (IAppNewsWebService) new XFireProxyFactory().create(serviceModel,"http://42.96.165.121:8086/service/IAppNewsWebService");
			service = (IAppEditorWebService) new XFireProxyFactory().create(serviceModel,"http://192.168.1.186:8080/publish/service/IAppEditorWebService");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("cust_id", 2);
			map.put("editor_id", 10);
			String jsonStr = JSONHelper.getJsonByMap(map);
		    jsonStr = service.delEditorByCustId(jsonStr);
			System.out.println("jsonStr="+jsonStr);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}  
	}
	
}
