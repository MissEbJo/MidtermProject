package com.skilldistillery.fomogaming.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "board_game")
public class BoardGame {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "release_year")
	private int releaseYear;

	private String description;

	private String gameplay;

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "website_url")
	private String websiteUrl;
	
	@ManyToOne
	@JoinColumn(name="developer_id")
	private Developer developerId;
	
	@ManyToOne
	@JoinColumn(name="video_game_id")
	private VideoGame videoGame;

	public BoardGame() {
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

	public String getGameplay() {
		return gameplay;
	}

	public void setGameplay(String gameplay) {
		this.gameplay = gameplay;
	}

	public Developer getDeveloperId() {
		return developerId;
	}

	public void setDeveloperId(Developer developerId) {
		this.developerId = developerId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public VideoGame getVideoGame() {
		return videoGame;
	}

	public void setVideoGame(VideoGame videoGame) {
		this.videoGame = videoGame;
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
		BoardGame other = (BoardGame) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return name + gameplay;
	}

}
