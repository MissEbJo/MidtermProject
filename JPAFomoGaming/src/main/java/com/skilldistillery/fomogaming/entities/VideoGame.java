package com.skilldistillery.fomogaming.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
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

import org.hibernate.annotations.CreationTimestamp;

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

	@Column(name = "singleplayer")
	private Boolean singlePlayer;

	@Column(name = "multiplayer")
	private Boolean multiPlayer;

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

	@OneToMany(mappedBy = "videoGame")
	private List<TvShow> tvShows;

	@OneToMany(mappedBy = "videoGame")
	private List<BoardGame> boardGames;

	@ManyToOne
	@JoinColumn(name = "developer_id")
	private Developer developer;

	@ManyToMany(mappedBy = "videoGames")
	private List<Platform> platforms;

	@ManyToOne
	@JoinColumn(name = "added_by_user")
	private User userWhoAdded;

	@Column(name = "when_added")
	@CreationTimestamp
	private LocalDateTime whenAdded;

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

	public LocalDateTime getWhenAdded() {
		return whenAdded;
	}

	public void setWhenAdded(LocalDateTime whenAdded) {
		this.whenAdded = whenAdded;
	}

	public Boolean getSinglePlayer() {
		return singlePlayer;
	}

	public void setSinglePlayer(Boolean singlePlayer) {
		this.singlePlayer = singlePlayer;
	}

	public Boolean getMultiPlayer() {
		return multiPlayer;
	}

	public void setMultiPlayer(Boolean multiPlayer) {
		this.multiPlayer = multiPlayer;
	}

	public User getUserWhoAdded() {
		return userWhoAdded;
	}

	public void setUserWhoAdded(User userWhoAdded) {
		this.userWhoAdded = userWhoAdded;
	}
	
	public void addUser(User user) {
		if (users == null) { users = new ArrayList<>(); }
		if ( ! users.contains(user) ) {
			users.add(user);
			user.addVideoGame(this);
		}

}
	
	public void removeUser(User user) {
		if ( users != null && users.contains(user)) {
			users.remove(user);
			user.removeVideoGame(this);
		}	}
	
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
				+ releaseYear + ", singlePlayer=" + singlePlayer + ", multiPlayer=" + multiPlayer + ", crossPlatform="
				+ crossPlatform + ", imageUrl=" + imageUrl + ", trailerUrl=" + trailerUrl + ", numberInSeries="
				+ numberInSeries + ", gameSeries=" + gameSeries + ", developer=" + developer + ", userWhoAdded="
				+ userWhoAdded + ", whenAdded=" + whenAdded + "]";
	}

}
