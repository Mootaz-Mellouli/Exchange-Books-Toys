import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [{ path: 'users', loadChildren: () => import('./users/users.module').then(m => m.UsersModule) }, { path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule) }] ;




@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],
    
  exports: [RouterModule]
    

})
export class AppRoutingModule { }
