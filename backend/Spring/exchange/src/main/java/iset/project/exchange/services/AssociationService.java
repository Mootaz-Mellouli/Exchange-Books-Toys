package iset.project.exchange.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iset.project.exchange.entities.Association;
import iset.project.exchange.repository.AssociationRepository;
import lombok.AllArgsConstructor;

@Service
public class AssociationService {
	@Autowired
	 private AssociationRepository assRep;
	
	public List<Association> getAssociations(){
		return assRep.findAll();
	}
	
	public Association getAssociation(String id) {
		return assRep.findAssociationById(id);
	}
	public Association addAssociation(Association a) {
		return assRep.save(a);
	}
	public Association updateAssociation(Association a) {
		return assRep.save(a);
	}
	
	public void deleteAssociation(String id) {
		Association ass = getAssociation(id);
		assRep.delete(ass);
	}
}
