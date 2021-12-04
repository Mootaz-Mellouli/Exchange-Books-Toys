package iset.project.exchange.repository;

import iset.project.exchange.entities.VillageEnfant;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VillageEnfantRepository extends MongoRepository<VillageEnfant,String> {
    VillageEnfant findChildrenVillageById(String id);
}
