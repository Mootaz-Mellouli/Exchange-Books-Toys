import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthentificationService {
  private authAPI = "http://localhost:8080";
  public array = [];
  constructor(private http:HttpClient) { }

  public fetchTgtUrl(username:string, password:string){
    let bodyString = 'username=' + username.trim() + '&password=' + encodeURIComponent(password);
    return fetch(this.authAPI+"/login", {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: bodyString
    });
  }
  public logout(){
    return this.http.get(this.authAPI+"/logout");
  }
  public getUsers(){
    return this.http.get<any>(this.authAPI+"/auth/users");
  }

  public getUserByUsername(username: any){
    return this.http.get<any>(this.authAPI+"/auth/users/?username="+username);
  }

}
