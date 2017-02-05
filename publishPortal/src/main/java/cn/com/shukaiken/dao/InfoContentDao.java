package cn.com.shukaiken.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.shukaiken.model.InfoContent;

@Repository
public interface InfoContentDao {
    int deleteByPrimaryKey(Integer contentId);

    int insert(InfoContent record);

    int insertSelective(InfoContent record);

    InfoContent selectByPrimaryKey(Integer contentId);

    int updateByPrimaryKeySelective(InfoContent record);

    int updateByPrimaryKeyWithBLOBs(InfoContent record);

    int updateByPrimaryKey(InfoContent record);
    
    InfoContent selectInfoDetail(InfoContent record);
    
    InfoContent selectByinfoId(Integer infoId);

	/**
	 * @Title: updateByInfoId 
	 * @Description: TODO
	 * @param @param content
	 * @param @return
	 * @return int
	 * @throws 
	 */
	int updateByInfoId(InfoContent content);
	
	//前端获取分类新闻（接口用）
	List<InfoContent> getCategoryInfoLs(InfoContent record);
	
	//取最新的一条新闻
	InfoContent getNewestInfo();
	
	//取评论数最多的一条新闻（热门）
	InfoContent getHotInfo();
	
	//根据关键字搜索新闻
	List<InfoContent> getSearchInfoLs(InfoContent record);
	//取头条大banner新闻
	List<InfoContent> getHeadBannerInfoLs();
	//取头条分类banner新闻
	List<InfoContent> getCategoryBannerInfoLs();
	//取头条分类新闻
	List<InfoContent> getHeadCategoryInfoLs(InfoContent record);
}