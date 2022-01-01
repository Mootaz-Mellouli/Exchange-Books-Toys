import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-book-form',
  templateUrl: './book-form.component.html',
  styleUrls: ['./book-form.component.css']
})
export class BookFormComponent implements OnInit {

  constructor() { }
  stat = true;

  ngOnInit (): void {
    if(localStorage.getItem("status")=="False"){
      this.stat=false;
      window.location.href="/"
    }
  }

}
