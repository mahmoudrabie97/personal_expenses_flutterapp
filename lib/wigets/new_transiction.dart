import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransiction extends StatefulWidget {
  final Function txadd;

  NewTransiction(this.txadd);

  @override
  _NewTransictionState createState() => _NewTransictionState();
}

class _NewTransictionState extends State<NewTransiction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  DateTime _selecteddate;

  void submited() {
    if (amountcontroller.text.isEmpty) {
      return;
    }
    final entertitle = titlecontroller.text;
    final enteramount = double.parse(amountcontroller.text);
    if (entertitle.isEmpty || enteramount <= 0 || _selecteddate == null) {
      return;
    }

    widget.txadd(
      entertitle,
      enteramount,
      _selecteddate 

    );
    Navigator.of(context).pop();
  }

  void _presentdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickerdate) {
      setState(() {
        if (pickerdate == null) {
          return;
        }
        _selecteddate = pickerdate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              controller: titlecontroller,
              onSubmitted: (_) => submited(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submited(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(_selecteddate == null
                      ? 'No data choosen '
                      : DateFormat.yMd().format(_selecteddate)),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentdatepicker,
                      child: Text(
                        ' choose date ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            FlatButton(
              child: Text('ADD transiction '),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: submited,
            )
          ],
        ),
      ),
    );
  }
}
