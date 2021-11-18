// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransections extends StatefulWidget {
  final Function addTx;

  const NewTransections(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransections> createState() => _NewTransectionsState();
}

class _NewTransectionsState extends State<NewTransections> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now()).then((pickedDate){
        if(pickedDate == null){
          return;
        }
        setState(() {
        _selectedDate = pickedDate;  
        });
        
      });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   amountInput = val;
              // },
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      // ignore: unnecessary_null_comparison
                      _selectedDate == null
                      ? 'No Date Choosen !'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                       ),
                  ),
                  MaterialButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    ),
                ],
              ),
            ),
            ElevatedButton(
               onPressed: () {
               _submitData();
               },
              child: Text(
               'Add Transaction',
               style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold
               ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
