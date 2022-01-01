import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UsersRoutingModule } from './users-routing.module';
import { UsersComponent } from './users.component';
import { AddFormComponent } from '../add-form/add-form.component';
import { FormsModule } from '@angular/forms';
import { ProductsComponent } from '../products/products.component';
import { CardComponent } from '../card/card.component';
import {SortByTypePipe} from '../pipes/sort-by-type.pipe'
import { AddFormDonateComponent } from '../add-form-donate/add-form-donate.component';
import { HttpClientModule } from '@angular/common/http';


@NgModule({
  declarations: [
    UsersComponent,
    AddFormComponent,
    ProductsComponent,
    CardComponent,
    AddFormDonateComponent,
    SortByTypePipe
  ],
  imports: [
    CommonModule,
    FormsModule,
    UsersRoutingModule,
    HttpClientModule
  ]
})
export class UsersModule { }
