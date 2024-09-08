import { Movie } from '../viewmodel/Movie';
import display from '@ohos.display';

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
    new Movie('278', '肖申克的救赎', 'https://image.tmdb.org/t/p/original/x6cLNyJWKK7jdaqL9UNPlvJJoVD.jpg'),
    new Movie('129', '千与千寻', 'https://image.tmdb.org/t/p/original/qIVSUzgVfg1citQeZdBDGKTinUb.jpg'),
    new Movie('13', '阿甘正传', 'https://image.tmdb.org/t/p/original/Ac68G8LkY4AJL6lXpClRP4uJMRV.jpg'),
   ]

  build() {
    Grid() {
      ForEach(this.movieList, (item: Movie, index: number) => {
        GridItem() {
          Column() {
            Stack({ alignContent: Alignment.Bottom }) {
              Column() {
                Image(item.imgUrl)
                  .borderRadius(16)
                  .shadow({
                    radius: 16,
                    color: "#e3e3e3",
                    offsetX: 1,
                    offsetY: 1
                  })
                Text(item.name)
                  .fontWeight(FontWeight.Bold)
                  .height(45)
              }
              .width(this.currentBreakpoint == 'lg' ? 100 * 1.5 : 100)
              .height(this.currentBreakpoint == 'lg' ? 150 * 1.5 : 150)
            }
            // 宽高按照预设的比例，随容器组件发生变化且宽高比不变
            .aspectRatio(0.66)
          }
        }
      }, (item: Movie, index: number) => index + JSON.stringify(item))
    }
    // 设置网格布局列数,均分宽度
    .columnsTemplate(this.currentBreakpoint == "lg" ? '1fr 1fr 1fr 1fr 1fr 1fr' : '1fr 1fr 1fr')
    .columnsGap(16)
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .rowsGap(16)
    // 根据不同断点下列数动态计算总高度，保持图片宽高比不变
    .height(this.getGridHeight(this.currentBreakpoint == "lg" ? 6 : 3, this.currentBreakpoint,
      display.getDefaultDisplaySync().width))

  }

  // 计算网格布局总高度
  getGridHeight(videoGridColumn: number, currentBreakpoint: string, windowWidth: number): number {
    // 获取窗口宽度，减掉两侧空白部分
    let result: number = px2vp(windowWidth) - 32;
    if (currentBreakpoint === 'lg') {
      result = result - 100;
    }
    // 根据网格列数计算单张图片宽度
    if (videoGridColumn == 3) {
      result = (result - 16 * 2) / videoGridColumn;
    } else if (videoGridColumn == 4) {
      result = (result - 16 * 3) / videoGridColumn;
    } else {
      result = (result - 16 * 4) / videoGridColumn;
    }
    // 计算单张图片高度及标题、内容高度，相加计算网格布局总高度
    return (result / 0.66 + 45) * 4;
  }
}