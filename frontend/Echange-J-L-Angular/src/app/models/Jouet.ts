import { CategorieJouet } from "./Categorie_jouet";
import { Etat } from "./Etat";
export class Jouet {

  id!: String;
  titre!: String;
  description!: String;
  etat_jouet!: Etat;
  categorie_jouet!: CategorieJouet;


}
