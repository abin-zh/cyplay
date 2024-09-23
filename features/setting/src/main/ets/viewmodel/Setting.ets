
export class Setting {
  private _title: string;

  public set title(value: string) {
    this._title = value;
  }

  public get title(): string {
    return this._title;
  }

  private _icon: Resource;

  public set icon(value: Resource) {
    this._icon = value;
  }

  public get icon(): Resource {
    return this._icon;
  }

  private _view: string;

  public set view(value: string) {
    this._view = value;
  }

  public get view(): string {
    return this._view;
  }

  constructor(title: string, icon: Resource, view: string) {
    this._title = title;
    this._icon = icon;
    this._view = view;
  }


  
}
