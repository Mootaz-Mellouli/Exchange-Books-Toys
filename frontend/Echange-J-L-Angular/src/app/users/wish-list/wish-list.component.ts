import { Component, Input, OnInit } from '@angular/core';
import { RetirementService } from '../../services/retirement.service';

@Component({
  selector: 'app-wish-list',
  templateUrl: './wish-list.component.html',
  styleUrls: ['./wish-list.component.css']
})
export class WishListComponent implements OnInit {
  public WishList: any = [];
  public data: any = [];
  public test: any;
  public itemCount: Number = 0;
  public inte: any = "";



  constructor(private retirementService: RetirementService) { }

  ngOnInit(): void {
    this.retirementService.getAllWish().subscribe(
      res => {
        this.WishList = res;
        this.WishList.map((item:any)=>{
          item.type="book";
        });
        this.test = this.data.push(...this.WishList);
        this.itemCount = this.test;
      }
    );
  }

}
