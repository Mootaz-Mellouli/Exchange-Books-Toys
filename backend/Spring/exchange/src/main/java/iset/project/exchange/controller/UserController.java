package iset.project.exchange.controller;


import iset.project.exchange.entities.Utilisateur;
import iset.project.exchange.services.UtilisateurService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("user")
@AllArgsConstructor
public class UserController {

    @Autowired
    UtilisateurService utilisateurService ;

    @RequestMapping("/")
    public List<Utilisateur> getAllUsers()
    {
        return utilisateurService.getAllUsers() ;
    }

    @PostMapping("/add")
    public Utilisateur saveUser(@RequestBody Utilisateur utilisateur)
    {
        return utilisateurService.addUser(utilisateur) ;
    }
    @RequestMapping("/{id}")
    public Utilisateur findUserByID(@PathVariable("id") String id)
    {
        return utilisateurService.getUserByID(id);
    }
    @DeleteMapping({"/{id}"})
    public void deleteUser(@PathVariable("id") String id)
    {
        utilisateurService.deleteUser(id);
    }
    @PutMapping({"/{id}"})
    public Utilisateur updateUser(@RequestBody Utilisateur utilisateur)
    {
        return utilisateurService.updateUser(utilisateur);
    }
}
