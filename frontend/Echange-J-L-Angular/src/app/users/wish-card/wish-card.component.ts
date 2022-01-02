import { Component, Input, OnInit } from '@angular/core';
import { Wish } from '../../models/Wish';
import { NavigationExtras, Router } from '@angular/router';
import { RetirementService } from '../../services/retirement.service';

declare var $: any;
@Component({
  selector: 'app-wish-card',
  templateUrl: './wish-card.component.html',
  styleUrls: ['./wish-card.component.css']
})
export class WishCardComponent implements OnInit {
  @Input('wish') wish!: Wish;
  
  wishUploader = false;
  data:any= {};

  constructor(private retirementService:RetirementService,private router:Router) { }

  ngOnInit(): void {
    this.data = JSON.parse(localStorage.getItem("userData") || ""); 
}

deleteWish(id: any){    
    if(confirm("Are you sure to delete: ?")){
      this.retirementService.deleteWish(id).subscribe(res => window.location.reload());
      console.log("Deleted, ID: "+id);
    }
  };

  updateWish(id: any){
    let navigationExtras: NavigationExtras = {
      queryParams: {
          "id"   : encodeURIComponent(id),
      }
  };
    this.router.navigate([""], navigationExtras);
  }
}
