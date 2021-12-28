import { Component, OnInit } from '@angular/core';
import { AuthentificationService } from '../services/authentification.service';
@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  constructor(private service: AuthentificationService) { }
  dataUser:[] = [];
  stat = localStorage.getItem("status");
  data = localStorage.getItem("userData");
  user:string = "";
  ngOnInit(): void {
    
    if(this.stat=="True"){
      this.dataUser = JSON.parse(localStorage.getItem("userData") || "");
    }
    else {
      this.dataUser = [];
    }
    this.dataUser.map((item: any) => {
      this.user = item.username
    })
  }

  onLogout(){
    this.service.logout().subscribe(res => console.log(res));
    localStorage.setItem("status", "False");
    localStorage.removeItem("userData");
    window.location.reload();
  }


  

  // userData = JSON.stringify(this.data);
  displayStyle = "none";

  openPopup() {
    this.displayStyle = "block";
  }
  closePopup() {
    this.displayStyle = "none";
  }
}
