package edu.mum.tmsystem.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.tmsystem.domain.TMChecker;

@Repository
public interface ITMCheckerRepository extends CrudRepository<TMChecker, Integer> {
	

	@Query("SELECT t FROM TMChecker t WHERE t.user.id= :id")
	public TMChecker findTMCheckerByUserId(@Param("id") Long id);


}
