import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
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
import { ProductsDonationComponent } from '../products-donation/products-donation.component';
import { BookFormComponent } from '../book-form/book-form.component';
import { RetirementComponent } from './retirement/retirement.component';
import { WishFormComponent } from './wish-form/wish-form.component';
import { WishCardComponent } from './wish-card/wish-card.component';
import { WishListComponent } from './wish-list/wish-list.component';
import { WishFormUpdateComponent } from './wish-form-update/wish-form-update.component';
@NgModule({
  declarations: [
    UsersComponent,
    AddFormComponent,
    BookFormComponent,
    ProductsComponent,
    CardComponent,
    AddFormDonateComponent,
    SortByTypePipe,
    ProductsDonationComponent,
    RetirementComponent,
    WishFormComponent,
    WishCardComponent,
    WishListComponent,
    WishFormUpdateComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    UsersRoutingModule,
    HttpClientModule,
    RouterModule
  ]
})
export class UsersModule { }
