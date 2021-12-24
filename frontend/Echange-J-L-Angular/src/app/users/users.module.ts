import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UsersRoutingModule } from './users-routing.module';
import { UsersComponent } from './users.component';
import { AddFormComponent } from '../add-form/add-form.component';
import { FormsModule } from '@angular/forms';
import { ProductsComponent } from '../products/products.component';
import { CardComponent } from '../card/card.component';


@NgModule({
  declarations: [
    UsersComponent,
    AddFormComponent,
    ProductsComponent,
    CardComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    UsersRoutingModule
  ]
})
export class UsersModule { }
