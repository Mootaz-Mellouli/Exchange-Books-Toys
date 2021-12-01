package iset.project.exchange.services;

import iset.project.exchange.entities.Livre;
import iset.project.exchange.entities.Utilisateur;
import iset.project.exchange.repository.JouetRepository;
import iset.project.exchange.repository.LivreRepository;
import iset.project.exchange.repository.UtilisateurRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class LivreService {

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
        livreRepository.deleteById(id);
    }

    public Livre updateBook(Livre livre)
    {
        return livreRepository.save(livre);
    }
}
