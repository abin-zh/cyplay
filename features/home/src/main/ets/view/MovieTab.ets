import { Movie } from '../viewmodel/Movie';
import { MovieGroup } from '../viewmodel/MovieGroup';
import { HomeHeader } from '../view/HomeHeader'
import { Banner } from '../view/Banner'

@Component
export struct MovieTab {

  @State movieList: Array<MovieGroup> = [
    new MovieGroup('1' ,'' ,[
      new Movie('238', '教父', 'https://image.tmdb.org/t/p/original/y03tzUKvkRCYwJ5NWys4W4bnS9m.jpg'),
      new Movie('240', '教父2', 'https://image.tmdb.org/t/p/original/4J8jUmjgKPggRPJqqdkjWCj2k0D.jpg'),
      new Movie('424', '辛德勒的名单', 'https://image.tmdb.org/t/p/original/kukYu89yda6NrifW5kpLoOTU7YH.jpg'),
    ]),
    new MovieGroup('2', '' ,[
      new Movie('278', '肖申克的救赎', 'https://image.tmdb.org/t/p/original/x6cLNyJWKK7jdaqL9UNPlvJJoVD.jpg'),
      new Movie('129', '千与千寻', 'https://image.tmdb.org/t/p/original/qIVSUzgVfg1citQeZdBDGKTinUb.jpg'),
      new Movie('13', '阿甘正传', 'https://image.tmdb.org/t/p/original/Ac68G8LkY4AJL6lXpClRP4uJMRV.jpg'),
    ]),
    new MovieGroup('2', '', [
      new Movie('122', '指环王3：王者无敌', 'https://image.tmdb.org/t/p/original/lgjEYpnVm5olPprvi8PPruLDorX.jpg'),
      new Movie('', '', ''),
      new Movie('', '', ''),
    ])
  ]

  build() {
    Scroll(){
      Column({space: 16}){
        HomeHeader()
        Banner()

        Text("高分佳片")
          .width('100%')
          .margin({top: 16,left: 8})
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)

        List({space: 16}){
          ForEach(this.movieList,(mp: MovieGroup) => {
            ListItem(){
              Row({ space: 8 }){
                ForEach(mp.groupList, (item: Movie) => {
                  Column(){
                    Image(item.imgUrl)
                      .borderRadius(16)
                      .shadow({radius: 16, color: "#e3e3e3", offsetX: 1,offsetY: 1})
                    Text(item.name)
                      .margin({top: 8})
                      .fontWeight(FontWeight.Bold)
                  }
                  .layoutWeight(1)
                })
              }
              .padding({left: 1, right: 1})
            }
          })
        }
        .height('98%')
        .listDirection(Axis.Vertical)
      }
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
    .padding(16)
  }
}