package com.moneib.inchorus.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.moneib.inchorus.domain.Project;
import com.moneib.inchorus.domain.ProjectRepository;

public class ProjectService {

	@Autowired
	ProjectRepository repo;

	public Iterable<Project> getAllProjects() {
		return repo.findAll();
	}

	public long countAllProjects() {
		return repo.count();
	}

	// Used for add and update.
	public void saveProject(Project project) {
		repo.save(project);
	}

	public void deleteProject(Project project) {
		repo.delete(project);
	}

	public Project ghetProject(long id) {
		return repo.findOne(id);
	}
}
