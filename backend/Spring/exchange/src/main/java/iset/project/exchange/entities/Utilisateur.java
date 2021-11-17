package iset.project.exchange.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document
public class Utilisateur {
    @Id
    private Integer id ;
    private String nom ;
    private String prenom ;
    @Indexed(unique = true)
    private String email ;
    private int numeroTel;
    private int cin ;
    private String adresse ;
    private String password ;
}
