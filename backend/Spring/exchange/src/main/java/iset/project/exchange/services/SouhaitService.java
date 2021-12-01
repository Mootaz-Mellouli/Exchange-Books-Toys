package iset.project.exchange.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iset.project.exchange.entities.ListeDeSouhaits;
import iset.project.exchange.repository.SouhaitRepository;

@Service
public class SouhaitService {
		@Autowired
		private SouhaitRepository souhRep;

		public List<ListeDeSouhaits> getSouhaits(){
			return souhRep.findAll();
		}
		
		public ListeDeSouhaits getSouhait(String id) {
			return souhRep.findSouhaitById(id);
		}
		public ListeDeSouhaits addSouhait(ListeDeSouhaits s) {
			return souhRep.save(s);
		}
		public ListeDeSouhaits updateSouhait(ListeDeSouhaits s) {
			return souhRep.save(s);
		}
		
		public void deleteSouhait(String id) {
			ListeDeSouhaits s = getSouhait(id);
			souhRep.delete(s);
		}
}
