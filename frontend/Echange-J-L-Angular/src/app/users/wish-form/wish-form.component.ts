import { Component, OnInit, ViewChild } from '@angular/core';
import { Wish } from '../../models/Wish';
import { RetirementService } from '../../services/retirement.service';
import { NgForm } from '@angular/forms';


@Component({
  selector: 'app-wish-form',
  templateUrl: './wish-form.component.html',
  styleUrls: ['./wish-form.component.css']
})
export class WishFormComponent implements OnInit {

  @ViewChild('f', { static: false }) addForm!: NgForm;

  submitted = false ;

  wish: Wish = new Wish();


  constructor(private retirementService: RetirementService) { }
  stat = true;
  data = [];
  uploaded = "";
  post = "";

  ngOnInit(): void {
    if(localStorage.getItem("status")=="False"){
      this.stat=false;
      window.location.href="/"
    }
    else {
      this.data = JSON.parse(localStorage.getItem("userData") || "");
      this.data.map((item:any)=>{
        this.uploaded = item.username;
      });
    }
  }

  onSubmit(){
    this.wish.description=this.addForm.value.DescriptionWish ;
    this.wish.categorie_wish=this.addForm.value.CategoryWish ;
    this.wish.quantite=this.addForm.value.QuantityWish ;
    console.log(this.wish.quantite);
    if(this.wish.categorie_wish!=null)
    {
    this.saveWish();
    this.submitted=true;
    }

  }
  saveWish(){
    this.retirementService.addWish(this.wish)
                    .subscribe(wish=> {this.post="success"}, err=>{this.post="failed"})};

}
