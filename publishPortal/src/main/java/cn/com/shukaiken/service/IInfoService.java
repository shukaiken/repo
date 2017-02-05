/**
 * @Title: IInfoService.java 
* @Package cn.com.shukaiken.service 
* @Description: <p>TODO</p> 
* @author zhaox   
* @date 2015年11月13日 上午11:17:50 
* @version V1.0 
 */
package cn.com.shukaiken.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shukaiken.model.Info;
import cn.com.shukaiken.model.InfoContent;
import cn.com.shukaiken.model.SystemUser;

/**
 * @ClassName: IInfoService 
 * @Description: <p>TODO</p>
 * @date 2015年11月13日 上午11:17:50 
 * @author Zhao Xiang
 *
 */
public interface IInfoService {

	/**
	 * @Title: addNewInfo 
	 * @Description: 向数据库插入资讯的内容，主方法
	 * @param info 向数据库中插入的实体
	 * @param response 
	 * @param request 
	 * @param ischangeImage 
	 * @param bannerIds 
	 * @return int 插入的资讯的主键，如果为0，表示插入失败
	 */
	public int addNewInfo(Info info, HttpServletRequest request, HttpServletResponse response, String ischangeImage, String bannerIds,String tagIds);
	
	/**
	 * @Title: modifyInfoByCondition 
	 * @Description: TODO 根据条件修改资讯信息
	 * @param info 修改后的资讯信息
	 * @param srcInfo 需要修改的条件
	 * @param @return
	 * @return int 修改的行数
	 * @throws 
	 */
	public int modifyInfoByCondition(Info info,Info srcInfo);
	
	/**
	 * @Title: removeInfoById 
	 * @Description: TODO
	 * @param infoId 需要删除的资讯的主键
	 * @return int 删除的数量，如果为0 ，表示删除失败
	 * @throws 
	 */
	public int removeInfoById(Integer infoId);
	
	/**
	 * @Title: removeInfoByCondition 
	 * @Description: TODO 根据条件删除资讯信息
	 * @param @param srcInfo 需要删除的条件
	 * @param @return
	 * @return int 删除的行数，如果为0， 表示 删除失败
	 * @throws 
	 */
	public int removeInfoByCondition(Info srcInfo);
	
	/**
	 * @Title: modifyInfoByCondition 
	 * @Description: TODO 根据Id修改资讯信息
	 * @param info 需要修改的资讯信息
	 * @return int 修改的资讯信息行数
	 * @throws 
	 */
	public int modifyInfoById(Info info);
	
	/**
	 * @Title: getInfoById 
	 * @Description: TODO 根据Id获取资讯信息
	 * @param infoId 
	 * @return Info
	 * @throws 
	 */
	public Info getInfoById(Integer infoId);
	
	/**
	 * @Title: getInfosByCondition 
	 * @Description: TODO 根据条件查询资讯信息
	 * @param info 查询条件
	 * @return List<Info> 查询结果的List集合
	 * @throws 
	 */
	public List<Info> getInfosByCondition(Info info);

	
	/**
	 * @Title: uploadImg 
	 * @Description: TODO
	 * @param @param req
	 * @param @param res
	 * @param @return
	 * @param @throws Exception
	 * @return boolean
	 * @throws 
	 */
	public boolean uploadImg(HttpServletRequest req,HttpServletResponse res,Info info,InfoContent content) throws Exception;

	/**
	 * @param tagIds 
	 * @return 
	 * @Title: modifyInfo 
	 * @Description: TODO
	 * @param @param info
	 * @param @param request
	 * @param @param response
	 * @param @param ischangeImage
	 * @param @param bannerIds
	 * @return void
	 * @throws 
	 */
	public int modifyInfo(Info info, HttpServletRequest request, HttpServletResponse response, String ischangeImage,
			String bannerIds, String tagIds);

	/**
	 * @Title: changeInfoStatusById 
	 * @Description: TODO
	 * @param @param info
	 * @param @param opinion
	 * @param @return
	 * @return int
	 * @throws 
	 */
	public int changeInfoStatusById(Info info, String opinion,SystemUser curUser);

	public int updateInfoByIds(String infoIds, Info info);

	/**
	 * @Title: recommendInfo 
	 * @Description: TODO
	 * @param @param info
	 * @param @return
	 * @return int
	 * @throws 
	 */
	public int recommendInfo(Info info);

	public List<Info> searchInfos(Map<String, Object> queryMap);

	/**
	 * @Title: addCrawlNewsInfo 
	 * @Description: TODO
	 * @param @param mainInfo
	 * @return void
	 * @throws 
	 */
	public int addCrawlNewsInfo(Info mainInfo);
}
