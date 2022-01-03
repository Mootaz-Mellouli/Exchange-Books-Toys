import { Component, OnInit } from '@angular/core';
// Flash--Messages
import { FlashMessagesService} from 'angular2-flash-messages';
import { UserService } from '../../services/user.service';
import { Router } from '@angular/router';
/******************/
@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {

  name: string;
  email: string;
  password: string;

  constructor(
    private _flash:FlashMessagesService ,
    private _userService: UserService ,
    private _router:Router
    ) {
    this.name="";
    this.email="";
    this.password="";
  }

  ngOnInit(): void {}

  Register() {
   // console.log("test Register ");
   if (!this.name || !this.email || !this.password) {
    this._flash.show('All fields are required', { cssClass: 'alert-danger' });
   }
   
   const user = {
    name: this.name,
    email: this.email,
    password: this.password
  }
   
  this._userService.createAccount(user).subscribe(
    resp => {
      if(!resp.success) {
        this._flash.show(resp.message, { cssClass: 'alert-danger' } );
        return false;
      }

      this._flash.show('Account was created', { cssClass: 'alert-success' } );
      return this._router.navigate(['/Login']);
    }
  );

  }

  

}
