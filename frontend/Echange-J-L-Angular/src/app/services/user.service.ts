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
  //Fake API
  private fakeAPI = 'https://exchange-donate-default-rtdb.europe-west1.firebasedatabase.app/post.json'

  constructor(private http: HttpClient) { }

  addBook(livre: Livre):Observable<Livre>{
    return this.http.post<Livre>(this.addBookAPI, livre)
  }

  //Adding a new toy with fake api
  addToy(jouet: Jouet):Observable<Jouet>{
    return this.http.post<Jouet>(this.fakeAPI, jouet)
  }




//displaying all toys with fake api
  getAllToys()
  {
    return this.http.get(this.fakeAPI);
  }

  //deleting with fake api
  deleteToy(id: number):Observable<{}>{
    return this.http.delete(`${this.fakeAPI}/${id}`);
  }
}

