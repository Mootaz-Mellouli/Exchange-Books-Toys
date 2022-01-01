import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AuthentificationService } from '../services/authentification.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  @ViewChild('registerform', { static: false }) register!: NgForm;
  constructor(private service: AuthentificationService) { }
  data = [];
  registerStat = "";
  ngOnInit(): void {

  }

  registerUser(){
    console.log(this.register.value);
    
    if(this.register.value.password === this.register.value.cpassword){
      this.service.Register(this.register.value.username, this.register.value.password).subscribe((res:any)=> {
        window.location.href ="/login";
      },err => this.registerStat = "failed");
    }
    else {
      console.log("not equal");
      
      this.registerStat = "failed"
    }


  }
  



  
}
