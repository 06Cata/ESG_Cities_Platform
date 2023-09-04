import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { cities, city } from '../city';
import { DomSanitizer} from '@angular/platform-browser';
import { factories,factory } from '../factory'

@Component({
  selector: 'app-factory',
  templateUrl: './factory.component.html',
  styleUrls: ['./factory.component.css']
})


export class FactoryComponent {
  cities = cities;
  selectedCity: city | null = null;
  srcUrl: any;

  @Input() city: string = '';
  @Input() iframeUrl: string = '';
 

  factories = factories;
  selectedFactory: factory | null = null;
  SrcUrl: any;

  @Input() factory: string = '';
  @Input() IframeUrl: string = '';


  constructor(private router: Router, private sanitizer:DomSanitizer ) { }

  navigateToHome(): void {
    this.router.navigateByUrl('/home', { skipLocationChange: true });
  }

  setSelectedCity(city: city | null): void {
    this.selectedCity = city;
    this.srcUrl = city ? this.sanitizer.bypassSecurityTrustResourceUrl(city.iframeUrl) : null;
  }

  setselectedFactory(factory: factory | null): void {
    this.selectedFactory = factory;
    this.SrcUrl = factory ? this.sanitizer.bypassSecurityTrustResourceUrl(factory.IframeUrl) : null;
  }


}
