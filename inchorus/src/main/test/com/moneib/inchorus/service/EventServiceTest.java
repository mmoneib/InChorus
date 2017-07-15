package com.moneib.inchorus.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.moneib.inchorus.domain.Event;

@RunWith(SpringRunner.class) // Needed to run the tests using SpringBoot.
@SpringBootTest
public class EventServiceTest {
	@Autowired
	EventService eventService;
	Event newEvent;
	LocalDateTime eventDate = LocalDateTime.now();
	long id;
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	@Before
	public void setUp() {
		newEvent = new Event();

		newEvent.setContent("New Event Celebration");
		newEvent.setEventDate(eventDate);
		newEvent.setLocation("Shiekh Zayed");
		newEvent.setTitle("Inchorus Event");
	}

	@Test
	public void addEvent() {
		Event event = eventService.addEvent(newEvent);
		assertNotNull(event);
		assertNotNull(event.getID());
		assertNotEquals(0, event.getID());
		assertEquals("New Event Celebration", event.getContent());
		assertEquals(eventDate, event.getEventDate());
		assertEquals("Shiekh Zayed", event.getLocation());
		assertEquals("Inchorus Event", event.getTitle());
	}

	@Test
	public void getEventByID() {
		// add then update what was added .
		Event event = eventService.addEvent(newEvent);
		id = event.getID();
		String getEventDate = dateFormat.format(eventDate);
		newEvent.setID(id);
		Event getevent = eventService.getEvent(id);
		assertEquals(id, getevent.getID());
		assertEquals("New Event Celebration", getevent.getContent());
		assertEquals(getEventDate, dateFormat.format(getevent.getEventDate()));
		assertEquals("Shiekh Zayed", getevent.getLocation());
		assertEquals("Inchorus Event", getevent.getTitle());
	}

	@Test
	public void updateEvent() {
		Event event = eventService.addEvent(newEvent);
		id = event.getID();

		newEvent.setID(id);
		newEvent.setContent("New Event Celebration Updated");
		Event eventupdate = eventService.updateEvent(id, newEvent);
		assertNotNull(eventupdate);
		assertNotNull(eventupdate.getID());
		assertNotEquals(0, eventupdate.getID());
		assertEquals("New Event Celebration Updated", eventupdate.getContent());
		assertEquals(eventDate, eventupdate.getEventDate());
		assertEquals("Shiekh Zayed", eventupdate.getLocation());
		assertEquals("Inchorus Event", eventupdate.getTitle());
	}

	@Test
	public void deleteEvent() {
		Event event = eventService.addEvent(newEvent);
		id = event.getID();
		eventService.deleteEvent(id);
	}

	@Test
	public void getAllEvent() {
		eventService.deleteAllEvent();
		eventService.addEvent(newEvent);
		int eventSize = eventService.getAllEvents().size();
		assertEquals(1, eventSize);
	}

}