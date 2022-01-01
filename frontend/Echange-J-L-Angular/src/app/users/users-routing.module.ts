import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddFormDonateComponent } from '../add-form-donate/add-form-donate.component';
import { AddFormComponent } from '../add-form/add-form.component';
import { ProductsDonationComponent } from '../products-donation/products-donation.component';
import { ProductsComponent } from '../products/products.component';
import { UsersComponent } from './users.component';

const routes: Routes = [
  {path:'add',component:AddFormComponent},
  {path:'donate',component:AddFormDonateComponent},
  {path:'view',component:ProductsComponent},
  {path:'viewDonate',component:ProductsDonationComponent},
  { path: '', component: UsersComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsersRoutingModule { }
