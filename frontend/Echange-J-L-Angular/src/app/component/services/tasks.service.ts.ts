import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient, HttpErrorResponse } from '@angular/common/http';
import { catchError, Observable } from 'rxjs';
import { Task } from 'src/app/Task.model';
@Injectable()
export class TasksService {

    API_URL: string = 'http://localhost:3000';
    headers = new HttpHeaders().set('Content-Type', 'application/json');
    constructor(private httpClient: HttpClient) { }
    

  saveTask(task :Task ) : Observable<any> {
    return this.httpClient.post(`${this.API_URL}/tasks/add`, task).pipe(
        catchError(this.handleError)
    )
  }

  getTasks(query) : Observable<any> {
    return this.httpClient.post(`${this.API_URL}/tasks/list`, query).pipe(
        catchError(this.handleError)
    )
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
    return (msg);
  }
}