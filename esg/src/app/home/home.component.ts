import { Component, ViewChild } from '@angular/core';
import { IMAGES } from '../image'; // 假設 image.ts 與 other.component.ts 在同一個資料夾中


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent {
  images = IMAGES;

  constructor() { }
}
