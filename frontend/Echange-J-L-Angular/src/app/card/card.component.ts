import { Component, Input, OnInit } from '@angular/core';
import { Jouet } from '../models/Jouet';

@Component({
  selector: 'app-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.css']
})
export class CardComponent implements OnInit {
  @Input('book') book: any;
  @Input('toy') toy!: Jouet;
  constructor() { }

  ngOnInit(): void {

  }

}
