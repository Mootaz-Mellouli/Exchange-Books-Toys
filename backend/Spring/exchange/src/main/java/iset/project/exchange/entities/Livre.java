package iset.project.exchange.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document("livre")
public class Livre {
    @Id
    private String id ;
    @Indexed(unique = true)
    private String titre ;
    private String auteur ;
    private String maison_edition;
    private String prix_livre ;
    private Etat etat_livre ;
    private CategorieLivre categorie_livre;

}
