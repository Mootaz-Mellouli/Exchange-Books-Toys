import { Component, OnInit } from '@angular/core';
import { Jouet } from '../models/Jouet';
import { Livre } from '../models/Livre';
import { UserService } from '../services/user.service';
import { NavigationExtras, Router } from '@angular/router';
import { AssociationService } from '../services/association.service';


@Component({
  selector: 'app-products-donation',
  templateUrl: './products-donation.component.html',
  styleUrls: ['./products-donation.component.css']
})
export class ProductsDonationComponent implements OnInit {
  books!: Livre[];
  book!:Livre ;
  toys!: Jouet[];
  toy!:Jouet;
  BookSelection = true ;
  ToySelection = false ;
  constructor(private userService: UserService, private router:Router,private assosciationService:AssociationService) {}

  ngOnInit(): void {
    this.userService.getAllToys().subscribe(data =>{
      console.log(data);
      this.toys = data;
  });
  this.userService.getAllBooks().subscribe(data =>{
    console.log(data);
    this.books = data;
});
  }

  bookSelected(){
    this.BookSelection = true ;
    this.ToySelection = false ;
  }
  toySelected(){
    this.ToySelection = true ;
    this.BookSelection = false ;
  }

  updateToy(id: any){
    let navigationExtras: NavigationExtras = {
      queryParams: {
          "id"   : encodeURIComponent(id),
      }
  };
    this.router.navigate(["/users/editToy"], navigationExtras);
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

}
