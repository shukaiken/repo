package cn.com.shukaiken.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import cn.com.shukaiken.util.ValidateUtils;
/**
 * 
 * @author jiexuan.zhu
 * @date 2015-11-28
 * 新闻评论
 */
public class InfoComment extends BaseModel implements Serializable {
    /**
	 * @Fields serialVersionUID : <p></p>
	 */
	private static final long serialVersionUID = 7779587380523333794L;

	private Integer commentId;

    private Integer infoId;

    private Integer parentCommentId;

    private Integer authorId;

    private String author;
    
    private String head_img_url;
    
    private Integer cust_id;
    
    private String user_name;
    
    private String comment_content;
    
    private String ip;

    private Integer ups;

    private Integer downs;

    private String isCheck;

    private String checkStatus;

    private String isRecommend;

    private Integer isValid;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private String resv1;

    private String resv2;

    private String resv3;

    private String resv4;
    
    private String time;
    
    private InfoCommentCheck commentCheck;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getInfoId() {
        return infoId;
    }

    public void setInfoId(Integer infoId) {
        this.infoId = infoId;
    }

    public Integer getParentCommentId() {
        return parentCommentId;
    }

    public void setParentCommentId(Integer parentCommentId) {
        this.parentCommentId = parentCommentId;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = ValidateUtils.isEmpty(author) ? null : author.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ValidateUtils.isEmpty(ip) ? null : ip.trim();
    }

    public Integer getUps() {
        return ups;
    }

    public void setUps(Integer ups) {
        this.ups = ups;
    }

    public Integer getDowns() {
        return downs;
    }

    public void setDowns(Integer downs) {
        this.downs = downs;
    }

    public String getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(String isCheck) {
        this.isCheck = ValidateUtils.isEmpty(isCheck) ? null : isCheck.trim();
    }

    public String getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(String checkStatus) {
        this.checkStatus = ValidateUtils.isEmpty(checkStatus) ? null : checkStatus.trim();
    }

    public String getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(String isRecommend) {
        this.isRecommend = ValidateUtils.isEmpty(isRecommend) ? null : isRecommend.trim();
    }

    public Integer getIsValid() {
		return isValid;
	}

	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}

	public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getResv1() {
        return resv1;
    }

    public void setResv1(String resv1) {
        this.resv1 = ValidateUtils.isEmpty(resv1) ? null : resv1.trim();
    }

    public String getResv2() {
        return resv2;
    }

    public void setResv2(String resv2) {
        this.resv2 = ValidateUtils.isEmpty(resv2) ? null : resv2.trim();
    }

    public String getResv3() {
        return resv3;
    }

    public void setResv3(String resv3) {
        this.resv3 = ValidateUtils.isEmpty(resv3) ? null : resv3.trim();
    }

    public String getResv4() {
        return resv4;
    }

    public void setResv4(String resv4) {
        this.resv4 = ValidateUtils.isEmpty(resv4) ? null : resv4.trim();
    }

	/**
	 * @return the commentCheck
	 */
	public InfoCommentCheck getCommentCheck() {
		return commentCheck;
	}

	/**
	 * @param commentCheck the commentCheck to set
	 */
	public void setCommentCheck(InfoCommentCheck commentCheck) {
		this.commentCheck = commentCheck;
	}

	public Integer getCust_id() {
		return cust_id;
	}

	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getHead_img_url() {
		return head_img_url;
	}

	public void setHead_img_url(String head_img_url) {
		this.head_img_url = head_img_url;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
}