import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Livre } from '../models/Livre';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private userapi = 'http://localhost:8080/livre/';
  constructor(private http: HttpClient) { }

  post(livre: Livre){
    return this.http.post(`${this.userapi}/add/`, livre);
  }
}
