package cn.com.shukaiken.crawler;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;

import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Links;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import cn.edu.hfut.dmic.webcollector.util.FileUtils;

/**
 * 用WebCollector爬虫爬取整站图片
 */
public class PicCrawler extends BreadthCrawler{

    public PicCrawler(String crawlPath, boolean autoParse) {
		super(crawlPath, autoParse);
		
	}

	/*用一个整数，不断自增，来作为下载的图片的文件名*/
    AtomicInteger id=new AtomicInteger(0);

    public static void main(String[] args) throws Exception {
        PicCrawler crawler=new PicCrawler("D://test",true);
        crawler.addSeed("http://www.meishij.net/");
        crawler.addRegex("http://.*meishij.net/.*");
        crawler.addRegex(".*(jpg|png|gif).*");
        crawler.setThreads(50);
        crawler.start(3);
    }
/*
	 @Override
	    public Links visitAndGetNextLinks(Page page) {
	        Links nextLinks = new Links();
	        if (autoParse) {
	            String conteType = page.getResponse().getContentType();
	            if (conteType != null && conteType.contains("text/html")) {
	                Document doc = page.getDoc();
	                if (doc != null) {
	                    nextLinks.addAllFromDocument(page.getDoc(), regexRule);
	                    Elements eles = page.getDoc().select("img[src]");
	            		for(int i=0;i<eles.size();i++){
	            			nextLinks.add(eles.get(i).attr("abs:src"));
	            		}
	                }
	            }
	        }
	        try {
	            visit(page, nextLinks);
	        } catch (Exception ex) {
	            LOG.info("Exception", ex);
	        }
	        return nextLinks;
	    }*/
    
    @Override
    public void afterVisit(Page page, CrawlDatums next) {
         if (autoParse && !regexRule.isEmpty()) {
             
            String conteType = page.getResponse().getContentType();
            if (conteType != null && (conteType.contains("text/html")||conteType.contains("image/jpeg"))) {
                Document doc = page.getDoc();
                if (doc != null) {
                   Links links=new Links().addByRegex(doc, regexRule);
                   Elements eles = page.getDoc().select("img[src]");
          			for(int i=0;i<eles.size();i++){
          				links.add(eles.get(i).attr("abs:src"));
          			}
                   next.add(links);
                  
                }
            }
        }
    }

	@Override
	public void visit(Page page,CrawlDatums datums) {
		System.out.println(page.getUrl());
		 //不处理非jpg的网页/文件
        if(!Pattern.matches(".*jpg$",page.getCrawlDatum().getUrl())){
            //links.addAllFromDocument(page.getDoc(), regexRule);
        	return ;
        }
        
       /* Links nextLinks = new Links();
        if (autoParse) {
            String conteType = page.getResponse().getContentType();
            if (conteType != null && conteType.contains("text/html")) {
                Document doc = page.getDoc();
                if (doc != null) {
                    nextLinks.addByRegex(page.getDoc(), regexRule);
                    Elements eles = page.getDoc().select("img[src]");
            		for(int i=0;i<eles.size();i++){
            			nextLinks.add(eles.get(i).attr("abs:src"));
            		}
                }
            }
        }
        datums.add(nextLinks);*/
       /* try {
            visit(page, nextLinks);
        } catch (Exception ex) {
            LOG.info("Exception", ex);
        }*/
        //将图片内容保存到文件，page.getContent()获取的是文件的byte数组
        try {
            FileUtils.writeFileWithParent("E://download/"+id.incrementAndGet()+".jpg",page.getContent());
            System.out.println("download:"+page.getUrl());
        } catch (IOException e) {
            e.printStackTrace();
        }
		
	}
}
