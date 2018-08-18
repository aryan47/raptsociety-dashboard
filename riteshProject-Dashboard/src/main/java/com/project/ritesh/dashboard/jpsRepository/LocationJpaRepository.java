package com.project.ritesh.dashboard.jpsRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.project.ritesh.dashboard.entity.Location;

@RepositoryRestResource(path = "locations", collectionResourceRel="locations")
public interface LocationJpaRepository extends JpaRepository<Location, Long> {
	
}
