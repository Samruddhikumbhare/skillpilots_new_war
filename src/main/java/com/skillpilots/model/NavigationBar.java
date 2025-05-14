package com.skillpilots.model;

public class NavigationBar {
String title;
String link;
String cssClass;
String navigationIcon;

public NavigationBar(String title, String link, String cssClass, String navigationIcon) {
	super();
	this.title = title;
	this.link = link;
	this.cssClass = cssClass;
	this.navigationIcon = navigationIcon;
}
public NavigationBar(){}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getLink() {
	return link;
}

public void setLink(String link) {
	this.link = link;
}

public String getCssClass() {
	return cssClass;
}

public void setCssClass(String cssClass) {
	this.cssClass = cssClass;
}

public String getNavigationIcon() {
	return navigationIcon;
}

public void setNavigationIcon(String navigationIcon) {
	this.navigationIcon = navigationIcon;
}

}
