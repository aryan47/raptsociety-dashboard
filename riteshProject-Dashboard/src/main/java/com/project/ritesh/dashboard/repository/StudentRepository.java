package com.project.ritesh.dashboard.repository;

import java.util.List;

import javax.persistence.EntityManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.ritesh.dashboard.entity.Student;
import com.project.ritesh.dashboard.entity.Subject;
import com.project.ritesh.dashboard.jpsRepository.StudentJpaRepository;

@Repository
@Transactional
public class StudentRepository {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	StudentJpaRepository JpaRepository;
	@Autowired
	EntityManager em;

	public List<Subject> searchAllSubjects(String name) {
		return JpaRepository.findByNameContaining(name);		
		
	}
	public void searchAllSubjectsFilterClass(String name, String std) {
		List<Subject> subjects = JpaRepository.findByNameContaining(name);		
		logger.info("============subjects like   {}", subjects);
		logger.info("============subject like size  {}", subjects.size());
	}
	public void searchAllSubjectsFilterClassLocation(String name, String std) {
		List<Subject> subjects = JpaRepository.findByNameContaining(name);		
		logger.info("============subjects like   {}", subjects);
		logger.info("============subject like size  {}", subjects.size());
	}
	public String addStudent(Student student) {
		
			em.persist(student);
			return student.getName();
		
	}
}
