package iset.project.exchange.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document("utilisateur")
public class Utilisateur {
    @Id
    private String id ;
    private String nom ;
    private String prenom ;
    @Indexed(unique = true)
    private String email ;
    private String numeroTel;
    private String cin ;
    private Adresse adresse ;
    private String password ;
}
