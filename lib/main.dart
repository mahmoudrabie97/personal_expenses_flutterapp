import 'package:flutter/material.dart';
import 'wigets/chart.dart';
import 'wigets/new_transiction.dart';
import './models/trasictions.dart';
import './wigets/transiction_list.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.yellow,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
            
            button: TextStyle(color: Colors.white)
            ),
            
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transiction> _usertransctions = [
    Transiction(
      id: 't1',
      title: 'New shoes ',
      amount: 69.99,
      data: DateTime.now(),
    ),
    Transiction(
      id: 't2',
      title: 'Weekly Crockies ',
      amount: 16.53,
      data: DateTime.now(),
    ),
    Transiction(
      id: 't3',
      title: 'addeed id ',
      amount: 20.53,
      data: DateTime.now(),
    ),
  ];

  List<Transiction> get _recentTransiction
  {
    return _usertransctions.where((tx) 
    {
      return tx.data.isAfter
      (
        DateTime.now().subtract(Duration(days: 7)),

    
      );

    }
   ) .toList();
  }
  void _addtransiction(String txtitle, double txAmount,DateTime choosendate) {
    final newtx = Transiction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txAmount,
        data:choosendate);
    setState(() {
      _usertransctions.add(newtx);
    });
  }
  void deletetrasaction(String id )
  {
    setState(() {
      _usertransctions.removeWhere((element)
 {
return element.id==id;

 }
 );
      
    });




  }

  void _startAddtransiction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransiction(_addtransiction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter App',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddtransiction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>
          [
            Chart(_recentTransiction),
            
            TransictionList(_usertransctions,deletetrasaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddtransiction(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
