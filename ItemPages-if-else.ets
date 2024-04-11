class  Item {
  name: String
  image: ResourceStr
  price: Number
  discount: number

  constructor(name: String, image: ResourceStr, price: number, discount: number = 0 ) {
    this.name = name
    this.image = image
    // @ts-ignore
    this.price = price
    this.discount = discount
  }
}

@Entry
@Component
struct ItemPages {
  // 商品数据
  private items: Array<Item> = [
    new Item('华为Mate60', $r('app.media.icon'), 6999,  500),
    new Item('华为Mate60', $r('app.media.icon'), 6999),
    new Item('华为Mate60', $r('app.media.icon'), 6999),
    new Item('华为Mate60', $r('app.media.icon'), 6999),
    new Item('华为Mate60', $r('app.media.icon'), 6999),

  ]

  build() {
    Column({space: 8}){
      Row(){
        Text('商品列表')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({bottom:20})

      // 以上代码-->整个构建了屏幕的第一行的文字和外边距及字体大小

      ForEach(
        this.items,        //循环渲染那个（item函数）
        item => {
         Row({space: 10}){       //从这里开始是循环体
           Image(item.image)
             .width(100)
           Column({space: 4}){
             if (item.discount) {
               Text(item.name)
                 .fontSize(20)
                 .fontWeight(FontWeight.Bold)
               Text('原价'+ item.price)
                 .fontSize(18)
                 .fontColor('#36D')
               Text('折扣'+ (item.price -item.discount))
                 .fontSize(18)
                 .fontColor('#36D')
               Text('补贴'+(item.discount))
                 .fontSize(18)
                 .fontColor('#36D')
             }else{
               Text(item.name)
                 .fontSize(20)
                 .fontWeight(FontWeight.Bold)
               Text('￥'+ item.price)
                 .fontSize(18)
                 .fontColor('#36D')
             }

           }                      //到这里循环体结束
           .height('100%')
           .alignItems(HorizontalAlign.Start)      //这里是指循环体的位置大小
         }
         .width('100%')
         .backgroundColor('#FFF')
         .borderRadius(20)
         .width(120)
         .padding(10)                     //这里定义的是循环的整个大小和样式
        }
      )
      // 以上代码-->针对就是RorEach的循环渲染
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)            //到这里就是整个构造页面的样式和大小

  }
}


