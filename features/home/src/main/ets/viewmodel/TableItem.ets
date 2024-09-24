import { Movie } from '@ohos/common'

@Observed
export class  TabItem {
  private _Id: string

  public set Id(value: string) {
    this._Id = value
  }

  public get Id(): string {
    return this._Id
  }

  private _Name: string

  public set Name(value: string) {
    this._Name = value
  }

  public get Name(): string {
    return this._Name
  }

  private _CollectionType: string | null

  public set CollectionType(value: string | null) {
    this._CollectionType = value
  }

  public get CollectionType(): string | null {
    return this._CollectionType
  }

  private _isHome: boolean | null

  public set isHome(value: boolean | null) {
    this._isHome = value
  }

  public get isHome(): boolean | null {
    return this._isHome
  }

  private _Latest: Array<Movie>

  public set Latest(value: Array<Movie>) {
    this._Latest = value
  }

  public get Latest(): Array<Movie> {
    return this._Latest
  }


  constructor(Id: string, Name: string, CollectionType: string | null, isHome: boolean | null, Latest?: Array<Movie>) {
    this._Id = Id
    this._Name = Name
    this._CollectionType = CollectionType
    this._isHome = isHome
    this._Latest = new Array<Movie>()
  }

}