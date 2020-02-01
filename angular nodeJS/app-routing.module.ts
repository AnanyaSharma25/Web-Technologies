import { WeatherSearchComponent } from './weather-search/weather-search.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TabsModule } from 'ngx-bootstrap';
import { FavoritesComponent } from './favorites/favorites.component';
import { TooltipModule } from 'ngx-bootstrap/tooltip';

const routes: Routes = [
  {path: 'currentWeather' , component: WeatherSearchComponent},
  {path: 'favorite', component: FavoritesComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes),TabsModule.forRoot(), TooltipModule.forRoot() ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const routingComponents = [WeatherSearchComponent, FavoritesComponent]
