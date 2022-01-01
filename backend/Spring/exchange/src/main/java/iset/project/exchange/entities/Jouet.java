package iset.project.exchange.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document("jouet")
public class Jouet {
    @Id
    private String id ;
    @Indexed(unique = true)
    private String titre ;
    private String description ;
    private Etat etat_jouet ;
    private CategorieJouet categorie_jouet ;
    private String uploaded_by;
}
