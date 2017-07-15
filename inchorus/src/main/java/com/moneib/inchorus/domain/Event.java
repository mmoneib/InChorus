package com.moneib.inchorus.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "event")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long ID;
	@Column(name = "Title", nullable = false)
	private String title;
	@Column(name = "Location", nullable = true)
	private String location;
	@Column(name = "Content", nullable = true)
	private String content;
	/*LocalDateTime is used instead of ZonedDateTime as timezones are not stored as a time
	 * component in MySQL. Hence, they must be stored separately as a String.
	 */
	@Column(name = "EventDate", nullable = false)	
	private LocalDateTime eventDate;

	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getEventDate() {
		return eventDate;
	}

	public void setEventDate(LocalDateTime eventDate) {
		this.eventDate = eventDate;
	}

}
