package iset.project.exchange.repository;

import iset.project.exchange.entities.Utilisateur;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UtilisateurRepository extends MongoRepository<Utilisateur,Integer> {
}
