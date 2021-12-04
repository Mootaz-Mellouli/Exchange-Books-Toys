package iset.project.exchange.repository;


import iset.project.exchange.entities.MaisonRetrait;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MaisonRetraitRepository extends MongoRepository<MaisonRetrait,String> {
    MaisonRetrait findMaisonRetraitById(String id);
}
