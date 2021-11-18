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
          SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
               fit: BoxFit.cover, 
            ),
          ),        ],

      ): ListView.builder(itemBuilder:(ctx,index){
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
          child: ListTile(
            
            leading: CircleAvatar(
              radius: 30,
              // ignore: unnecessary_string_escapes
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(child: Text('Rs.${transections[index].amount}')),
              ),
            ),
            title: Text(
              transections[index].title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(DateFormat.yMMMd().format(transections[index].date,),
            style: TextStyle(
              fontSize: 16
            ),
            ),
          ),
        );
      },
      itemCount: transections.length,


        
      ),
    );
  }
}
