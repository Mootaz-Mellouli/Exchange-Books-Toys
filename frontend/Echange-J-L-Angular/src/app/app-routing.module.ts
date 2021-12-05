import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HeaderComponent } from './header/header.component';
import { CommonModule } from '@angular/common';
import { FormsModule } from "@angular/forms";
import { HomeBodyComponent } from './home-body/home-body.component';
import { NotfoundComponent } from './notfound/notfound.component';
import { ProductsComponent } from './products/products.component';
const routes: Routes = [
  { path: '', component: HomeBodyComponent },
  { path: 'products', component: ProductsComponent },
  { path: '**', component: NotfoundComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes), FormsModule, CommonModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
