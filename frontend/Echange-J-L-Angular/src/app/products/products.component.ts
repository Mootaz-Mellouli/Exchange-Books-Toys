import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { Livre } from "../models/Livre"


@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  public BooksList: Livre[] = [];
  constructor(
    private httpClient: HttpClient
  ) { }
    
  ngOnInit(): void {
    this.getBooks();
  }
  getBooks(){
    this.httpClient.get<any>('http://localhost:8080/livre/').subscribe(
      response => {
        console.log(response);
        this.BooksList = response;
      }
    )
    
  }

}
