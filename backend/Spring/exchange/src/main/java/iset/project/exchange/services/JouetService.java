package iset.project.exchange.services;

import iset.project.exchange.entities.Jouet;
import iset.project.exchange.entities.Livre;
import iset.project.exchange.repository.JouetRepository;
import iset.project.exchange.repository.LivreRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@AllArgsConstructor
public class JouetService {

    @Autowired
    private final JouetRepository jouetRepository;


    public List<Jouet> getAllToys()
    {
        return jouetRepository.findAll();
    }

    public Jouet addToy(Jouet jouet)
    {
        return jouetRepository.save(jouet) ;
    }

    public Jouet getToyByID(String id){
        return jouetRepository.findToyById(id);
    }

    public void deleteToy(String id )
    {
        boolean exists = jouetRepository.existsById(id);
        if (!exists)
        {
            throw new IllegalStateException("Toy with  ID : "+id+"not found");
        }
        else {
            Jouet jouet = getToyByID(id);
            jouetRepository.delete(jouet);
        }
    }

    public Jouet updateToy(Jouet jouet)
    {
        return jouetRepository.save(jouet);
    }
}
