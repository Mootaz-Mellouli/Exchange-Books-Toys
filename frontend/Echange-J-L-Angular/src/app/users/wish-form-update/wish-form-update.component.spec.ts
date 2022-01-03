import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WishFormUpdateComponent } from './wish-form-update.component';

describe('WishFormUpdateComponent', () => {
  let component: WishFormUpdateComponent;
  let fixture: ComponentFixture<WishFormUpdateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ WishFormUpdateComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(WishFormUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
