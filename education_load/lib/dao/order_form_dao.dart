
import 'package:flutter_yjh/models/order_form_entity.dart';

class OrderFormDao{

  static Future<OrderFormEntity> fetch() async{
    Future<OrderFormEntity> result = Future((){
      var itemList = List<OrderFormListItem>.generate(12, (i){
        OrderFormListItem item = AllItem()..id = i;
        switch(i % 4){
          case 0:
            item..status='等待支付'
            ..type = OrderForm.payment;
            break;
          case 1:
            item..status='订单已支付'
              ..type = OrderForm.pending;
            break;
          case 2:
            item..status='订单已完成'
              ..type = OrderForm.comment;
            break;
          case 3:
            item..status='订单已评价'
              ..type = OrderForm.afterSale;
            break;
        }
        return item..storeName="java课程"
        ..imgUrl='images/recommendedCourse1.jpg'
        ..title='JavaScript 深入浅出'
        ..price=1999
        ..amount=1
        ..weight=''
        ..total=1999;
      });
        return OrderFormEntity(itemList);
    });
    return result;
  }

}