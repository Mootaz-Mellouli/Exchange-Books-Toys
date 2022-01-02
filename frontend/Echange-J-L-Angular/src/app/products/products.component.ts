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
  public data: any = [];
  public test: any;
  public itemCount: Number = 0;
  public inte: any = "";
  
  constructor(
    private associationService: AssociationService ,
    private userService: UserService
  ) { }

  ngOnInit(): void {
    this.associationService.getAllBooks().subscribe(
      res => {
        this.BooksList = res;
        this.BooksList.map((item:any)=>{
          item.type="book";
        });
        this.test = this.data.push(...this.BooksList);
        this.itemCount = this.test;
      }
    );

    this.userService.getAllToysREAL().subscribe(data =>{
      this.toys = data;
      this.toys.map((item:any)=>{
        item.type="toy";
      });
      this.test = this.data.push(...this.toys);
      this.itemCount = this.test;
    });
    console.log(this.test);
  }

  filterDataByType(e: any) {
    this.inte = e.target.value;
  }
  

}
