import { Component, OnInit } from '@angular/core';
import { AssociationService } from '../services/association.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  public BooksList: any = [];
  constructor(
    private associationService: AssociationService
  ) { }
    
  ngOnInit(): void {
    this.associationService.getAllBooks().subscribe(
      res => this.BooksList = res           
    );
  }


}
