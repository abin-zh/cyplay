import { Movie } from '../viewmodel/Movie';

@Component
export struct MovieTab {

  @StorageProp("currentBreakpoint") currentBreakpoint: string = "sm";

  @State movieList: Array<Movie> = [
      new Movie('238', '教父', 'https://image.tmdb.org/t/p/original/y03tzUKvkRCYwJ5NWys4W4bnS9m.jpg'),
      new Movie('240', '教父2', 'https://image.tmdb.org/t/p/original/4J8jUmjgKPggRPJqqdkjWCj2k0D.jpg'),
      new Movie('424', '辛德勒的名单', 'https://image.tmdb.org/t/p/original/kukYu89yda6NrifW5kpLoOTU7YH.jpg'),
      new Movie('278', '肖申克的救赎', 'https://image.tmdb.org/t/p/original/x6cLNyJWKK7jdaqL9UNPlvJJoVD.jpg'),
      new Movie('129', '千与千寻', 'https://image.tmdb.org/t/p/original/qIVSUzgVfg1citQeZdBDGKTinUb.jpg'),
      new Movie('13', '阿甘正传', 'https://image.tmdb.org/t/p/original/Ac68G8LkY4AJL6lXpClRP4uJMRV.jpg'),
      new Movie('122', '指环王3：王者无敌', 'https://image.tmdb.org/t/p/original/lgjEYpnVm5olPprvi8PPruLDorX.jpg'),
      new Movie('', '', ''),
      new Movie('', '', ''),
  ]

  build() {
    Scroll(){
      Column() {
        // 推荐视频区域
        Grid() {
          ForEach(this.movieList, (item: Movie, index: number) => {
            GridItem() {
              Column() {
                Stack({ alignContent: Alignment.Bottom}) {
                  Column(){
                    Image(item.imgUrl)
                      .borderRadius(16)
                      .shadow({radius: 16, color: "#e3e3e3", offsetX: 1,offsetY: 1})
                    Text(item.name)
                      .margin({top: 8})
                      .fontWeight(FontWeight.Bold)
                  }
                }
                // 宽高按照预设的比例，随容器组件发生变化且宽高比不变
                .aspectRatio(0.66)
              }
              .alignItems(HorizontalAlign.Start)
            }
          }, (item: Movie, index: number) => index + JSON.stringify(item))
        }
        // 设置网格布局列数,均分宽度
        .columnsTemplate(this.currentBreakpoint == "lg" ? '1fr 1fr 1fr 1fr 1fr 1fr' : '1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .columnsGap(16)
        .rowsGap(16)
        // 根据不同断点下列数动态计算总高度，保持图片宽高比不变
        .height(500)
      }
    }
  }
}