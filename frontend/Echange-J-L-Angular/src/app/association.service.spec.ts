import { TestBed } from '@angular/core/testing';

import { AssociationService } from './services/association.service';

describe('AssociationService', () => {
  let service: AssociationService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AssociationService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
