import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable} from 'rxjs';
import { Wish } from '../models/Wish';


@Injectable({
  providedIn: 'root'
})
export class RetirementService {

  private addWishAPI= 'http://localhost:8080/souhait/add';
private expressapi='http://localhost:3000/api/souhait/'
  private wishApi='http://localhost:8080/souhait/';


  constructor(private http: HttpClient) { }

  addWish(wish: Wish):Observable<Wish>{
    return this.http.post<Wish>(this.addWishAPI, wish);
  }

  getAllWish(){
    return this.http.get(this.wishApi);
  }

  // getAllWish()
  // {
  //   return this.http.get<Wish[]>(this.expressapi);
  // }


  getWishByID(id:number)
  {
    return this.http.get<Wish>(`${this.wishApi}/${id}`);

  }

  deleteWish(id: number):Observable<{}>
  {
    return this.http.delete(`${this.wishApi}/${id}`);
  }

  updateToy(wish:Wish,id:number)
  {
    return this.http.put(`${this.wishApi}/${id}`, wish)
  }



}

