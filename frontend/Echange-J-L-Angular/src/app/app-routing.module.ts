import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { NotfoundComponent } from './notfound/notfound.component';

const routes: Routes = [
  {path:'',component:HomeComponent},
  { path: 'users', loadChildren: () => import('./users/users.module').then(m => m.UsersModule) },
  { path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule) },
  {path: '**', component:NotfoundComponent}
] ;




@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],

  exports: [RouterModule]


})
export class AppRoutingModule { }
