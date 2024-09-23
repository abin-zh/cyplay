import { File } from '../viewmodel/File'

@Component
export struct FileItem {
  @Prop file: File;
  @Prop currentBreakpoint: string;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }){
          Image(this.file.getLogo())
            .objectFit(ImageFit.Contain)
            .width(50)
            .height(50)
        }
        .height('100%')
        .width('100%')
        Text(this.file.name)
          .fontWeight(FontWeight.Bold)
          .height(45)
      }
      .shadow({
        radius: 16,
        color: "#e3e3e3",
        offsetX: 1,
        offsetY: 1
      })
      .borderRadius(16)
      .width(this.getFileImgAspectRatio(this.currentBreakpoint) * 100)
      .height(this.getFileImgAspectRatio(this.currentBreakpoint) * 150)
    }
    .aspectRatio(0.66)
    .margin({ bottom: 32 })
  }

  getFileImgAspectRatio(currentBreakpoint: string): number {
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
