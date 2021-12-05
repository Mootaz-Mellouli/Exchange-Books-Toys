import { CategorieLivre } from "./Categorie_livre";
import { Etat } from "./Etat";
export class Livre {
    constructor(
        id: String,
        titre: String,
        auteur: String,
        maison_edition: String,
        prix_livre: String,
        etat_livre: Etat,
        categorie_livre: CategorieLivre,
        image_livre: String
    ){ }
}