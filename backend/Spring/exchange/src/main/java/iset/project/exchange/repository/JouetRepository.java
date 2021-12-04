package iset.project.exchange.repository;

import iset.project.exchange.entities.Jouet;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JouetRepository extends MongoRepository<Jouet,String> {
    Jouet findToyById(String id);
}
