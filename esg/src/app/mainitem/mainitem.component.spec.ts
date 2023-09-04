import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MainitemComponent } from './mainitem.component';

describe('MainitemComponent', () => {
  let component: MainitemComponent;
  let fixture: ComponentFixture<MainitemComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MainitemComponent]
    });
    fixture = TestBed.createComponent(MainitemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
