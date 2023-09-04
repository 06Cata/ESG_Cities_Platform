import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { IframeDialogComponent } from './iframe-dialog/iframe-dialog.component';
import { RecycleComponent } from './recycle/recycle.component';
import { EnvironmentalComponent } from './environmental/environmental.component';
import { FactoryComponent } from './factory/factory.component';

const routes: Routes = [{path:'home', component: HomeComponent}, {path:'', component:HomeComponent},
{path: 'iframe-dialog', component: IframeDialogComponent },
{path: 'recycle', component: RecycleComponent },
{path: 'environmental', component: EnvironmentalComponent },
{path: 'factory', component: FactoryComponent  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
