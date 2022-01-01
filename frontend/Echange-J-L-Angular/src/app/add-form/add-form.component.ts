import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { UserService } from '../services/user.service';
import { Livre } from '../models/Livre';
import { Jouet } from '../models/Jouet';

@Component({
  selector: 'app-add-form',
  templateUrl: './add-form.component.html',
  styleUrls: ['./add-form.component.css']
})
export class AddFormComponent implements OnInit {


  @ViewChild('f', { static: false }) addForm!: NgForm;
  BookSelection = false ;
  ToySelection = true ;
  submitted = false ;

  livre: Livre = new Livre();
  jouet: Jouet = new Jouet();


  constructor(private userService: UserService) { }
  stat = true;
  data = [];
  uploaded = "";
  ngOnInit (): void {
    if(localStorage.getItem("status")=="False"){
      this.stat=false;
      window.location.href="/"
    }
    else {
      this.data = JSON.parse(localStorage.getItem("userData") || "");
      this.data.map((item:any)=>{
        this.uploaded = item.username;
      });
    }
  }

  onSubmit(){
    this.livre.titre=this.addForm.value.Title ;
    this.livre.auteur=this.addForm.value.Author ;
    this.livre.maison_edition=this.addForm.value.PublishingHouse ;
    this.livre.categorie_livre=this.addForm.value.CategoryBook ;
    this.livre.etat_livre=this.addForm.value.ShapeBook ;
    this.livre.uploaded_by=this.uploaded;
    this.jouet.titre=this.addForm.value.Name;
    this.jouet.description=this.addForm.value.Description ;
    this.jouet.categorie_jouet=this.addForm.value.CategoryToy;
    this.jouet.etat_jouet=this.addForm.value.ShapeToy;
    this.jouet.uploaded_by=this.uploaded;
    console.log(this.addForm);
    if(this.livre.titre!=null)
    {
    this.saveBook();
    this.submitted=true;
    }
    else
    {
    this.saveToy();
    this.submitted=true;
    }
  }

  bookSelected(){
    this.BookSelection = true ;
    this.ToySelection = false ;
  }

  toySelected(){
    this.ToySelection = true ;
    this.BookSelection = false ;
  }


  saveBook(){
    this.userService.addBook(this.livre)
                    .subscribe(livre=> {console.log(livre);

                    });
  }
  saveToy(){
    this.userService.addToy(this.jouet)
                    .subscribe(jouet=> {console.log(jouet);

                    });
  }

}
