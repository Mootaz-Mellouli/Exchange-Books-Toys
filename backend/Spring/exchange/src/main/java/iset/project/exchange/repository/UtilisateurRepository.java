package iset.project.exchange.repository;

import iset.project.exchange.entities.Utilisateur;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UtilisateurRepository extends MongoRepository<Utilisateur,String> {
    Utilisateur findUserById(String id);

}
