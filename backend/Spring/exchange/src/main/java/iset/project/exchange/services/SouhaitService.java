package iset.project.exchange.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iset.project.exchange.entities.ListeDeSouhaits;
import iset.project.exchange.repository.SouhaitRepository;

@Service
public class SouhaitService {
		@Autowired
		private SouhaitRepository souhaitRepository;

		public List<ListeDeSouhaits> getSouhaits(){
			return souhaitRepository.findAll();
		}
		
		public ListeDeSouhaits getSouhait(String id) {
			return souhaitRepository.findSouhaitById(id);
		}
		public ListeDeSouhaits addSouhait(ListeDeSouhaits s) {
			return souhaitRepository.save(s);
		}
		public ListeDeSouhaits updateSouhait(ListeDeSouhaits s) {
			return souhaitRepository.save(s);
		}
		
		public void deleteSouhait(String id) {
			ListeDeSouhaits s = getSouhait(id);
			souhaitRepository.delete(s);
		}
}
