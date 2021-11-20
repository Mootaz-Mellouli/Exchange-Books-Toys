package iset.project.exchange.entities;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Document
public class Association {
	@Id
	private String id;
	
	private String nom_association;
	private String matricule;
	private String num_tel;
	private String email;
	private String mot_de_passe;
}

