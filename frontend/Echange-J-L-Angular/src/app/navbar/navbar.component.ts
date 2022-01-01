import { Component, OnInit } from '@angular/core';
import { AuthentificationService } from '../services/authentification.service';
@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  constructor(private service: AuthentificationService) { }
  dataUser:any;
  stat = localStorage.getItem("status");
  data = localStorage.getItem("userData");
  user:string = "";
  ngOnInit(): void {
    
    if(this.stat=="True"){
      this.dataUser = JSON.parse(this.data || "");
      this.user = this.dataUser.username;
    }
    else {
      this.dataUser = {};
    }

  }

  onLogout(){
    this.service.logout().subscribe(res => console.log(res));
    localStorage.setItem("status", "False");
    localStorage.removeItem("userData");
    window.location.reload();
  }
}
