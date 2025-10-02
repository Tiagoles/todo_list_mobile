import 'package:flutter/cupertino.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/date_time_extensions.dart';

class OrderCardViewModel{

  final DateTime dateOpened;
  final ({int months, int days})? difference;

  OrderCardViewModel(this.dateOpened) :
    difference = dateOpened.getDifferenceBetweenDates(DateTime.now());

  String get differenceString {
    String differenceString = 'Há ';

    if(difference!.months > 0) {
      differenceString += '${difference!.months} '
          '${difference!.months > 1 ? 'meses' : 'mês'}';
    }

    if(difference!.days > 0){
      if(difference!.months > 0) differenceString += ' e ';
      differenceString += '${difference!.days} '
          '${difference!.days > 1 ? 'dias' : 'dia'}';
    }
    return difference!.months == 0 && difference!.days == 0 ? 'Lançada Hoje' : differenceString;
  }

  Color getStatusColor(BuildContext context) {
    final colors = context.colors;
    if(difference!.months > 0) return colors.errorContainer;
    if(difference!.days >= 10) return colors.tertiaryContainer;
    return context.customColors.success.colorContainer;
  }
}