import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Livre } from '../models/Livre';
import { Observable} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private addBookAPI = 'http://localhost:8080/livre/add';

  constructor(private http: HttpClient) { }

  addBook(livre: Livre):Observable<Livre>{
    return this.http.post<Livre>(this.addBookAPI, livre)
  }
}
/***************
 *  private userapi = 'http://localhost:8080/livre/add';

  constructor(private http: HttpClient) { }

  addBook(livre: Livre):Observable<Livre>{
    return this.http.post<Livre>(this.userapi, livre)
  }
 */
