import { Component } from '@angular/core';

declare global {
  interface Window {
    env: any;
  }
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'angular-env-example';
  // 我們將從 window 物件讀取這個值，預設為 'Hello from Angular!'
  greeting = window.env?.GREETING || 'Hello from Angular!';
}