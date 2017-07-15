package com.moneib.inchorus.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="project")
public class Project {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@Column(nullable=false)
	private String title;
	
	@Column(nullable=false)
	private String content;
	
	@Column(nullable=false, name="Creation_Time")
	private LocalDate creationDate;
	
	@Column(nullable=true, name="Start_Date")
	private LocalDate startDate;
	
	@Column(nullable=true, name="End_Date")
	private LocalDate endDate;
}
