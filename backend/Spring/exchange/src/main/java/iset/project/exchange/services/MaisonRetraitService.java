package iset.project.exchange.services;


import iset.project.exchange.entities.MaisonRetrait;
import iset.project.exchange.repository.MaisonRetraitRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class MaisonRetraitService {

    @Autowired
    private final MaisonRetraitRepository maisonRetraitRepository;


    public List<MaisonRetrait> getAllRetirementHome()
    {
        return maisonRetraitRepository.findAll();
    }

    public MaisonRetrait saveRetirementHome(MaisonRetrait maisonRetrait)
    {
        return maisonRetraitRepository.save(maisonRetrait) ;
    }

    public MaisonRetrait getRetirementHomeByID(String id){
        return maisonRetraitRepository.findMaisonRetraitById(id);
    }

    public void deleteRetirementHome(String id )
    {
        boolean exists = maisonRetraitRepository.existsById(id);
        if (!exists)
        {
            throw new IllegalStateException("Retirement Home with  ID : "+id+" not found");
        }
        else {
            MaisonRetrait maisonRetrait = getRetirementHomeByID(id);
            maisonRetraitRepository.delete(maisonRetrait);
        }
    }

    public MaisonRetrait updateRetirementHome(MaisonRetrait maisonRetrait)
    {

        return maisonRetraitRepository.save(maisonRetrait);
    }
}
