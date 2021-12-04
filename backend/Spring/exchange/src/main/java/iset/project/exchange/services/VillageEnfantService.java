package iset.project.exchange.services;


import iset.project.exchange.entities.VillageEnfant;
import iset.project.exchange.repository.VillageEnfantRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class VillageEnfantService {

    @Autowired
    private final VillageEnfantRepository villageEnfantRepository;


    public List<VillageEnfant> getAllChildrenVillage()
    {
        return villageEnfantRepository.findAll();
    }

    public VillageEnfant saveChildrenVillage(VillageEnfant villageEnfant)
    {
        return villageEnfantRepository.save(villageEnfant) ;
    }

    public VillageEnfant getChildrenVillageByID(String id){
        return villageEnfantRepository.findChildrenVillageById(id);
    }

    public void deleteChildrenVillage(String id )
    {
        boolean exists = villageEnfantRepository.existsById(id);
        if (!exists)
        {
            throw new IllegalStateException("Children village  with  ID : "+id+"not found");
        }
        else {
            VillageEnfant villageEnfant = getChildrenVillageByID(id);
            villageEnfantRepository.delete(villageEnfant);
        }
    }

    public VillageEnfant updateChildrenVillage(VillageEnfant villageEnfant)
    {

        return villageEnfantRepository.save(villageEnfant);
    }
}
