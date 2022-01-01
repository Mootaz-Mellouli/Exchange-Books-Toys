import { Component, OnInit } from '@angular/core';
import { Jouet } from '../models/Jouet';
import { Livre } from '../models/Livre';
import { UserService } from '../services/user.service';

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
  constructor(private userService: UserService) {}

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

}
