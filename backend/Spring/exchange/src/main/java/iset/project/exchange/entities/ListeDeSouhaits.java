package iset.project.exchange.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document("listeDeSouhaits")
public class ListeDeSouhaits {
    @Id
   private String id ;
   private ListeDeSouhaitsOptions options ;
   private CategorieJouet categorieJouet ;
   private CategorieLivre categorieLivre ;
   private String Description ;

}
