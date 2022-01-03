import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddFormDonateComponent } from '../add-form-donate/add-form-donate.component';
import { AddFormComponent } from '../add-form/add-form.component';
import { BookFormComponent } from '../book-form/book-form.component';
import { ProductsDonationComponent } from '../products-donation/products-donation.component';
import { ProductsComponent } from '../products/products.component';
import { RetirementComponent } from './retirement/retirement.component';
import { WishFormComponent } from './wish-form/wish-form.component';
import { UsersComponent } from './users.component';
import { WishListComponent } from './wish-list/wish-list.component';
import { WishFormUpdateComponent } from './wish-form-update/wish-form-update.component';

const routes: Routes = [
  {path:'add',component:AddFormComponent},
  {path:'donate',component:AddFormDonateComponent},
  {path:'editToy',component:BookFormComponent},
  {path:'view',component:ProductsComponent},
  {path:'viewDonate',component:ProductsDonationComponent},
  {path:'retirement',component:RetirementComponent},
  {path:'retirement/wish-form',component:WishFormComponent},
  {path:'retirement/wish-list',component:WishListComponent},
  {path:'retirement/products',component:ProductsComponent},
  {path:'retirement/wish-list/editwish',component:WishFormUpdateComponent},
  { path: '', component: UsersComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsersRoutingModule { }
