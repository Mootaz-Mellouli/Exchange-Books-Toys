package com.example.exchange_and_donate.entities;

public class Jouet {
    private String id ;
    private String titre ;
    private String description ;
    private String etat_jouet ;
    private String categorie_jouet ;
    private String uploaded_by;
    private Boolean donate  ;

    public Jouet(String id, String titre, String description, String etat_jouet, String categorie_jouet, String uploaded_by, Boolean donate) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.etat_jouet = etat_jouet;
        this.categorie_jouet = categorie_jouet;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEtat_jouet() {
        return etat_jouet;
    }

    public void setEtat_jouet(String etat_jouet) {
        this.etat_jouet = etat_jouet;
    }

    public String getCategorie_jouet() {
        return categorie_jouet;
    }

    public void setCategorie_jouet(String categorie_jouet) {
        this.categorie_jouet = categorie_jouet;
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

