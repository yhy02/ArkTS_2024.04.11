@Entry
@Component
struct Index {
  @State imageWidth: number = 150

  build() {
    Column() {         //在列（或行）容器中还可以直接用函数space--表示行（或行）间距{space：xx}所有行或列都分开
      Row(){
        Image($r('app.media.icon'))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)
        }
        .width('100%')
        .height(400)
        .justifyContent(FlexAlign.Center)

      Row(){
        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        TextInput({text: this.imageWidth.toFixed(0)})
          .width(150)
          .backgroundColor('#fff')
          .fontWeight(FontWeight.Bold)
          .type(InputType.Number)
          .onChange( value => {
            this.imageWidth = parseInt(value)
          })
      }
        .width('100%')
        .padding({left:15, right:15,})             //内边距
        .justifyContent(FlexAlign.SpaceBetween)

        Divider()                                 //分割线
          .width('90%')
          .color("#36D")
      Row(){
        Button('缩小')
          .width(80)
          .fontSize(23)
          .onClick(() => {
            if(this.imageWidth >= 10){
              this.imageWidth -= 10
            }
          })

        Button('放大')
          .width(80)
          .fontSize(23)
          .onClick(() => {
            if(this.imageWidth < 300){
              this.imageWidth += 10
            }
          })
      }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .padding({left:30, right:30, top:50,})         //控制内边距
        //.margin(30)                       //控制外边距  他们两个的写法都可以直接写或者用{}对象方法谢

      Slider({
        min: 150,
        max: 300,
        value: this.imageWidth,
        step: 10,

      })
        .width('100%')
        .blockColor('#36D')
        .padding({top:50,})
        .trackThickness(7)
        .showTips(true)
        .onChange((value => {
          this.imageWidth = value
        }))
    }
    .width('100%')
    .height('100%')
  }
}