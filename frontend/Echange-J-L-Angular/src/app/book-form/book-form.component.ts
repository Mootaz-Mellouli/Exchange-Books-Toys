import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Navigation, Router } from '@angular/router';
import { CategorieJouet } from '../models/Categorie_jouet';
import { Etat } from '../models/Etat';
import { Jouet } from '../models/Jouet';
import { Livre } from '../models/Livre';
import { AssociationService } from '../services/association.service';

@Component({
  selector: 'app-book-form',
  templateUrl: './book-form.component.html',
  styleUrls: ['./book-form.component.css']
})
export class BookFormComponent implements OnInit {
  @ViewChild('f', { static: false }) addForm!: NgForm;
  constructor(private route:ActivatedRoute, private service: AssociationService) { 

  }
  etat!:Etat;
  cat!:CategorieJouet;
  stat = false;
  id:String = "";
  type:String = "";
  toy: Jouet = new Jouet();
  book: Livre = new Livre();
  updateState = "";
  ngOnInit (): void {
    this.id = decodeURIComponent(this.route.snapshot.queryParams['id']) || "";
    this.type = this.route.snapshot.queryParams['type'] || "";
    console.log("EDIT TYPE: "+this.type);
    
    if(this.id!="" && this.type == 'toy'){
      this.service.getToy(this.id).subscribe((res:any) => {
        this.toy.id = res.id;
        this.toy.titre = res.titre;
        this.toy.categorie_jouet = res.categorie_jouet;
        this.toy.description = res.description;
        this.toy.etat_jouet = res.etat_jouet;
        this.toy.donate = res.donate;
        this.toy.uploaded_by = res.uploaded_by;
      });
    }else if(this.id!="" && this.type == 'book'){
      this.service.getBook(this.id).subscribe((res:any) => {
        this.book.id = res.id;
        this.book.titre = res.titre;
        this.book.auteur = res.auteur;
        this.book.maison_edition = res.auteur;
        this.book.etat_livre = res.etat_livre;
        this.book.categorie_livre = res.categorie_livre;
        this.book.donate = res.donate;
        this.book.uploaded_by = res.uploaded_by;
      });
    } else {
      console.log("ERROR");
      
    }
    

    if(localStorage.getItem("status")=="True"){
      this.stat=true;
    }
  }
  onSubmit(e:any){
    if(this.type=="toy") {
      this.toy.titre=this.addForm.value.titre;
      this.toy.description=this.addForm.value.description ;
      this.toy.categorie_jouet=this.addForm.value.categorie;
      this.toy.etat_jouet=this.addForm.value.etat;
      this.addForm.value.donate=="Exchange"?this.toy.donate=false:this.toy.donate=true;
      this.toy.uploaded_by = this.addForm.value.uploaded_by;
      console.log(this.toy);
      
      this.service.updateToy(this.toy.id, this.toy).subscribe(res => {this.updateState = "success"}, error=>{this.updateState = "failed"});
    } else {
        this.book.titre=this.addForm.value.titre;
        this.book.auteur=this.addForm.value.auteur ;
        this.book.maison_edition=this.addForm.value.maison_edition;
        this.book.etat_livre=this.addForm.value.etat;
        this.book.categorie_livre=this.addForm.value.categorie;
        this.book.uploaded_by = this.addForm.value.uploaded_by;
        this.addForm.value.donate=="Exchange"?this.book.donate=false:this.book.donate=true;
        console.log(this.addForm.value);
        this.service.updateBook(this.book.id, this.book).subscribe(res => {this.updateState = "success"}, error=>{this.updateState = "failed"});

    }
  }

}
