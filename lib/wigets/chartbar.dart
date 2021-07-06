import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
 double spendingprocoftotal;
  ChartBar(this.lable, this.spendingAmount,);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(20, 20, 20, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingprocoftotal,
                child: Container
                (
                  decoration: BoxDecoration
                  (
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(lable),
      ],
    );
  }
}
