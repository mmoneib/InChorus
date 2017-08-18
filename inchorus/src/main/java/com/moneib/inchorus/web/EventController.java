package com.moneib.inchorus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.moneib.inchorus.domain.Event;
import com.moneib.inchorus.service.EventService;

@RestController
public class EventController {
	
	@Autowired
	private EventService eventService;
	@RequestMapping("/api/events")
	public List<Event> getAllEvents()
	{
		return eventService.getAllEvents();
	}
	
	@RequestMapping("/api/events/{id}")
	public Event getTopic(@PathVariable Long id)
	{
		return eventService.getEvent(id);
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/api/events")
	public void addEvent(@RequestBody Event event)
	{
		eventService.addEvent(event);
	}
	
	@RequestMapping(method=RequestMethod.PUT,value="/api/events/{id}")
	public void updateEvent(@RequestBody Event event,@PathVariable Long id)
	{
		eventService.updateEvent(id, event);
	}
	
	@RequestMapping(method=RequestMethod.DELETE,value="/api/events/{id}")
	public void deleteEvent(@PathVariable Long id)
	{
		eventService.deleteEvent(id);
	}
	
}
