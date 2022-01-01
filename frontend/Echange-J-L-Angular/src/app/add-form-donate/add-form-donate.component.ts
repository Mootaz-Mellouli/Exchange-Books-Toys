import { Component, OnInit,ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { UserService } from '../services/user.service';
import { Livre } from '../models/Livre';
import { Jouet } from '../models/Jouet';


@Component({
  selector: 'app-add-form-donate',
  templateUrl: './add-form-donate.component.html',
  styleUrls: ['./add-form-donate.component.css']
})
export class AddFormDonateComponent implements OnInit {

  @ViewChild('f', { static: false }) addForm!: NgForm;
  BookSelection = false ;
  ToySelection = true ;


  bookSelected(){
    this.BookSelection = true ;
    this.ToySelection = false ;
  }

  toySelected(){
    this.ToySelection = true ;
    this.BookSelection = false ;
  }

  livre: Livre = new Livre();
  jouet: Jouet = new Jouet();

  constructor(private userService: UserService) { }

  ngOnInit(): void {
  }
  onSubmit(){
    this.livre.titre=this.addForm.value.Title ;
    this.livre.auteur=this.addForm.value.Author ;
    this.livre.maison_edition=this.addForm.value.PublishingHouse ;
    this.livre.categorie_livre=this.addForm.value.CategoryBook ;
    this.livre.etat_livre=this.addForm.value.ShapeBook ;
    this.jouet.titre=this.addForm.value.Name;
    this.jouet.description=this.addForm.value.Description ;
    this.jouet.categorie_jouet=this.addForm.value.CategoryToy;
    this.jouet.etat_jouet=this.addForm.value.ShapeToy;
    this.jouet.donate=true;
    this.livre.donate=true;
    console.log(this.addForm);
    if(this.livre.titre!=null)
    {
      this.saveBook();

    }
    else
    {
      this.saveToy();

    }
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
