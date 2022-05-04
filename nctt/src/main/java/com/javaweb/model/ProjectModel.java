package com.javaweb.model;

public class ProjectModel extends AbstractModel<ProjectModel> {
	
	private String title;
	private String location;
	private String investor;
	private String scale;
	private String price;
	private String dayrelease;
	private String status;
	private String content;
//	private Long categoryId;
//	private String categoryCode;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getInvestor() {
		return investor;
	}
	public void setInvestor(String investor) {
		this.investor = investor;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDayrelease() {
		return dayrelease;
	}
	public void setDayrelease(String dayrelease) {
		this.dayrelease = dayrelease;
	}
	



}
