
export class Movie{
  private _id: string;

  public set id(value: string) {
    this._id = value;
  }

  public get id(): string {
    return this._id;
  }

  private _name: string;

  public set name(value: string) {
    this._name = value;
  }

  public get name(): string {
    return this._name;
  }

  private _imgUrl: string;

  public set imgUrl(value: string) {
    this._imgUrl = value;
  }

  public get imgUrl(): string {
    return this._imgUrl;
  }

  constructor(id: string, name: string, imgUrl: string) {
    this._id = id;
    this._name = name;
    this._imgUrl = imgUrl;
  }



}
