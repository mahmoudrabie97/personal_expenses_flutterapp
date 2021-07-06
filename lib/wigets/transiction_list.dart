import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasictions.dart';

class TransictionList extends StatelessWidget {
  TransictionList(this.transactions,this.removetran);
  final List<Transiction> transactions;
  final Function removetran;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  ' No tranaction found ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].data),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete,color: Colors.red,),
                        onPressed: ()
                        {
                          removetran( transactions[index].id);
                          },
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
