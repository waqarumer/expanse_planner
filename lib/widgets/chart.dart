// ignore_for_file: prefer_const_constructors

import 'package:expanse_planner/models/transection.dart';
import 'package:expanse_planner/widgets/char_bar.dart';
import 'package:expanse_planner/widgets/transection_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  

  
                       
  final List<Transaction> recentTransection;
  const Chart(this.recentTransection, {Key? key}) : super(key: key);
  


  List<Map<String,Object>> get groupedTransectionValues{
    return List.generate(7,(index){
      final weekDay = DateTime.now().subtract(Duration(
        days: index
      ),);
      var totalSum = 0.0;
      for(var i = 0; i < recentTransection.length; i++){
        if(
          recentTransection[i].date.day == weekDay.day &&
          recentTransection[i].date.month == weekDay.month && 
          recentTransection[i].date.year == weekDay.year
          ){
              
           totalSum += recentTransection[i].amount;   

        }
      }
      // print(DateFormat.E().format(weekDay));
      // print(totalSum);
      return {
        'day' : DateFormat.E().format(weekDay).substring(0,1),
        'amount' : totalSum
        };
    } );
  }

  double get totalSpending {
    return groupedTransectionValues.fold(0.0,(sum,item,){
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransectionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransectionValues.map((data){
          return ChartBar(data['day'], data['amount'],(data['amount'] as double)/totalSpending);
        }).toList(),
      ),
    );
  }
}

