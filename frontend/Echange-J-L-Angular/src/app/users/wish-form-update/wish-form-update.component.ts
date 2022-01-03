import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Navigation, Router } from '@angular/router';
import { RetirementService } from '../../services/retirement.service';
import { Wish } from '../../models/Wish';
import { CategorieWish } from '../../models/Categorie_wish';


@Component({
  selector: 'app-wish-form-update',
  templateUrl: './wish-form-update.component.html',
  styleUrls: ['./wish-form-update.component.css']
})
export class WishFormUpdateComponent implements OnInit {
  @ViewChild('f', { static: false }) addForm!: NgForm;
  constructor(private route:ActivatedRoute, private service: RetirementService) {

   }
   cat!:CategorieWish;
  stat = false;
  id:String = "";
  type:String = "";
  wish: Wish = new Wish();
  updateState = "";
  ngOnInit(): void {
    this.id = decodeURIComponent(this.route.snapshot.queryParams['id']) || "";

    if (this.id!="") {
      this.service.getWish(this.id).subscribe((res:any) => {
        this.wish.description = res.description;
        this.wish.quantite = res.quantite;
        this.wish.categorie_wish = res.categorie_wish;
      });
  }

  if(localStorage.getItem("status")=="True"){
    this.stat=true;
  }
}
  onSubmit(e:any) {
      this.wish.description=this.addForm.value.description;
      this.wish.quantite=this.addForm.value.quantite ;
      this.wish.categorie_wish=this.addForm.value.categorie_wish;
      console.log(this.wish); 
      this.service.updateWish(this.wish.id, this.wish).subscribe(res => {this.updateState = "success"}, error=>{this.updateState = "failed"});
    }



}
