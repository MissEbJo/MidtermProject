package com.skilldistillery.fomogaming.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	private String email;
	
	@Column(name = "profile_picture")
	private String profilePicture;
	
	private Boolean enabled;
	
	private String role;
	
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="favorite_games",
					joinColumns=@JoinColumn(name="user_id"),
					inverseJoinColumns=@JoinColumn(name="video_game_id"))
	
	private List<VideoGame> videoGames;
	
	@OneToMany(mappedBy="user")
	private List<Comment> comments;
	

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<VideoGame> getVideoGames() {
		return videoGames;
	}

	public void setVideoGames(List<VideoGame> videoGames) {
		this.videoGames = videoGames;
	}
	
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public void addVideoGame(VideoGame videogame) {
		if (videoGames == null) { videoGames = new ArrayList<>(); }
		if ( ! videoGames.contains(videogame) ) {
			videoGames.add(videogame);
			videogame.addUser(this);
		}
	}
	
	public void removeVideoGame(VideoGame videogame) {
		if ( videoGames != null && videoGames.contains(videogame)) {
			videoGames.remove(videogame);
			videogame.removeUser(this);
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + "]";
	}
	
	

}
