import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddFormDonateComponent } from './add-form-donate.component';

describe('AddFormDonateComponent', () => {
  let component: AddFormDonateComponent;
  let fixture: ComponentFixture<AddFormDonateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddFormDonateComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddFormDonateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
