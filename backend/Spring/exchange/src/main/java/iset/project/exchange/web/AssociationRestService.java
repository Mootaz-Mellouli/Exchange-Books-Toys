package iset.project.exchange.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import iset.project.exchange.entities.Association;
import iset.project.exchange.repository.AssociationRepository;

@RestController
@RequestMapping("Association")
public class AssociationRestService {
	@Autowired
	AssociationRepository ar;
	
	@RequestMapping("/")
	public ResponseEntity<List<Association>> getAssociations(){
		return new ResponseEntity<>(ar.findAll(), HttpStatus.OK);
	}
	
	@PostMapping("/add")
	public ResponseEntity<Association> addAssociation(@RequestBody Association ass){
		return new ResponseEntity<>(ar.save(ass), HttpStatus.CREATED);
	}
	
	@RequestMapping("/{id}")
	public ResponseEntity<Association> getAssociationById(@PathVariable("id") String id) {
		Association ass = ar.findAssociationById(id);
		return new ResponseEntity<>(ass, HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteAssociation(@PathVariable("id") String id) {
		ar.deleteById(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Association> updateAssociation(@PathVariable("id") String id, @RequestBody Association ass){
		return new ResponseEntity<>(ar.save(ass), HttpStatus.OK);
	}
	
	
}
