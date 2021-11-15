// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:expanse_planner/models/transection.dart';
import 'package:expanse_planner/widgets/new_transections.dart';
import 'package:expanse_planner/widgets/transection_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expanses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: Colors.amberAccent),
        fontFamily: 'Quicksand',
       
       
         
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransections = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'weekly groceries',
      amount: 20.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'phone',
      amount: 10.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransection(
    String title,
    double amount,
  ) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransections.add(newTx);
    });
  }

  void _startAddNewTransection(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransections(_addNewTransection),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expanses',
        
        ),
        actions: <Widget>[
          IconButton(
            onPressed:() => _startAddNewTransection(context),
            
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransectionList(_userTransections),
          ],
        ),

        // ignore: prefer_const_literals_to_create_immutables
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed:() => _startAddNewTransection(context),
        
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
