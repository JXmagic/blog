package cn.blog.pojo;

import java.io.Serializable;

public class Blogtype implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//主键
	private Integer id;
    //博客类型名字
    private String typeName;
    //排序
    private Integer orderNo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }
}