import { CategorieLivre } from "./Categorie_livre";
import { Etat } from "./Etat";
export class Livre {

        id!: String;
        titre!: String;
        auteur!: String;
        maison_edition!: String;
        etat_livre!: Etat;
        categorie_livre!: CategorieLivre;
        uploaded_by!: String;

}
