package com.project.ritesh.dashboard.jpsRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.project.ritesh.dashboard.entity.Subject;

@RepositoryRestResource(path = "subjects", collectionResourceRel="subjects")
public interface SubjectJpaRepository extends JpaRepository<Subject, Long> {
	public List<Subject> findNameByNameContaining(@Param("name") String name);
	// public List<Objects> findByNameAndClass()
}
