import { Movie } from '../viewmodel/Movie';
import display from '@ohos.display';
import { MovieItem } from './MovieItem';

@Component
export struct MovieGrid {
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
      ForEach(this.movieList, (item: Movie) => {
        GridItem() {
          MovieItem({ movie: item, currentBreakpoint: this.currentBreakpoint })
        }
      }, (item: Movie, index: number) => index + JSON.stringify(item))
    }
    .columnsTemplate(this.getColumnsTemplate(this.currentBreakpoint))
    .edgeEffect(EdgeEffect.Spring)
    .columnsGap(16)
    .rowsGap(16)
  }

  getMovieImgAspectRatio(currentBreakpoin: string): number{
    switch (currentBreakpoin){
      case 'sm':
      case 'md': return 1;
      case 'lg': return 1.2;
    }
    return 1;
  }

  /**
   * 获取列数
   * @param currentBreakpoint 当前断点
   * @returns
   */
  getColumnCount(currentBreakpoint: string): number {
    switch (currentBreakpoint){
      case 'sm': return 3;
      case 'md': return 5;
      case 'lg': return 6;
    }
    return 3;
  }

  /**
   * 获取列模板
   * @param currentBreakpoint 当前断点
   * @returns
   */
  getColumnsTemplate(currentBreakpoint: string): string {
    const columnCount = this.getColumnCount(currentBreakpoint);
    return '1fr '.repeat(columnCount).trim();
  }

  /**
   * 获取行模板
   * @param currentBreakpoint 当前断点
   * @returns
   */
  getRowsTemplate(currentBreakpoint: string): string {
    const rowCount = Math.ceil(this.movieList.length / this.getColumnCount(currentBreakpoint)) + 1;
    return '1fr '.repeat(rowCount).trim();
  }

  // 计算网格布局总高度
  getGridHeight(videoGridColumn: number, currentBreakpoint: string, windowWidth: number, listLength: number): number {
    // 获取窗口宽度，减掉两侧空白部分
    let result: number = px2vp(windowWidth) - 32;
    if (currentBreakpoint === 'lg') {
      result = result - 100;
    }

    // 根据网格列数计算单张图片宽度
    if (videoGridColumn <= 1) {
      return 300;
    } else {
      result = (result - 16 * (videoGridColumn -   1)) / videoGridColumn;
    }

    // 计算单张图片高度及标题、内容高度，相加计算网格布局总高度
    return (result / 0.66 + 45) * Math.ceil(listLength / videoGridColumn + 1);
  }
}