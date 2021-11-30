package iset.project.exchange.repository;

import iset.project.exchange.entities.Livre;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface LivreRepository extends MongoRepository<Livre,String> {
    Livre findBookById(String id);
}
