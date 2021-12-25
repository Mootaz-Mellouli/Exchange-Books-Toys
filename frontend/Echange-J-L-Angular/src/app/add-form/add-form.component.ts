import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { UserService } from '../services/user.service';

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


  constructor(private userService: UserService) { }


  ngOnInit(): void {
    this.userService.post(this.addForm.value).subscribe(
     res => {console.log(res)}
    );
  }

  onSubmit(){
    this.book.title=this.addForm.value.Title ;
    this.book.author=this.addForm.value.Author ;
    this.book.publishingHouse=this.addForm.value.PublishingHouse ;
    this.book.category=this.addForm.value.CategoryBook ;
    this.book.shapeBook=this.addForm.value.ShapeBook ;
    this.toy.name=this.addForm.value.Name;
    this.toy.description=this.addForm.value.Description ;
    this.toy.category=this.addForm.value.CategoryToy;
    this.toy.shapeToy=this.addForm.value.ShapeToy;
    console.log(this.addForm);
  }

  bookSelected(){
    this.BookSelection = true ;
    this.ToySelection = false ;
  }

  toySelected(){
    this.ToySelection = true ;
    this.BookSelection = false ;
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
