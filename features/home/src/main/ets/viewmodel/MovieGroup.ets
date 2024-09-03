
import { Movie } from '../viewmodel/Movie';
export class MovieGroup{

  id: string;
  groupName: string;
  groupList: Array<Movie>

  constructor(id: string, groupName: string, groupList: Array<Movie>) {
    this.id = id;
    this.groupName = groupName;
    this.groupList = groupList;
  }

}