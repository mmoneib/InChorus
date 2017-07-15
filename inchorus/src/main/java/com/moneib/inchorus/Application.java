package com.moneib.inchorus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;

/*In Spring Boot + Spring Data JPA application, to support the JSR310 java.time.* APIs, 
 * we need to register this Jsr310JpaConverters manually.*/
@EntityScan(basePackageClasses = { Application.class, Jsr310JpaConverters.class })

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
