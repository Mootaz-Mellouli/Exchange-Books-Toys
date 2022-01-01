import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductsDonationComponent } from './products-donation.component';

describe('ProductsDonationComponent', () => {
  let component: ProductsDonationComponent;
  let fixture: ComponentFixture<ProductsDonationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProductsDonationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ProductsDonationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
