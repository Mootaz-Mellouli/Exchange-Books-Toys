package com.example.exchange_and_donate.entities;

public class Livre {

    private String id ;
    private String titre ;
    private String auteur ;
    private String maison_edition;
    private String etat_livre ;
    private String categorie_livre;
    private String uploaded_by;
    private Boolean donate ;

    public Livre(String id, String titre, String auteur, String maison_edition, String etat_livre, String categorie_livre, String uploaded_by, Boolean donate) {
        this.id = id;
        this.titre = titre;
        this.auteur = auteur;
        this.maison_edition = maison_edition;
        this.etat_livre = etat_livre;
        this.categorie_livre = categorie_livre;
        this.uploaded_by = uploaded_by;
        this.donate = donate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public String getMaison_edition() {
        return maison_edition;
    }

    public void setMaison_edition(String maison_edition) {
        this.maison_edition = maison_edition;
    }

    public String getEtat_livre() {
        return etat_livre;
    }

    public void setEtat_livre(String etat_livre) {
        this.etat_livre = etat_livre;
    }

    public String getCategorie_livre() {
        return categorie_livre;
    }

    public void setCategorie_livre(String categorie_livre) {
        this.categorie_livre = categorie_livre;
    }

    public String getUploaded_by() {
        return uploaded_by;
    }

    public void setUploaded_by(String uploaded_by) {
        this.uploaded_by = uploaded_by;
    }

    public Boolean getDonate() {
        return donate;
    }

    public void setDonate(Boolean donate) {
        this.donate = donate;
    }
}
