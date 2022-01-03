import { Injectable } from '@angular/core';

import { HttpHeaders, HttpClient, HttpErrorResponse } from '@angular/common/http';

import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { User } from '../user.model';
import { Userr } from '../user2.model';


@Injectable({providedIn: 'root'})

export class UserService {
  API_URL: string = 'http://localhost:3000';
  headers = new HttpHeaders().set('Content-Type', 'application/json');
  constructor(private httpClient: HttpClient) { }
  
  
  createAccount(user : User): Observable<any> {
    return this.httpClient.post(`${this.API_URL}/users/register`, user).pipe(
        catchError(this.handleError)
    )
  }
  auth(user : Userr): Observable<any> {
    return this.httpClient.post(`${this.API_URL}/users/auth`, user).pipe(
        catchError(this.handleError)
    )
  }


  saveUserDate(token, user) {
    localStorage.setItem(AppUtil.AUTH_TOKEN, token);
    localStorage.setItem(AppUtil.USER_INFO, JSON.stringify(user));
  }

  isLoggedIn() :boolean {
    return !!localStorage.getItem(AppUtil.AUTH_TOKEN);
  }
 
  handleError(error: HttpErrorResponse) {
    let msg = '';
    if (error.error instanceof ErrorEvent) {
      // client-side error
      msg = error.error.message;
    } else {
      // server-side error
      msg = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    return throwError(msg);
  }
  getCurrentUser() {
    return localStorage.getItem(AppUtil.USER_INFO);
  }
}