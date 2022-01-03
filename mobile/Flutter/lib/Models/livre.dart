class Livre {
 final String? id;
  final String? titre;
  final String? auteur;
  final  String? maisonEdition;
  final String? etatLivre;
   final String? categorieLivre;

  Livre(this.id, this.titre, this.auteur, this.maisonEdition, this.etatLivre,
      this.categorieLivre, );

  Livre.constructor(
      {
        this.id,
        this.titre,
        this.auteur,
        this.maisonEdition,
        this.etatLivre,
        this.categorieLivre
      });

  factory Livre.fromJson(Map<String, dynamic> json){
    return Livre.constructor(
      id:json['id'] as String ,
      titre: json['titre'] as String ,
      auteur: json['auteur'] as String ,
      maisonEdition: json['maisonEdition'] as String ,
      etatLivre: json['etatLivre'] as String,
      categorieLivre: json['categorieLivre'] as String
    );
  }
}