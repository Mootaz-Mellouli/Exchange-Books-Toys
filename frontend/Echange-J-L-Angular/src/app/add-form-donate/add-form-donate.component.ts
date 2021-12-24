import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';


@Component({
  selector: 'app-add-form-donate',
  templateUrl: './add-form-donate.component.html',
  styleUrls: ['./add-form-donate.component.css']
})
export class AddFormDonateComponent implements OnInit {

  BookSelection = false ;
  ToySelection = true ;
  onSubmit(form: NgForm){
    console.log(form);
  }

  bookSelected(){
    this.BookSelection = true ;
    this.ToySelection = false ;
  }

  toySelected(){
    this.ToySelection = true ;
    this.BookSelection = false ;
  }

  constructor() { }

  ngOnInit(): void {
  }

}
