package com.skilldistillery.fomogaming.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "game_series")
public class GameSeries {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String name;

	@Column(name = "image_url")
	private String imageUrl;

	private String Description;

	@ManyToMany
	@JoinTable(name = "video_game_has_genre", joinColumns = @JoinColumn(name = "gameseries_id"), inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List<Genre> genres;

	@OneToMany(mappedBy = "gameSeries")
	private List<VideoGame> videoGames;

	@OneToMany(mappedBy = "gameSeriesId")
	private List<Book> books;

	@OneToMany(mappedBy = "gameSeries")
	private List<TvShow> tvShows;

	@OneToMany(mappedBy = "gameSeries")
	private List<Movie> movies;

	public GameSeries() {
		super();
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

	public List<VideoGame> getVideoGames() {
		return videoGames;
	}

	public void setVideoGames(List<VideoGame> videoGames) {
		this.videoGames = videoGames;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public List<TvShow> getTvShows() {
		return tvShows;
	}

	public void setTvShows(List<TvShow> tvShows) {
		this.tvShows = tvShows;
	}

	public List<Movie> getMovies() {
		return movies;
	}

	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}

	@Override
	public int hashCode() {
		return Objects.hash(Description, Id, imageUrl, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GameSeries other = (GameSeries) obj;
		return Objects.equals(Description, other.Description) && Id == other.Id
				&& Objects.equals(imageUrl, other.imageUrl) && Objects.equals(name, other.name);
	}

	@Override
	public String toString() {
		return "GameSeries [Id=" + Id + ", name=" + name + ", imageUrl=" + imageUrl + ", Description=" + Description
				+ "]";
	}

}
