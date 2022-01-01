import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AuthentificationService } from '../services/authentification.service';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  @ViewChild('loginform', { static: false }) login!: NgForm;
  constructor(private service: AuthentificationService) { }
  data = [];
  ngOnInit(): void {

  }

  loginUser(){
    this.service.fetchTgtUrl(this.login.value.username, this.login.value.password).then(res=> {
      if(res.status === 200){
        this.service.getUsers().subscribe(res=> {localStorage.setItem('userData', JSON.stringify(res));});
        localStorage.setItem('status', "True")
        window.location.href ="/";
      } else if(res.status === 401){
        localStorage.setItem('status', "False")
      }
    });

  }
  



  
}
