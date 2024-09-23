export class File{
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

  private _type: string;

  public set type(value: string) {
    this._type = value;
  }

  public get type(): string {
    return this._type;
  }

  constructor(id: string, name: string, type: string) {
    this._id = id;
    this._name = name;
    this._type = type;
  }

  getLogo(): Resource{
    switch (this._type) { 
      case 'emby':
        return $r('app.media.emby');
      case 'plex':
        return $r('app.media.plex');
      case 'jellyfin':
        return $r('app.media.jellyfin');
      case 'alipan':
        return $r('app.media.alipan');
      case 'samba':
        return $r('app.media.samba');
    }
    return $r('app.media.emby');


  }


}