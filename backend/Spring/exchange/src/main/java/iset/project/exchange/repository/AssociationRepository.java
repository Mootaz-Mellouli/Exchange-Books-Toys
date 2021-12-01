package iset.project.exchange.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import iset.project.exchange.entities.Association;
import org.springframework.stereotype.Repository;

@Repository
public interface AssociationRepository extends MongoRepository<Association, String>{
	Association findAssociationById(String id);
}
