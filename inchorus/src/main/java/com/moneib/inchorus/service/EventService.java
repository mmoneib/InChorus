package com.moneib.inchorus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moneib.inchorus.domain.Event;
import com.moneib.inchorus.domain.EventRepository;

@Component
public class EventService {

	@Autowired
	EventRepository eventRepository;

	public List<Event> getAllEvents() {
		List<Event> events = new ArrayList<>();
		eventRepository.findAll().forEach(events::add);
		return events;
	}

	public Event getEvent(long id) {
		return eventRepository.findOne(id);
	}

	public Event addEvent(Event event) {
		return eventRepository.save(event);
	}

	public Event updateEvent(long id, Event event) {
		return eventRepository.save(event);
	}

	public void deleteEvent(Long id) {
		eventRepository.delete(id);

	}
	public void deleteAllEvent() {
		eventRepository.deleteAll();

	}


}
