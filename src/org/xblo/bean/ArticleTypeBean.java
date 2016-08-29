package org.xblo.bean;

public class ArticleTypeBean {
	private int articleTypeId = -1;
	private String articleTypeName = "未分类";
	private String articleTypeDesc = "";

	public void setArticleTypeId(int articleTypeId) {
		this.articleTypeId = articleTypeId;
	}

	public int getArticleTypeId() {
		return articleTypeId;
	}

	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}

	public String getArticleTypeName() {
		return articleTypeName;
	}

	public void setArticleTypeDesc(String articleTypeDesc) {
		this.articleTypeDesc = articleTypeDesc;
	}

	public String getArticleTypeDesc() {
		return articleTypeDesc;
	}

}
