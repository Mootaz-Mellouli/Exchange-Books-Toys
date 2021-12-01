package iset.project.exchange.repository;

import iset.project.exchange.entities.Livre;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LivreRepository extends MongoRepository<Livre,String> {
    Livre findBookById(String id);
}
