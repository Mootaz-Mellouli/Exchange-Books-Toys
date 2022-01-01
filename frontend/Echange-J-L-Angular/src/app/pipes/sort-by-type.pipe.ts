import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'sortByType'
})
export class SortByTypePipe implements PipeTransform {

  transform(value: any, query: string, field: string): any {
    return query ? value.reduce((prev: any, next: any) => {
      if (next[field].includes(query)) { prev.push(next); }
      return prev;
    }, []) : value;
  }

}

