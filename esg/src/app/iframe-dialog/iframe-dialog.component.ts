import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-iframe-dialog',
  templateUrl: './iframe-dialog.component.html',
  styleUrls: ['./iframe-dialog.component.css']
})
export class IframeDialogComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit(): void {
  }

  // 回到首頁，使用 Angular 的路由導航
  navigateToHome(): void {
    this.router.navigateByUrl('/home', { skipLocationChange: true });
  }

}