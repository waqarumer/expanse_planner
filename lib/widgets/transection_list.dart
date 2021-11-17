// ignore_for_file: prefer_const_constructors

import 'package:expanse_planner/models/transection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransectionList extends StatelessWidget {
  final List<Transaction> transections;
  const TransectionList(this.transections, {Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height:500,
      child: transections.isEmpty ? Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Text('No transection edit yet'),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
               fit: BoxFit.cover, 
            ),
          ),        ],

      ): ListView.builder(itemBuilder:(ctx,index){
        return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Rs. ${transections[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transections[index].title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat().add_yMMMd().format(transections[index].date),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
      },
      itemCount: transections.length,


        
      ),
    );
  }
}
