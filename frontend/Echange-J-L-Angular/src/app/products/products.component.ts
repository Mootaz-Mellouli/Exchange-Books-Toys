import { Component, OnInit } from '@angular/core';
import { Jouet } from '../models/Jouet';
import { AssociationService } from '../services/association.service';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  public BooksList: any = [];
  public toys: any = [];
  constructor(
    private associationService: AssociationService ,
    private userService: UserService
  ) { }

  ngOnInit(): void {
    this.associationService.getAllBooks().subscribe(
      res => this.BooksList = res
    );


    this.userService.getAllToys().subscribe(
      data =>
      {
      console.log(data);
      this.toys = data;
      }
  );


  }


}
