package com.skilldistillery.fomogaming.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "streaming_service")
public class StreamingService {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	
	@Column(name= "image_url")
	private String imageUrl;
	
	@Column(name= "website_url")
	private String websiteUrl;

	public StreamingService() {
		super();

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage_url() {
		return imageUrl;
	}

	public void setImage_url(String image_url) {
		this.imageUrl = image_url;
	}

	public String getWebsite_url() {
		return websiteUrl;
	}

	public void setWebsite_url(String website_url) {
		this.websiteUrl = website_url;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StreamingService other = (StreamingService) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "StreamingService [id=" + id + ", name=" + name + ", image_url=" + imageUrl + ", website_url="
				+ websiteUrl + "]";
	}

}
