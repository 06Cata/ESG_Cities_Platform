import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-environmental',
  templateUrl: './environmental.component.html',
  styleUrls: ['./environmental.component.css']
})
export class EnvironmentalComponent {

  selectedOption: string = ''; // 初始化為空



  currentIndex = 0;
  totalSlides = 2; // 總圖片數量

  constructor(private router: Router) { }

  selectOption(option: string) {
    this.selectedOption = option;
  }

  // ngOnInit() {
  //   // 自動輪播切換
  //   setInterval(() => {
  //     this.currentIndex = (this.currentIndex + 1) % this.totalSlides;
  //   }, 8000); // 每 6 秒切換一張圖片
  // }

  // 回到首頁，使用 Angular 的路由導航
  navigateToHome(): void {
    this.router.navigateByUrl('/home'); 
  }

  onOptionChange() {
    // 在這裡處理選項變更的相應操作
  }
}