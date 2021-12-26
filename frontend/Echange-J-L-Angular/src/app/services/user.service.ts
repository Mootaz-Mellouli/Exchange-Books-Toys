import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Livre } from '../models/Livre';
import { Observable} from 'rxjs';
import { Jouet } from '../models/Jouet';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private addBookAPI = 'http://localhost:8080/livre/add';
  private addToyAPI= 'http://localhost:8080/jouet/add';

  constructor(private http: HttpClient) { }

  addBook(livre: Livre):Observable<Livre>{
    return this.http.post<Livre>(this.addBookAPI, livre)
  }

  addToy(jouet: Jouet):Observable<Jouet>{
    return this.http.post<Jouet>(this.addToyAPI, jouet)
  }
}

