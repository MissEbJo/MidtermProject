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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "video_game")
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

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "trailer_url")
	private String trailerUrl;

	@Column(name = "number_in_series")
	private Integer numberInSeries;

	@ManyToMany(mappedBy = "videoGames")
	private List<User> users;
	
	@ManyToMany(mappedBy = "videoGames")
	private List<Genre> genres;

	@ManyToOne
	@JoinColumn(name = "series_id")
	private GameSeries gameSeries;
	
	@OneToMany(mappedBy="videoGame")
	private List<TvShow> tvShows;
	
	@OneToMany(mappedBy="videoGame")
	private List<BoardGame> boardGames;
	
	@ManyToOne
	@JoinColumn(name = "developer_id")
	private Developer developer;
	
	@ManyToMany(mappedBy = "videoGames")
	private List<Platform> platforms;

	public VideoGame() {
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(Integer releaseYear) {
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

	public GameSeries getGameSeries() {
		return gameSeries;
	}

	public void setGameSeries(GameSeries gameSeries) {
		this.gameSeries = gameSeries;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

	public List<TvShow> getTvShows() {
		return tvShows;
	}

	public void setTvShows(List<TvShow> tvShows) {
		this.tvShows = tvShows;
	}

	public List<BoardGame> getBoardGames() {
		return boardGames;
	}

	public void setBoardGames(List<BoardGame> boardGames) {
		this.boardGames = boardGames;
	}

	public Developer getDeveloper() {
		return developer;
	}

	public void setDeveloper(Developer developer) {
		this.developer = developer;
	}

	public List<Platform> getPlatforms() {
		return platforms;
	}

	public void setPlatforms(List<Platform> platforms) {
		this.platforms = platforms;
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
				+ releaseYear + ", mode=" + mode + ", crossPlatform=" + crossPlatform + ", imageUrl=" + imageUrl
				+ ", trailerUrl=" + trailerUrl + ", numberInSeries=" + numberInSeries + ", users=" + users + ", genres="
				+ genres + ", gameSeries=" + gameSeries + ", tvShows=" + tvShows + ", boardGames=" + boardGames
				+ ", developer=" + developer + "]";
	}

	

}
