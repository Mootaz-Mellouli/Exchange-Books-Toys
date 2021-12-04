package iset.project.exchange.controller;

import iset.project.exchange.entities.Livre;
import iset.project.exchange.entities.VillageEnfant;
import iset.project.exchange.services.LivreService;
import iset.project.exchange.services.VillageEnfantService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("villageEnfant")
@AllArgsConstructor
public class VillageEnfantController {

    @Autowired
    private final VillageEnfantService villageEnfantService;

    @RequestMapping("/")
    public List<VillageEnfant> getAllChildrenVillages()
    {
        return villageEnfantService.getAllChildrenVillage() ;
    }

    @PostMapping("/add")
    public VillageEnfant addChildrenVillage(@RequestBody VillageEnfant villageEnfant)
    {
        return villageEnfantService.saveChildrenVillage(villageEnfant) ;
    }
    @RequestMapping("/{id}")
    public VillageEnfant findChildrenVillage(@PathVariable("id") String id)
    {
        return villageEnfantService.getChildrenVillageByID(id);
    }
    @DeleteMapping({"/{id}"})
    public void deleteChildrenVillage(@PathVariable("id") String id)
    {
        villageEnfantService.deleteChildrenVillage(id);
    }
    @PutMapping({"/{id}"})
    public VillageEnfant updateChildrenVillage(@RequestBody VillageEnfant villageEnfant)
    {
        return villageEnfantService.updateChildrenVillage(villageEnfant);
    }
}
