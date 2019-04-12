package com.ahead.crud.pojo;

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public class Msg {
	
	//200成功 ，500失败
	private Integer code;
	private String info;
	
	private Map<String,Object> data = new HashMap<String,Object>();

	
	public static Msg success() {
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setInfo("处理成功");
		return msg;
	}
	
	public static Msg fail() {
		Msg msg = new Msg();
		msg.setCode(500);
		msg.setInfo("处理失败");
		return msg;
	}
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}


	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

	public Msg add(String key, Object value) {
		this.getData().put(key, value);
		return this;
	}
	
}
