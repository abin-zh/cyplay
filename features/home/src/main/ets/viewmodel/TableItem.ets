// 添加这个接口定义
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

  constructor(Id: string, Name: string, CollectionType: string | null, isHome: boolean | null) {
    this._Id = Id
    this._Name = Name
    this._CollectionType = CollectionType
    this._isHome = isHome
  }


}