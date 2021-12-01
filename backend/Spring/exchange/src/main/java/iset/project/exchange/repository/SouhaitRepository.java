package iset.project.exchange.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import iset.project.exchange.entities.ListeDeSouhaits;

public interface SouhaitRepository extends MongoRepository<ListeDeSouhaits, String>{
	ListeDeSouhaits findSouhaitById(String id);
}
