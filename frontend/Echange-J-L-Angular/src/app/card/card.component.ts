import { Component, Input, OnInit } from '@angular/core';
import { NavigationExtras, Router } from '@angular/router';
import { Jouet } from '../models/Jouet';
import { Livre } from '../models/Livre';
import { AssociationService } from '../services/association.service';

declare var $: any;
@Component({
  selector: 'app-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.css']
})
export class CardComponent implements OnInit {
  @Input('book') book!: Livre;
  @Input('toy') toy!: Jouet;
  type = "";
  bookUploader = false;
  toyUploader = false;
  data:any= {};
  constructor(private assosciationService:AssociationService, private router:Router) { }

  ngOnInit(): void {
    this.data = JSON.parse(localStorage.getItem("userData") || "");
    if(this.book!=null){
      this.type = "book";
      if(this.data.username == this.book.uploaded_by){
        this.bookUploader = true;
      }else{
        this.bookUploader = false;
      }
    }
    else if(this.toy!=null){
      this.type = "toy";
      if(this.data.username == this.toy.uploaded_by){
        this.toyUploader = true;
      }else{
        this.toyUploader = false;
      }
    }
  }

  deleteToy(id: any){
    let title = "";
    this.assosciationService.getToy(id).subscribe((toy:any)=>{
      title = toy.titre;
      console.log(title);      
      if(confirm("Are you sure to delete: "+ title+"?")){
        this.assosciationService.deleteToy(id).subscribe(res => window.location.reload());
        console.log("Deleted, ID: "+id);
      }
    });
  }

  updateToy(id: any){
    let navigationExtras: NavigationExtras = {
      queryParams: {
          "id"   : encodeURIComponent(id),
          "type":"toy"
      }
  };
    this.router.navigate(["/users/editToy"], navigationExtras);
  }
  deleteBook(id: any){
    let title = "";
    console.log(id);
    
    this.assosciationService.getBook(id).subscribe((book:any)=>{
      title = book.titre;
      console.log(title);      
      if(confirm("Are you sure to delete: "+ title+"?")){
        this.assosciationService.deleteBook(id).subscribe(res => window.location.reload());
        console.log("Deleted, ID: "+id);
      }
    });
  }

  updateBook(id: any){
    let navigationExtras: NavigationExtras = {
      queryParams: {
          "id"   : encodeURIComponent(id),
          "type":"book"
      }
  };
    this.router.navigate(["/users/editToy"], navigationExtras);
  }
}
