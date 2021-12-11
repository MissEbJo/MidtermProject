package com.skilldistillery.fomogaming.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;



@Entity
@Table(name= "streaming_service")
public class StreamingService {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	
	@Column(name= "image_url")
	private String imageUrl;
	
	@Column(name= "website_url")
	private String websiteUrl;
	
	@ManyToMany(cascade = CascadeType.PERSIST)
	@JoinTable(name = "movie_has_streaming_service",
	joinColumns = @JoinColumn(name = "streaming_service_id"), inverseJoinColumns = @JoinColumn(name = "movie_id"))
	private List<Movie> movies;
	
	@ManyToMany(cascade = CascadeType.PERSIST)
	@JoinTable(name = "tv_show_has_streaming_service",
	joinColumns = @JoinColumn(name = "streaming_service_id"), inverseJoinColumns = @JoinColumn(name = "tv_show_id"))
	private List<TvShow> tvShows;

	public StreamingService() {
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




	public List<Movie> getMovies() {
		return movies;
	}




	public void setMovies(List<Movie> movies) {
		this.movies = movies;
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
		StreamingService other = (StreamingService) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "StreamingService [id=" + id + ", name=" + name + ", image_url=" + imageUrl + ", website_url="
				+ websiteUrl + "]";
	}

}
