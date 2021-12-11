package com.skilldistillery.fomogaming.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Platform {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name= "system_name")
	private String systemName;
	
	@Column(name= "logo_url")
	private String logoUrl;
	
	@Column(name= "release_year")
	private Integer releaseYear;
	
	@Column(name= "platform_url")
	private String platformUrl;
	
	

	public Platform() {
		super();
			}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public Integer getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(Integer releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getPlatformUrl() {
		return platformUrl;
	}

	public void setPlatformUrl(String platformUrl) {
		this.platformUrl = platformUrl;
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
		Platform other = (Platform) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Platform [id=" + id + ", systemName=" + systemName + ", logoUrl=" + logoUrl + ", releaseYear="
				+ releaseYear + ", platformUrl=" + platformUrl + "]";
	}
	
	
	
}
