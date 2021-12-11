package com.skilldistillery.fomogaming.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tv_show")
public class TvShow {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@Column(name="number_seasons")
	private Integer numberOfSeasons;
	
	@Column(name="release_year")
	private Integer releaseYear;
	
	private String description;
	
	@Column(name="video_game_id")
	private int videoGameId;
	
	@Column(name="series_id")
	private Integer seriesId;
	
	@Column(name="imdb_url")
	private String imdbUrl;
	
	@Column(name="trailer_url")
	private String trailerUrl;

	@Column(name="poster_image_url")
	private String posterImageUrl;
	
	

	public TvShow() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getNumberOfSeasons() {
		return numberOfSeasons;
	}

	public void setNumberOfSeasons(Integer numberOfSeasons) {
		this.numberOfSeasons = numberOfSeasons;
	}

	public Integer getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(Integer releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getVideoGameId() {
		return videoGameId;
	}

	public void setVideoGameId(int videoGameId) {
		this.videoGameId = videoGameId;
	}

	public Integer getSeriesId() {
		return seriesId;
	}

	public void setSeriesId(Integer seriesId) {
		this.seriesId = seriesId;
	}

	public String getImdbUrl() {
		return imdbUrl;
	}

	public void setImdbUrl(String imdbUrl) {
		this.imdbUrl = imdbUrl;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	public String getPosterImageUrl() {
		return posterImageUrl;
	}

	public void setPosterImageUrl(String posterImageUrl) {
		this.posterImageUrl = posterImageUrl;
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
		TvShow other = (TvShow) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "TvShow [id=" + id + ", title=" + title + ", numberOfSeasons=" + numberOfSeasons + ", releaseYear="
				+ releaseYear + ", description=" + description + ", videoGameId=" + videoGameId + ", seriesId="
				+ seriesId + ", imdbUrl=" + imdbUrl + ", trailerUrl=" + trailerUrl + ", posterImageUrl="
				+ posterImageUrl + "]";
	}
	
	
	
}
