package iset.project.exchange.repository;

import iset.project.exchange.entities.Jouet;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface JouetRepository extends MongoRepository<Jouet,String> {
    Jouet findToyByID(String id );
}
