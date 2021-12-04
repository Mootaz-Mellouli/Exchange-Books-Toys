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
import iset.project.exchange.entities.Association;
import iset.project.exchange.services.AssociationService;

@RestController
@RequestMapping("Association")
public class AssociationController {
	@Autowired
	AssociationService AssService;

	@GetMapping("/")
	public List<Association> getAssociations() {
		return AssService.getAssociations();
	}

	@PostMapping("/add")
	public Association addAssociation(@RequestBody Association ass) {
		return AssService.addAssociation(ass);
	}

	@GetMapping("/{id}")
	public Association getAssociationById(@PathVariable("id") String id) {
		return AssService.getAssociationByID(id);
	}

	@DeleteMapping("/{id}")
	public void deleteAssociation(@PathVariable("id") String id) {
		AssService.deleteAssociation(id);
	}

	@PutMapping("/{id}")
	public Association updateAssociation(@RequestBody Association ass) {
		return AssService.updateAssociation(ass);
	}

}
