import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Jouet } from '../models/Jouet';

@Injectable({
  providedIn: 'root'
})
export class AssociationService {
  private bookAPI = 'http://localhost:8080/livre/';
  private toyAPI = 'http://localhost:8080/jouet/';
  private associationAPI = 'http://localhost:8080/Association/';
  
  constructor(private http: HttpClient ) { }

  getAllBooks(){
    return this.http.get(this.bookAPI);
  }

  deleteToy(id:String){
    return this.http.delete(this.toyAPI+id);
  }

  getToy(id:any){
    return this.http.get(this.toyAPI + id);
  }  

  updateToy(id:any, toy:Jouet){
    return this.http.put(this.toyAPI + id, toy);
  }

  getAll(){
    return this.http.get(this.associationAPI);
  }

  get(id: String){
    return this.http.get(this.associationAPI+id);
  }

  post(association: any){
    return this.http.post(`${this.associationAPI}add/`, association);
  }

  put(association: any){
    return this.http.put(this.associationAPI, association);
  }

  delete(id: String){
    return this.http.delete(this.associationAPI+id);
  }
}
