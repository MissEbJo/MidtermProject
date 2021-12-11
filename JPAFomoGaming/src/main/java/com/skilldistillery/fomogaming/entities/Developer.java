package com.skilldistillery.fomogaming.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Developer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String country;

	@Column(name = "founding_year")
	private int foundingYear;

	@Column(name = "logo_image_url")
	private String logoImageUrl;

	private String description;

	@Column(name = "website_url")
	private String websiteUrl;
	
	@OneToMany(mappedBy="developerId")
	private List<BoardGame> boardgames;
	
	@OneToMany(mappedBy="developer")
	private List <VideoGame> videogames;

	public Developer() {
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getFoundingYear() {
		return foundingYear;
	}

	public void setFoundingYear(int foundingYear) {
		this.foundingYear = foundingYear;
	}

	public String getLogoImageUrl() {
		return logoImageUrl;
	}

	public void setLogoImageUrl(String logoImageUrl) {
		this.logoImageUrl = logoImageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public List<BoardGame> getBoardgames() {
		return boardgames;
	}

	public void setBoardgames(List<BoardGame> boardgames) {
		this.boardgames = boardgames;
	}

	public List<VideoGame> getVideogames() {
		return videogames;
	}

	public void setVideogames(List<VideoGame> videogames) {
		this.videogames = videogames;
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
		Developer other = (Developer) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Developer [id=" + id + ", name=" + name + ", country=" + country + ", foundingYear=" + foundingYear
				+ ", description=" + description;
	}

}
