import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { MainitemComponent } from './mainitem/mainitem.component';
import { IframeDialogComponent } from './iframe-dialog/iframe-dialog.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { RecycleComponent } from './recycle/recycle.component';
import { EnvironmentalComponent } from './environmental/environmental.component';
import { FactoryComponent } from './factory/factory.component';
import { FormsModule } from '@angular/forms';
import { MatTabsModule } from '@angular/material/tabs';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    MainitemComponent,
    IframeDialogComponent,
    RecycleComponent,
    EnvironmentalComponent,
    FactoryComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    FormsModule,
    MatTabsModule
  
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
