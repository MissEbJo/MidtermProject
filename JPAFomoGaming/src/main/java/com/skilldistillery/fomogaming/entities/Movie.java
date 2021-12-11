package com.skilldistillery.fomogaming.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Movie {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@Column(name= "release_year")
	private int releaseYear;
	
	private String description;
	
	@Column(name= "series_id")
	private int seriesId;
	
	@Column(name= "imdb_url")
	private String imdbUrl;
	
	@Column(name= "poster_image_url")
	private String posterImageUrl;
	
	@Column(name= "trailer_url")
	private String trailerUrl;
	
	@ManyToMany(mappedBy= "movies")
	private List<StreamingService> ss;
	
	@ManyToOne
	@JoinColumn("game_series")
	private String gameSeries;
	
	public Movie() {
		super();
		
	}
	
	

	public String getGameSeries() {
		return gameSeries;
	}



	public void setGameSeries(String gameSeries) {
		this.gameSeries = gameSeries;
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

	public int getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSeriesId() {
		return seriesId;
	}

	public void setSeriesId(int seriesId) {
		this.seriesId = seriesId;
	}

	public String getImdbUrl() {
		return imdbUrl;
	}

	public void setImdbUrl(String imdbUrl) {
		this.imdbUrl = imdbUrl;
	}

	public String getPosterImageUrl() {
		return posterImageUrl;
	}

	public void setPosterImageUrl(String posterImageUrl) {
		this.posterImageUrl = posterImageUrl;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	public List<StreamingService> getSs() {
		return ss;
	}

	public void setSs(List<StreamingService> ss) {
		this.ss = ss;
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
		Movie other = (Movie) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Movie [id=" + id + ", title=" + title + ", releaseYear=" + releaseYear + ", description=" + description
				+ ", seriesId=" + seriesId + ", imdbUrl=" + imdbUrl + ", posterImageUrl=" + posterImageUrl
				+ ", trailerUrl=" + trailerUrl + "]";
	}
	
	
	
	

}
