package com.project.ritesh.dashboard.jpsRepository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.project.ritesh.dashboard.entity.Student;
import com.project.ritesh.dashboard.entity.Subject;
@RepositoryRestResource(path = "students")
public interface StudentJpaRepository extends JpaRepository<Student, Long> {
	Student findByEmail(String email);
	List<Subject> findByNameContaining(String name);
	
}
