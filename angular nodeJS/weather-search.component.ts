import { Component,TemplateRef, OnInit } from '@angular/core';
import { WeatherSearchService } from '../weather-search.service';
import * as CanvasJS from './canvasjs.min';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-weather-search',
  templateUrl: './weather-search.component.html',
  styleUrls: ['./weather-search.component.css']
})
export class WeatherSearchComponent implements OnInit {
  public currentstreet:string;
  public currentCity:string;
  public currentstate:string;
  public currentlat;
  public currentlng;

  public street:string;
  public city:string;
  public state:string;
  public remember:string;

  modalRef: BsModalRef;
  
  public currentLocation: any = [];
  public currentWeather: any = [];


public barChartOptions = {
  scaleShowVerticalLines: false,
  responsive: true,
  
};
public barChartLabels:any =[];
/* public barChartLabels : any= [{
  scales: {
    yAxes: [{ 
      scaleLabel: {
        display: true,
        labelString: "Happiness"
      }
    }],
    xAxes: [{ 
      scaleLabel: {
        display: true,
        labelString: "GDP (PPP)"
      }
    }]
  },
}]; */
public barChartType = 'bar';
public barChartLegend:boolean= true;
public barChartData1 = [ {data: [],
 /*  options: {
    scaleShowValues: true,
    scales: {
      yAxes: [{ 
        scaleLabel: {
          display: true,
          labelString: "Happiness"
        }
      }]
    }}, */
    label: 'Temperature' ,
    backgroundColor: "#81c9f1" ,
    hoverBackgroundColor:"#81c9f1",
    responsive:true,
  }];
public barChartData2 = [{data: [], label: 'Pressure', backgroundColor: "#81c9f1",hoverBackgroundColor:"#81c9f1",}];
public barChartData3 = [{data: [], label: 'Humidity', backgroundColor: "#81c9f1",hoverBackgroundColor:"#81c9f1",}];
public barChartData4 = [{data: [], label: 'Ozone ', backgroundColor: "#81c9f1",hoverBackgroundColor:"#81c9f1",}];
public barChartData5 = [{data: [], label: 'Visibility', backgroundColor: "#81c9f1",hoverBackgroundColor:"#81c9f1",}];
public barChartData6 = [{data: [], label: 'Wind Speed', backgroundColor: "#81c9f1",hoverBackgroundColor:"#81c9f1",}];

public tempdata1=[];
public tempdata2=[];
public tempdata3=[];
public tempdata4=[];
public tempdata5=[];
public tempdata6=[];
public dataPointsWeek=[];

public resp3:any=[];
public selectedHourly="temperature";
changeChart(event:any) {
  this.selectedHourly =  event.target.value;
 }
loadpopup(event:any,template: TemplateRef<any>){
  let inputs = event.target.getElementsByTagName('input');
  let lat =  event.target.getAttribute('data-lat');
  let lng= event.target.getAttribute('data-lng');
  let time = event.target.getAttribute('data-time');
  
 this._weatherSearch.getWeatherDetailsFortime(lat,lng,time).subscribe((data111: any[])=>{
    
     this.resp3=data111;
    
     let iconsrc;
     switch (this.resp3.currently.icon) {
      case "clear-day":
        iconsrc ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-12-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
      case "clear-night":
         iconsrc="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-12-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
      case "rain":
          iconsrc="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-04-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
           case "snow":
           iconsrc="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-19-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
           case "sleet":
         iconsrc ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-07-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
           case "wind":
           iconsrc="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-27-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
           case "fog":
         iconsrc ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-28-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
           case "cloudy":
          iconsrc="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-01-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
          case "partly-cloudy-day":
          iconsrc="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-02-512.png' class='img-fluid' alt='logo-icon'> ";
          break;
          case "partly-cloudy-night":
          iconsrc="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-02-512.png' class='img-fluid' alt='logo-icon'>  ";
          break;
  
           }
           
     document.getElementById('mdate').innerHTML=CanvasJS.formatDate(new Date((this.resp3.currently.time)*1000),'DD/MM/YYYY');
     document.getElementById('mtemprature').innerHTML=this.resp3.currently.temperature;
     document.getElementById('msummary').innerHTML=this.resp3.currently.summary;
     document.getElementById('mprep').innerHTML=this.resp3.currently.precipIntensity;
     document.getElementById('mchoR').innerHTML=this.resp3.currently.precipProbability;
     document.getElementById('mws').innerHTML=this.resp3.currently.windSpeed;
     document.getElementById('mHumi').innerHTML=this.resp3.currently.humidity;
     document.getElementById('mVisi').innerHTML=this.resp3.currently.visibility;
     document.getElementById('mlogo').innerHTML=iconsrc;
    
     });
     this.modalRef = this.modalService.show(template);
}

  constructor(public _weatherSearch: WeatherSearchService,private modalService: BsModalService,private route: ActivatedRoute) { }

  ngOnInit() {
    this.street= this.route.snapshot.params.street;
     this.city= this.route.snapshot.params.city;
     this.state = this.route.snapshot.params.state;
     this.remember = this.route.snapshot.params.remember;

this._weatherSearch.getcurrent().subscribe((loca:any[])=>{
        var temp:any=loca;
        this.currentCity=temp.city;
        this.currentstate=temp.country;
        this.currentlat=temp.lat;
        this.currentlng=temp.lon;
});


     this._weatherSearch.getCurrentLocation(this.street,this.city,this.state).subscribe((data: any[])=>{
     this.currentLocation = data;
      this._weatherSearch.getCurrentWeather(this.currentLocation.results[0].geometry.location.lat,this.currentLocation.results[0].geometry.location.lng).subscribe((data1: any[])=>{
        this.currentWeather = data1;
       
       let size=this.currentWeather.hourly.data.length<24?this.currentWeather.hourly.data.length:24;
       for(let i=0;i< size;i++){
        this.barChartLabels.push(i);
        this.tempdata1.push(this.currentWeather.hourly.data[i].temperature);
        this.tempdata2.push(this.currentWeather.hourly.data[i].pressure);
        this.tempdata3.push(this.currentWeather.hourly.data[i].humidity);
        this.tempdata4.push(this.currentWeather.hourly.data[i].ozone);
        this.tempdata5.push(this.currentWeather.hourly.data[i].visibility);
        this.tempdata6.push(this.currentWeather.hourly.data[i].windSpeed);
       
        };
        this.barChartData1[0].data=this.tempdata1;
        this.barChartData2[0].data=this.tempdata2;
        this.barChartData3[0].data=this.tempdata3;
        this.barChartData4[0].data=this.tempdata4;
        this.barChartData5[0].data=this.tempdata5;
        this.barChartData6[0].data=this.tempdata6;
       
         size=this.currentWeather.daily.data.length;
         for(let i=0;i< size;i++){
          this.currentWeather.daily.data[i].temperatureLow;
          this.currentWeather.daily.data[i].temperatureHigh ;
          this.currentWeather.daily.data[i].time;
         let tt= { x: (i+1)*10, y:[this.currentWeather.daily.data[i].temperatureLow,
          this.currentWeather.daily.data[i].temperatureHigh], 
          label: CanvasJS.formatDate(new Date((this.currentWeather.daily.data[i].time)*1000),'DD/MM/YYYY') ,
          time:this.currentWeather.daily.data[i].time,
         lat:this.currentLocation.results[0].geometry.location.lat,
          lng:this.currentLocation.results[0].geometry.location.lng
        };
         this.dataPointsWeek.push(tt);
         }
         console.log(this.dataPointsWeek);
         let chart = new CanvasJS.Chart("weeklyChart",{
          animationEnabled: true,
          exportEnabled: false,
         
          title: {
            text: "Weekly Weather",
            fontSize: 25,
        },
        legend: {
          horizontalAlign: "center",
          verticalAlign: "top"
        },
      axisX: {
        title: "Days",gridThickness: 0
      },
      axisY: {
        includeZero: false,
        title: "Temperature in Fahrenheit",
        interval: 10,
        gridThickness: 0
      }, 
      data: [{
        color: "#81c9f1",
        type: "rangeBar",
        showInLegend: true,
        yValueFormatString: "#0.#",
        indexLabel: "{y[#index]}",
        legendText: "Day wise temperature range",
        toolTipContent: "<b>{label}</b>: {y[0]} to {y[1]}",
        dataPoints: this.dataPointsWeek,
        click:function(event){ 

          let inputs=document.getElementById('dumy').getElementsByTagName('input');
          document.getElementById('dumy').setAttribute('data-lat', event.dataPoint.lat);
          document.getElementById('dumy').setAttribute('data-lng', event.dataPoint.lng);
          document.getElementById('dumy').setAttribute('data-time', event.dataPoint.time);
         // document.getElementById('lat').value=event.dataPoint.lat;
        //  document.getElementById('lng').value=event.dataPoint.lng;
        //  document.getElementById('time').value=event.dataPoint.time;
          document.getElementById('dumy').dispatchEvent(new Event('change'));

        }
      }],
      
      
     
        });
        chart.render();
      }) 
    }) 

    
  }

}
