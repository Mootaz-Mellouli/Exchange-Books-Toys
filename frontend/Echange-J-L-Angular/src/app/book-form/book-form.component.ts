import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Navigation, Router } from '@angular/router';
import { CategorieJouet } from '../models/Categorie_jouet';
import { Etat } from '../models/Etat';
import { Jouet } from '../models/Jouet';
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
  toy: Jouet = new Jouet();
  updateState = "";
  ngOnInit (): void {
    this.id = decodeURIComponent(this.route.snapshot.queryParams['id']) || "";
    
    if(this.id!=""){
      this.service.getToy(this.id).subscribe((res:any) => {
        this.toy.id = res.id;
        this.toy.titre = res.titre;
        this.toy.categorie_jouet = res.categorie_jouet;
        this.toy.description = res.description;
        this.toy.etat_jouet = res.etat_jouet;
        this.toy.uploaded_by = res.uploaded_by;
      });
    }else {
      console.log("no id");
    }
    

    if(localStorage.getItem("status")=="True"){
      this.stat=true;
    }
  }
  onSubmit(e:any){

    this.toy.titre=this.addForm.value.titre;
    this.toy.description=this.addForm.value.description ;
    this.toy.categorie_jouet=this.addForm.value.categorie;
    this.toy.etat_jouet=this.addForm.value.etat;
    this.service.updateToy(this.toy.id, this.toy).subscribe(res => {this.updateState = "success"}, error=>{this.updateState = "failed"});
  }

}
