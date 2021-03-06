package com.skilldistillery.fomogaming.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tv_show")
public class TvShow {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	@Column(name = "number_seasons")
	private Integer numberOfSeasons;

	@Column(name = "release_year")
	private Integer releaseYear;

	private String description;

	@ManyToOne
	@JoinColumn(name = "series_id")
	private GameSeries gameSeries;

	@Column(name = "imdb_url")
	private String imdbUrl;

	@Column(name = "trailer_url")
	private String trailerUrl;

	@Column(name = "poster_image_url")
	private String posterImageUrl;

	@ManyToOne
	@JoinColumn(name = "video_game_id")
	private VideoGame videoGame;
	
	@ManyToMany(mappedBy = "tvShows")
	private List<StreamingService> streamingService;

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

	public GameSeries getGameSeries() {
		return gameSeries;
	}

	public void setGameSeries(GameSeries gameSeries) {
		this.gameSeries = gameSeries;
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

	public VideoGame getVideoGame() {
		return videoGame;
	}

	public void setVideoGame(VideoGame videoGame) {
		this.videoGame = videoGame;
	}

	public List<StreamingService> getStreamingService() {
		return streamingService;
	}

	public void setStreamingService(List<StreamingService> streamingService) {
		this.streamingService = streamingService;
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
		return title + "\n Number of Seasons: " + numberOfSeasons;
	}

}
