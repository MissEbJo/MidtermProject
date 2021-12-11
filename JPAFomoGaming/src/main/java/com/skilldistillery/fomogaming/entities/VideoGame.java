package com.skilldistillery.fomogaming.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table (name = "video_game")
public class VideoGame {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name = "release_year")
	private Integer releaseYear;
	
	private String mode;
	
	@Column(name = "cross_platform")
	private boolean crossPlatform;
	
	@Column(name = "developer_id")
	private Integer developerId;
	
	@Column(name = "series_id")
	private Integer seriesId;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	@Column(name = "trailer_url")
	private String trailerUrl;
	
	@Column(name = "number_in_series")
	private Integer numberInSeries;
	
	@ManyToMany(mappedBy="videoGames")
	private List<User> users;

	public VideoGame() {
		super();
	}

	public Integer getId() {
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public boolean isCrossPlatform() {
		return crossPlatform;
	}

	public void setCrossPlatform(boolean crossPlatform) {
		this.crossPlatform = crossPlatform;
	}

	public Integer getDeveloperId() {
		return developerId;
	}

	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}

	public Integer getSeriesId() {
		return seriesId;
	}

	public void setSeriesId(int seriesId) {
		this.seriesId = seriesId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	public Integer getNumberInSeries() {
		return numberInSeries;
	}

	public void setNumberInSeries(Integer numberInSeries) {
		this.numberInSeries = numberInSeries;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void setReleaseYear(Integer releaseYear) {
		this.releaseYear = releaseYear;
	}

	public void setDeveloperId(Integer developerId) {
		this.developerId = developerId;
	}

	public void setSeriesId(Integer seriesId) {
		this.seriesId = seriesId;
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
		VideoGame other = (VideoGame) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "VideoGame [id=" + id + ", name=" + name + ", description=" + description + ", releaseYear="
				+ releaseYear + ", mode=" + mode + ", crossPlatform=" + crossPlatform + ", developerId=" + developerId
				+ ", seriesId=" + seriesId + ", imageUrl=" + imageUrl + ", trailerUrl=" + trailerUrl
				+ ", numberInSeries=" + numberInSeries + "]";
	}
	
	
}
