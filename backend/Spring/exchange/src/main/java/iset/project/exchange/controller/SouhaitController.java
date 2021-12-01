package iset.project.exchange.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import iset.project.exchange.entities.ListeDeSouhaits;
import  iset.project.exchange.services.SouhaitService;

@RestController
@RequestMapping("Souhait")
public class SouhaitController {
	@Autowired
	SouhaitService SouhaitService;
	
	@GetMapping("/")
	public List<ListeDeSouhaits> getSouhaits(){
		return SouhaitService.getSouhaits();
	}
	
	@PostMapping("/add")
	public ListeDeSouhaits addSouhait(@RequestBody ListeDeSouhaits s){
		return SouhaitService.addSouhait(s);
	}
	
	@GetMapping("/{id}")
	public ListeDeSouhaits getSouhait(@PathVariable("id") String id) {
		return SouhaitService.getSouhait(id);
	}
	
	
	@DeleteMapping("/{id}")
	public void deleteAssociation(@PathVariable("id") String id) {
		SouhaitService.deleteSouhait(id);
	}
	
	@PutMapping("/{id}")
	public ListeDeSouhaits updateSouhait(@RequestBody ListeDeSouhaits s){
		return SouhaitService.updateSouhait(s);
	}
	
	
	
}

