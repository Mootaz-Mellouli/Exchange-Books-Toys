import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddFormComponent } from '../add-form/add-form.component';
import { ProductsComponent } from '../products/products.component';
import { UsersComponent } from './users.component';

const routes: Routes = [
  {path:'add',component:AddFormComponent},
  {path:'view',component:ProductsComponent},
  { path: '', component: UsersComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsersRoutingModule { }
