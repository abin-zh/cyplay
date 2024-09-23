import { Movie } from '../viewmodel/Movie'
import { TabItem } from '../viewmodel/TableItem';
import { MovieItem } from './MovieItem'

@Component
export struct LatestMovieList {
  @StorageProp("currentBreakpoint") currentBreakpoint: string = "sm";
  @Consume('tabList') tabList: Array<TabItem>
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
    Column() {
      ForEach(this.tabList, (item: TabItem, index: number) => {
        //不显示播放列表
        if (item?.CollectionType && item.CollectionType != 'playlists') {
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {

            Text('最新的 ' + item.Name) {

            }
            .textAlign(TextAlign.Start)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)

            Text("查看更多") {

            }
          }
          .margin({ bottom: 8 })
          .width('100%')

          List() {
            ForEach(this.movieList, (item: Movie, index: number) => {
              ListItem() {
                Column() {
                  MovieItem({ movie: item, currentBreakpoint: this.currentBreakpoint })
                }
              }
              .margin({ right: 16 })
            }, (item: Movie, index: number) => index + JSON.stringify(item))
          }
          .listDirection(Axis.Horizontal)
          .scrollBarWidth(0)
          .height(this.getMovieImgAspectRatio(this.currentBreakpoint) * 150 + 45)
          .margin({ bottom: 16 })
        }
      })
    }
  }

  getMovieImgAspectRatio(currentBreakpoin: string): number {
    switch (currentBreakpoin) {
      case 'sm':
      case 'md':
        return 1;
      case 'lg':
        return 1.2;
    }
    return 1;
  }
}