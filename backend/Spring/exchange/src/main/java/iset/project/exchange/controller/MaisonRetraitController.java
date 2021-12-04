package iset.project.exchange.controller;

import iset.project.exchange.entities.Livre;
import iset.project.exchange.entities.MaisonRetrait;
import iset.project.exchange.services.LivreService;
import iset.project.exchange.services.MaisonRetraitService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("maisonRetrait")
@AllArgsConstructor
public class MaisonRetraitController {
    @Autowired
    private final MaisonRetraitService maisonRetraitService;

    @RequestMapping("/")
    public List<MaisonRetrait> getAllRetirmentHome()
    {
        return maisonRetraitService.getAllRetirementHome() ;
    }

    @PostMapping("/add")
    public MaisonRetrait saveRetirmentHome(@RequestBody MaisonRetrait maisonRetrait)
    {
        return maisonRetraitService.saveRetirementHome(maisonRetrait) ;
    }
    @RequestMapping("/{id}")
    public MaisonRetrait findRetirmentHomeByID(@PathVariable("id") String id)
    {
        return maisonRetraitService.getRetirementHomeByID(id);
    }
    @DeleteMapping({"/{id}"})
    public void deleteRetirmentHome(@PathVariable("id") String id)
    {
        maisonRetraitService.deleteRetirementHome(id);
    }
    @PutMapping({"/{id}"})
    public MaisonRetrait updateRetirmentHome(@RequestBody MaisonRetrait maisonRetrait)
    {
        return maisonRetraitService.updateRetirementHome(maisonRetrait);
    }
}
