package iset.project.exchange.services;

import iset.project.exchange.entities.Livre;
import iset.project.exchange.entities.Utilisateur;
import iset.project.exchange.repository.LivreRepository;
import iset.project.exchange.repository.UtilisateurRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class UtilisateurService {

    @Autowired
    private final UtilisateurRepository utilisateurRepository;


    public List<Utilisateur> getAllUsers()
    {
        return utilisateurRepository.findAll();
    }

    public Utilisateur addUser(Utilisateur livre)
    {
        return utilisateurRepository.save(livre) ;
    }

    public Utilisateur getUserByID(String id){
        return utilisateurRepository.findUserById(id);
    }

    public void deleteUser(String id )
    {
        boolean exists = utilisateurRepository.existsById(id);
        if (!exists)
        {
            throw new IllegalStateException("User with  ID : "+id+"not found");
        }
        else {
            Utilisateur user = getUserByID(id);
            utilisateurRepository.delete(user);
        }
    }

    public Utilisateur updateUser(Utilisateur user)
    {

        return utilisateurRepository.save(user);
    }
}
