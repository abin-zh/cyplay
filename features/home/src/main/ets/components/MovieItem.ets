import { Movie } from '../viewmodel/Movie';

@Component
export struct MovieItem {
  @Prop movie: Movie;
  @Prop currentBreakpoint: string;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Image(this.movie.imgUrl)
          .borderRadius(16)
          .shadow({
            radius: 16,
            color: "#e3e3e3",
            offsetX: 1,
            offsetY: 1
          })
        Text(this.movie.name)
          .fontWeight(FontWeight.Bold)
          .height(45)
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
