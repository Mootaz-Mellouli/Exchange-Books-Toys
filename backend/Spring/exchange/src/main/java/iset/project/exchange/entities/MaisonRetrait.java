package iset.project.exchange.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document("MaisonRetrait")
public class MaisonRetrait {
    @Id
    private String id;
    @Indexed(unique = true)
    private String nomEtablissement;
    private String matricule;
    private String numTel;
    private String email;
    private String motDePasse;
}
