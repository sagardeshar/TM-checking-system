package edu.mum.tmsystem.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.tmsystem.domain.TMChecker;
import edu.mum.tmsystem.domain.TMHistory;

@Repository
public interface ITMCheckerRepository extends CrudRepository<TMHistory, Long> {
	
	@Query("SELECT t FROM TMChecker WHERE t.user.id= : userId")
	TMChecker findTMCheckerByUserId(@Param("userID") Long id);

}
