package cn.blog.pojo;

import java.io.Serializable;
import java.util.Date;

public class Blog implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//博客主键
	private Integer id;
    //题目
    private String title;
    //摘要
    private String summary;
    //发布时间
    private Date publishDate;
    //点击数
    private Integer clicks;
    //回复数
    private Integer replies;
    //博客类型
    private Integer typeId;
    //关键字
    private String keyWord;
    //内容
    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Integer getClicks() {
        return clicks;
    }

    public void setClicks(Integer clicks) {
        this.clicks = clicks;
    }

    public Integer getReplies() {
        return replies;
    }

    public void setReplies(Integer replies) {
        this.replies = replies;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}