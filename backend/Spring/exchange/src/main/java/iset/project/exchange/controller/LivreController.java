package iset.project.exchange.controller;

import iset.project.exchange.entities.Livre;
import iset.project.exchange.entities.Utilisateur;
import iset.project.exchange.services.LivreService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("livre")
@AllArgsConstructor
public class LivreController {

    @Autowired
    private final LivreService livreService ;

    @RequestMapping("/")
    public List<Livre> getAllBooks()
    {
        return livreService.getAllBooks() ;
    }

    @PostMapping("/add")
    public Livre saveBook(@RequestBody Livre livre)
    {
        return livreService.saveBook(livre) ;
    }
    @RequestMapping("/{id}")
    public Livre findBookByID(@PathVariable("id") String id)
    {
        return livreService.getBookByID(id);
    }
    @DeleteMapping({"/{id}"})
    public void deleteBook(@PathVariable("id") String id)
    {
        livreService.deleteBook(id);
    }
    @PutMapping({"/{id}"})
    public Livre updateBook(@RequestBody Livre livre)
    {
        return livreService.updateBook(livre);
    }
}
