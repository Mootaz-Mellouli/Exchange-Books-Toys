package iset.project.exchange.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import iset.project.exchange.entities.Association;

public interface AssociationRepository extends MongoRepository<Association, String>{
	Association findAssociationById(String id);
}
