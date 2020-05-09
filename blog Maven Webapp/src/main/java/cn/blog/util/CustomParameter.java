package cn.blog.util;

import java.io.Serializable;

public class CustomParameter implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -589832861850422462L;
	//状态
	private int status;
	//信息
	private String msg;
	//数据
	private Object data;
	//总数
	private int total;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
}
