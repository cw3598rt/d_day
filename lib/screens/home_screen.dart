import 'package:dart_date/dart_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final fomatter = DateFormat.yMd();

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _pickedDate = DateTime.now();

  void _pickDate(DateTime date) {
    setState(() {
      _pickedDate = date;
    });
  }

  void onTapOpenDatePicker() {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            width: double.infinity,
            child: CupertinoDatePicker(
              initialDateTime: _pickedDate,
              maximumDate: _pickedDate,
              onDateTimeChanged: (value) {
                _pickDate(value);
              },
              backgroundColor: Colors.white,
              mode: CupertinoDatePickerMode.date,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final passedDate = DateTime.now().diff(_pickedDate).inDays;

    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Column(
            children: [
              Text("기념일~"),
              Text(
                fomatter.format(_pickedDate),
              ),
              SizedBox(
                height: 16,
              ),
              IconButton(
                onPressed: onTapOpenDatePicker,
                icon: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text("D + ${passedDate + 1}"),
            ],
          ),
          Spacer(),
          Image.asset(
            "assets/images/love.png",
          ),
        ],
      ),
    );
  }
}
