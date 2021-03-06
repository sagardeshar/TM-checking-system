package edu.mum.tmsystem.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.tmsystem.domain.Building;
@Repository
public interface IBuildingRepository extends CrudRepository<Building, Integer> {

}
