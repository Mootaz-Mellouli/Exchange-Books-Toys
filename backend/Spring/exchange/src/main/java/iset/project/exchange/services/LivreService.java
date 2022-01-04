package iset.project.exchange.services;

import iset.project.exchange.entities.Jouet;
import iset.project.exchange.entities.Livre;

import iset.project.exchange.repository.LivreRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class LivreService {

    @Autowired
    private final LivreRepository livreRepository;


    public List<Livre> getAllBooks()
    {
        return livreRepository.findAll();
    }

    public Livre saveBook(Livre livre)
    {
        return livreRepository.save(livre) ;
    }

    public Livre getBookByID(String id){
        return livreRepository.findBookById(id);
    }

    public void deleteBook(String id )
    {
        boolean exists = livreRepository.existsById(id);
        if (!exists)
        {
            throw new IllegalStateException("Book with  ID : "+id+"not found");
        }
        else {
        Livre livre = getBookByID(id);
        livreRepository.delete(livre);
        }
    }

    public Livre updateBook(String id, Livre livre)
    {
    	Livre j = livreRepository.findBookById(id);
    	j.setTitre(j.getTitre());
    	j.setAuteur(j.getAuteur());
    	j.setMaison_edition(j.getMaison_edition());
    	j.setEtat_livre(j.getEtat_livre());
    	j.setCategorie_livre(j.getCategorie_livre());
    	j.setUploaded_by(j.getUploaded_by());
    	j.setDonate(false);
        return livreRepository.save(j);
    }
}
