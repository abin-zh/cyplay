@Observed
export class  Movie{
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

  private _ImageTags: ImageTags

  public set ImageTags(value: ImageTags) {
    this._ImageTags = value
  }

  public get ImageTags(): ImageTags {
    return this._ImageTags
  }

  private _SeriesName: string

  public set SeriesName(value: string) {
    this._SeriesName = value
  }

  public get SeriesName(): string {
    return this._SeriesName
  }

  private _BackdropImageTags: Array<string>

  public set BackdropImageTags(value: Array<string>) {
    this._BackdropImageTags = value
  }

  public get BackdropImageTags(): Array<string> {
    return this._BackdropImageTags
  }

  private _ParentBackdropImageTags: Array<string>

  public set ParentBackdropImageTags(value: Array<string>) {
    this._ParentBackdropImageTags = value
  }

  public get ParentBackdropImageTags(): Array<string> {
    return this._ParentBackdropImageTags
  }



  constructor(Id: string, Name: string, ImageTags: ImageTags, SeriesName: string, BackdropImageTags: Array<string>,
    ParentBackdropImageTags: Array<string>) {
    this._Id = Id
    this._Name = Name
    this._ImageTags = ImageTags
    this._SeriesName = SeriesName
    this._BackdropImageTags = BackdropImageTags
    this._ParentBackdropImageTags = ParentBackdropImageTags
  }




}

interface ImageTags{
  Primary: string
  Thumb: string
}