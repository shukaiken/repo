/**
 * @Title: IInfoContentService.java 
* @Package cn.com.shukaiken.service 
* @Description: <p>TODO</p> 
* @author zhaox   
* @date 2015年11月13日 上午11:19:11 
* @version V1.0 
 */
package cn.com.shukaiken.service;

import java.util.List;

import cn.com.shukaiken.model.InfoContent;

/**
 * @ClassName: IInfoContentService 
 * @Description: <p>TODO</p>
 * @date 2015年11月13日 上午11:19:11 
 * @author Zhao Xiang
 *
 */
public interface IInfoContentService {

	/**
	 * @Title: addNewContent 
	 * @Description: TODO
	 * @param @param infoContent
	 * @return void
	 * @throws 
	 */
	public int addNewContent(InfoContent infoContent) throws Exception;
	
	
	public InfoContent viewNewsDetail(InfoContent infoContent);

	/**
	 * @Title: updateInfoContentById 
	 * @Description: TODO
	 * @param @param infoContent
	 * @return void
	 * @throws 
	 */
	public int updateInfoContentById(InfoContent infoContent);

	/**
	 * @Title: removeContentByInfoId 
	 * @Description: TODO
	 * @param @param infoId
	 * @return void
	 * @throws 
	 */
	public int removeContentByInfoId(Integer infoId);
	
	
	//前端获取分类新闻（接口用）
	List<InfoContent> getCategoryInfoLs(InfoContent record);
	
	
	//取最新的一条新闻
	InfoContent getNewestInfo();
	
	//取评论数最多的一条新闻（热门）
	InfoContent getHotInfo();
	
	//根据关键字搜索新闻
	List<InfoContent> getSearchInfoLs(InfoContent record);
	
	/**
	 * 获取头条大banner新闻
	 * @param record
	 * @return
	 */
	List<InfoContent> getHeadBannerInfoLs();
	
	/**
	 * 获取头条分类banner新闻
	 * @param record
	 * @return
	 */
	List<InfoContent> getCategoryBannerInfoLs();
	
	/**
	 * 取头条分类新闻
	 * @param record
	 * @return
	 */
	List<InfoContent> getHeadCategoryInfoLs(InfoContent record);
	

}
