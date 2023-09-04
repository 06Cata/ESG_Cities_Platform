import { Component, OnInit, Input  } from '@angular/core';
import { Router } from '@angular/router';
import { Image } from '../image';


@Component({
  selector: 'app-mainitem',
  templateUrl: './mainitem.component.html',
  styleUrls: ['./mainitem.component.css']
})
export class MainitemComponent {

  @Input() path: string = '';
  @Input() title: string = '';
  @Input() linkrouter: string = '';
  @Input() text: string = '';

  constructor(private router: Router) { }

  // 點擊mainitem時在新分頁中打開Iframe頁面
  openIframePage(): void {
    this.router.navigateByUrl(this.linkrouter);
  }

}
