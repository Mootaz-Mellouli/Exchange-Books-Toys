import { Component, Input, OnInit } from '@angular/core';
import { Jouet } from '../models/Jouet';
import { Livre } from '../models/Livre';
declare var $: any;
@Component({
  selector: 'app-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.css']
})
export class CardComponent implements OnInit {
  @Input('book') book!: Livre;
  @Input('toy') toy!: Jouet;
  type = "";
  uploader = false;
  data = [];
  constructor() { }

  ngOnInit(): void {
    if(this.book!=null){
      this.type="book";
    }else{
      this.type = "toy"
    }
    this.data = JSON.parse(localStorage.getItem("userData") || "");
    this.data.map((item: any)=>{
      if(item.username == this.book.uploaded_by){
        this.uploader = true;
      }else{
        this.uploader = false;
      }
    })
  }


}
