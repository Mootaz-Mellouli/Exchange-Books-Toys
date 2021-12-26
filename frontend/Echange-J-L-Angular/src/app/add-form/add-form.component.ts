import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { UserService } from '../services/user.service';
import { Livre } from '../models/Livre';

@Component({
  selector: 'app-add-form',
  templateUrl: './add-form.component.html',
  styleUrls: ['./add-form.component.css']
})
export class AddFormComponent implements OnInit {


  @ViewChild('f', { static: false }) addForm!: NgForm;
  BookSelection = false ;
  ToySelection = true ;
  book={
    title : '',
    author : ' ',
    publishingHouse: '',
    category:'',
    shapeBook:''
  };
  toy={
    name:'',
    description:'',
    category:'',
    shapeToy:''
  };
  submitted = false ;
  livre: Livre = new Livre();


  constructor(private userService: UserService) { }


  ngOnInit(): void {

  }

  onSubmit(){
    this.livre.titre=this.addForm.value.Title ;
    this.livre.auteur=this.addForm.value.Author ;
    this.livre.maison_edition=this.addForm.value.PublishingHouse ;
    this.livre.categorie_livre=this.addForm.value.CategoryBook ;
    this.livre.etat_livre=this.addForm.value.ShapeBook ;
    this.toy.name=this.addForm.value.Name;
    this.toy.description=this.addForm.value.Description ;
    this.toy.category=this.addForm.value.CategoryToy;
    this.toy.shapeToy=this.addForm.value.ShapeToy;
    console.log(this.addForm);
    this.save();
  }

  bookSelected(){
    this.BookSelection = true ;
    this.ToySelection = false ;
  }

  toySelected(){
    this.ToySelection = true ;
    this.BookSelection = false ;
  }


  save(){
    this.userService.addBook(this.livre)
                    .subscribe(livre=> {console.log(livre);

                    });
  }
  // onCreatePost(postData:{Title:String; Author:String;})
  // {
  //   this.http
  //     .post(
  //       'http://localhost:8080/livre/add',
  //       postData
  //     )
  //     .subscribe(responseData => {
  //       console.log(responseData);
  //     });
  // }
}
