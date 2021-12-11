package com.skilldistillery.fomogaming.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="game_series")
public class GameSeries {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int Id;	

private String name;

@Column(name="image_url")
private String imageUrl;

private String Description;

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
	return Objects.equals(Description, other.Description) && Id == other.Id && Objects.equals(imageUrl, other.imageUrl)
			&& Objects.equals(name, other.name);
}

@Override
public String toString() {
	return "GameSeries [Id=" + Id + ", name=" + name + ", imageUrl=" + imageUrl + ", Description=" + Description + "]";
}


}
