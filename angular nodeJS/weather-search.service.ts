import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders ,HttpClientModule  } from '@angular/common/http';

import { Observable,throwError  } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { Router } from "@angular/router";
@Injectable({
  providedIn: 'root'
})

export class WeatherSearchService {
  constructor(private http : HttpClient) {}
  
  getcurrent():Observable<any[]>{
    return this.http.get<any[]>("http://ip-api.com/json");  
   }


 getCurrentLocation(streat:string,city:string,state:string):Observable<any[]>{
      //var a="2637%20Severance%20Street,Los%20Angeles,California";
      
      return this.http.get<any[]>("/api/location?address="+streat+","+city+","+state);  
  }

  getCurrentWeather(lat:string,long:String):Observable<any[]>{
      return this.http.get<any[]>("/api/weather?lat="+lat+"&lng="+long);
  }
   
  getWeatherDetailsFortime(lat:string,long:String,time:string):Observable<any[]>{
      return this.http.get<any[]>("/api/weather/time?lat="+lat+"&lng="+long+"&time="+time);
  }
  
  getSeal(state:string):Observable<any[]>{
    return this.http.get<any[]>("/api/seal?state="+state);
  }
}


