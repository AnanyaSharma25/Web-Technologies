import { Component,OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {Router} from '@angular/router';
import { Injectable } from '@angular/core';
import {NgForm} from '@angular/forms';
/* import { Observable } from 'rxjs';
import { debounceTime, distinctUntilChanged, map, catchError  } from 'rxjs/operators';

 const states = ['Alabama', 'Alaska', 'American Samoa', 'Arizona', 'Arkansas', 'California', 'Colorado',
  'Connecticut', 'Delaware', 'District Of Columbia', 'Federated States Of Micronesia', 'Florida', 'Georgia',
  'Guam', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine',
  'Marshall Islands', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana',
  'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
  'Northern Mariana Islands', 'Ohio', 'Oklahoma', 'Oregon', 'Palau', 'Pennsylvania', 'Puerto Rico', 'Rhode Island',
  'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virgin Islands', 'Virginia',
  'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'];   */


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
@Injectable()
export class AppComponent  implements OnInit{
  title = 'WeatherSearch';
  formGroup: FormGroup;

  isdisable=false;
  constructor(private router: Router) {}
  ngOnInit() {

    this.formGroup = new FormGroup({
      street: new FormControl('', [
        Validators.required
      ]),
      city: new FormControl('', [
        Validators.required
      ],),
      state: new FormControl('', [
        Validators.required
      ]),
      remember: new FormControl(),
    });
    this.conditionalvalidation();
  }
  conditionalvalidation() {
    this.formGroup.get("remember").valueChanges.subscribe(remember=>{
        if(remember){
          this.formGroup.get("street").setValidators(null);
          this.formGroup.get("city").setValidators(null);
          this.formGroup.get("state").setValidators(null);
          this.isdisable=true;
        }else{
          this.formGroup.get("street").setValidators([Validators.required]);
          this.formGroup.get("city").setValidators([Validators.required]);
          this.formGroup.get("state").setValidators([Validators.required]);
          this.isdisable=false;
        }
    });

  }
  onSubmit(f: NgForm) {
    console.log(f);
    this.router.navigate(['/currentWeather',f.form.value]);
  //  this.router.navigateByUrl('/currentWeather');
  }

  /* onResult() {
    console.log(f);
    this.router.navigate(['/currentWeather',f.form.value]);
  //  this.router.navigateByUrl('/currentWeather');
  } */

  onReset() {
    this.formGroup.reset();
    this.router.navigateByUrl('/');
  }

   
  disable()
        {   
        const ele = document.getElementById("currentlocation") as HTMLInputElement;
        const el1 = document.getElementById("street") as HTMLInputElement;
        const el2 = document.getElementById("city") as HTMLInputElement;
        //const el3 = document.getElementById("state") as HTMLInputElement;
        if(ele.checked == true)
         //if(document.getElementById("currentlocation").checked==true)
          {
            
            el1.disabled = true;
            el2.disabled = true;
            
            
           // document.getElementById("street").disabled=true;
            //document.getElementById("city").disabled=true;
            //document.getElementById('state').disabled=true;
          }
         else
         {
          el1.disabled = false;
          el2.disabled = false;
          
          /* document.getElementById("street").disabled=false;
            document.getElementById("city").disabled=false;
            document.getElementById('state').disabled=false;
           */} 

        }

        doSomething(text)
        {
          const el4 = document.getElementById("s1") as HTMLSelectElement;
          if ( text.length > 0)
          //   //document.getElementById("submit").disabled = false;
             el4.disabled = false;
          else
             el4.disabled = true;
          // //document.getElementById("submit").disabled = true; 
        }
      
        //try1()
        //{
          
        //}

        clearForm() 
        {
          //const el5 = document.getElementById("form1") as HTMLInputElement;  
          //reset(el5);      
          //document.getElementById("form1").reset();
          const el6 = document.getElementById("street") as HTMLInputElement;
          const el7 = document.getElementById("city") as HTMLInputElement;
          const el8 = document.getElementById("state") as HTMLInputElement;
          el6.value= "";
          el7.value = "";
          document.getElementById("output").innerHTML = "";
                  //document.getElementsByClassName("collection more").innerHTML = "";
                  //document.getElementById("street").value = "";
                  //document.getElementById("city").value = "";
          var select = document.getElementById("state") as HTMLSelectElement;
          select.selectedIndex = 0;
      }

     
}

 /* export class NgbdTypeaheadBasic {
  public model: any;


  search = (text$: Observable<string>) =>
  text$.pipe(
    debounceTime(200),
    distinctUntilChanged(),
    map(term => term.length < 2 ? []
      : states.filter(v => v.toLowerCase().indexOf(term.toLowerCase()) > -1).slice(0, 10))
  )
  resultFormatBandListValue(value: any) {            
    return value.name; }
  
    inputFormatBandListValue(value: any)   {
      if(value.name)
        return value.name
      return value;
    }
}

 */

