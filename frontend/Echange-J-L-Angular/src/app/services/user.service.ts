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
  private toyAPI= 'http://localhost:8080/jouet';
private expressapi='http://localhost:3000/api/jouets/'
  private getAllToy='http://localhost:8080/jouet/';
  private getAllBook='http://localhost:8080/livre/';
  //Fake API
  private fakeAPI = 'https://exchange-donate-default-rtdb.europe-west1.firebasedatabase.app/post.json'

  constructor(private http: HttpClient) { }

   addBook(livre: Livre):Observable<Livre>{
    return this.http.post<Livre>(this.addBookAPI, livre);
  }

  addToy(jouet: Jouet):Observable<Jouet>{
    return this.http.post<Jouet>(this.addToyAPI, jouet);
  }

  getAllToys()
  {
    return this.http.get<Jouet[]>(this.getAllToy);
  }

  getAllBooks()
  {
    return this.http.get<Livre[]>(this.getAllBook);
  }

  getToyByID(id:number)
  {
    return this.http.get<Jouet>(`${this.getAllToy}/${id}`);

  }

  deleteToy(id: number):Observable<{}>
  {
    return this.http.delete(`${this.getAllToy}/${id}`);
  }

  updateToy(jouet:Jouet,id:number)
  {
    return this.http.put(`${this.getAllToy}/${id}`, jouet)
  }



  getAllToysREAL()
  {
    return this.http.get(this.toyAPI + "/");
  }


}

