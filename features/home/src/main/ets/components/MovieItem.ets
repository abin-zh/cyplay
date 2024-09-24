import { Movie } from '@ohos/common';

@Component
export struct MovieItem {
  @ObjectLink movie: Movie;
  @Prop currentBreakpoint: string;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Flex({justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center}){
          if (this.movie?.ImageTags?.Primary) {
            Image(`https://emby2.misakaf.org/emby/Items/${this.movie.Id}/Images/Primary?maxHeight=296&maxWidth=198&tag=${this.movie.ImageTags.Primary}&quality=90`)
              .borderRadius(16)
              .shadow({
                radius: 16,
                color: "#e3e3e3",
                offsetX: 1,
                offsetY: 1
              })
          } else {
            Image($r('app.media.file'))
              .height(50)
              .width(50)
          }
        }
        .borderRadius(16)
        .shadow({
          radius: 16,
          color: "#e3e3e3",
          offsetX: 1,
          offsetY: 1
        })
        .height('100%')

        Text(this.movie.Name)
          .fontWeight(FontWeight.Bold)
          .height(45)
          .textAlign(TextAlign.Center)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .maxLines(1)
      }
      .width(this.getMovieImgAspectRatio(this.currentBreakpoint) * 100)
      .height(this.getMovieImgAspectRatio(this.currentBreakpoint) * 150)
    }
    .aspectRatio(0.66)
    .margin({ bottom: 32 })
  }

  getMovieImgAspectRatio(currentBreakpoint: string): number {
    switch (currentBreakpoint) {
      case 'sm':
      case 'md':
        return 1;
      case 'lg':
        return 1.2;
    }
    return 1;
  }
}
