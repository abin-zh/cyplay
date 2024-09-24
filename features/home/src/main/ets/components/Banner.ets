import { Movie } from '@ohos/common'

@Component
export struct Banner {
  @StorageProp("currentBreakpoint") currentBreakpoint: string = "sm";
  @Consume('bannerList') bannerList: Array<Movie>
  // @State bannerDataSource: Array<Movie> = [
  //   new Movie('872585', "奥本海默", "https://image.tmdb.org/t/p/original/nb3xI8XI3w4pMVZ38VijbsyBqP4.jpg"),
  //   new Movie('1046090', "周处除三害", "https://image.tmdb.org/t/p/original/kO50NnuqZBY5BJqfZWJqy14sBxR.jpg"),
  //   new Movie('466420', "花月杀手", "https://image.tmdb.org/t/p/original/1X7vow16X7CnCoexXh4H4F2yDJv.jpg"),
  //   new Movie('842675-2', "流浪地球2", "https://image.tmdb.org/t/p/original/94cS0mzODEoNIXFT7nhPcI8V4IJ.jpg"),
  //   new Movie('157336', "星际穿越", "https://image.tmdb.org/t/p/original/8sNiAPPYU14PUepFNeSNGUTiHW.jpg")
  // ]

  build() {
    Swiper() {
      ForEach(this.bannerList , (movie: Movie, index: number) => {
        Column() {
          Stack() {
            Image(`https://emby2.misakaf.org/emby/Items/${movie.Id}/Images/Primary?maxHeight=312&maxWidth=554&tag=${movie.ImageTags.Primary}&quality=90`)
              .borderRadius(16)
            Text(movie.SeriesName ? movie.SeriesName : movie.Name)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
              .padding(4)
              .margin({ bottom: 14 })
              .borderRadius(16)
              .zIndex(99)
          }
          .alignContent(Alignment.Bottom)
          .aspectRatio(this.currentBreakpoint == "lg" ? 2.33 : 1.78)
        }
      }, (item: Banner, index: number) => index + JSON.stringify(item))
    }
    .index(2) // 设置不同断点下的Banner展示数量，实现自适应布局的延伸能力
    .itemSpace(16)
    .displayCount(this.currentBreakpoint === "sm" ? 1 : 2)
    .indicator(this.currentBreakpoint === "sm" ?
    Indicator.dot()
      .itemWidth(5)
      .itemHeight(5)
      .left(0)
      .color("#E6E6E6")
      .selectedColor("#2B89D1") : false
    )
    .loop(true)
    .width('100%')
    .effectMode(EdgeEffect.None) // md与lg设备上前后露出两张Banner图的大小不同
    .prevMargin(this.currentBreakpoint === "sm" ? 0 : 16)
    .nextMargin(this.currentBreakpoint === "sm" ? 0 : 16)

  }
}

function getImageTag(movie: Movie): string {
  if(movie.BackdropImageTags?.length > 0){
    return movie.BackdropImageTags[0]
  } else if(movie.ParentBackdropImageTags?.length > 0){
    return movie.ParentBackdropImageTags[0]
  } else {
    return movie.ImageTags.Primary
  }
}
