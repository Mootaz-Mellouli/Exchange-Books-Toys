package iset.project.exchange.controller;

import iset.project.exchange.entities.Jouet;
import iset.project.exchange.services.JouetService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("jouet")
@AllArgsConstructor
public class JouetController {


        @Autowired
        private final JouetService jouetService;

        @RequestMapping("/")
        public List<Jouet> getAllToys()
        {
                return jouetService.getAllToys() ;
        }

        @PostMapping("/add")
        public Jouet addToy(@RequestBody Jouet jouet)
        {
                return jouetService.addToy(jouet) ;
        }
        @RequestMapping("/{id}")
        public Jouet findToyByID(@PathVariable("id") String id)
        {
                return jouetService.getToyByID(id);
        }
        @DeleteMapping({"/{id}"})
        public void deleteToy(@PathVariable("id") String id)
        {
                jouetService.deleteToy(id);
        }
        @PutMapping({"/{id}"})
        public Jouet updateToy(@RequestBody Jouet jouet)
        {
                return jouetService.updateToy(jouet);
        }
        }
