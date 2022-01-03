import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { NotfoundComponent } from './notfound/notfound.component';
import {AssciationComponent} from './association/association.component';
import {VillageComponent} from './village enfants/village.component'
import { MaisonComponent } from './maison de retraite/maison.component';
const routes: Routes = [
  {path:'',component:HomeComponent},
  { path: 'users', loadChildren: () => import('./users/users.module').then(m => m.UsersModule) },
  { path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule) },
  {path:'association',component:AssciationComponent},
  {path:'village',component:VillageComponent},
  {path:'maison',component:MaisonComponent},
  
  {path:'login',component:LoginComponent},
  {path: '**', component:NotfoundComponent}
] ;




@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],

  exports: [RouterModule]


})
export class AppRoutingModule { }
