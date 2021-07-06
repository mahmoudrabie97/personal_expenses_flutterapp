import 'package:flutter/material.dart';
import '../models/trasictions.dart';
import 'package:intl/intl.dart';
import './chartbar.dart';

class Chart extends StatelessWidget {
  Chart(this.recenttransaction);
  final List<Transiction> recenttransaction;
  List<Map<String, Object>> get groupedTransictionvalue {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(
          Duration(
            days: index,
          ),
        );
        double totalsum = 0;
        for (var i = 0; i < recenttransaction.length; i++) {
          if (recenttransaction[i].data.day == weekday.day &&
              recenttransaction[i].data.month == weekday.month &&
              recenttransaction[i].data.year == weekday.year) {
            totalsum = totalsum + recenttransaction[i].amount;
          }
        }
        print(DateFormat.E().format(weekday));
        print(totalsum);

        return {'day': DateFormat.E().format(weekday), 'amount': totalsum};
      },
    ).reversed.toList();
  }
  double get totalspanding
  {

    return groupedTransictionvalue.fold(0, (sum, item)
    {

      return sum+item['amount'];
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransictionvalue);
    return Card(
      elevation: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransictionvalue.map((data) {
        return  Flexible( fit: FlexFit.tight,  child: ChartBar(data['day'],data['amount']));
      }).toList()),
    );
  }
}
