import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/datetime.dart';

class DateSelector extends StatefulWidget {
  static String id = 'DateSelector';
  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime _startDate = DateTime.now().add(const Duration(days: 9));
  DateTime _endDate = DateTime.now().add(const Duration(days: 10));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDateButton(
                  label: 'Check-in',
                  date: _startDate,
                  onChanged: (date) {
                    setState(() {
                      _startDate = date;
                    });
                    Provider.of<DateData>(context, listen: false)
                        .updateStartDate(_startDate.day);
                  }),
              _buildDateButton(
                  label: 'Check-out',
                  date: _endDate,
                  onChanged: (date) {
                    setState(() {
                      _endDate = date;
                    });
                    Provider.of<DateData>(context, listen: false)
                        .updateEndDate(_endDate.day);
                  }),
            ],
          ),
          const SizedBox(height: 30),
          Material(
            elevation: 5.0,
            color: const Color(0xff004aad),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              minWidth: double.infinity,
              height: 42.0,
              child: const Text(
                'Apply Dates',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateButton(
      {required String label,
      required DateTime date,
      required ValueChanged<DateTime> onChanged}) {
    TextStyle style = const TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
    return TextButton(
        onPressed: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(const Duration(days: 10)),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)),
          );

          if (selectedDate != null) {
            onChanged(selectedDate);
          }
        },
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xffa6a6a6)),
            ),
            Text(
              DateFormat.yMMMd().format(date),
              style: style,
            ),
          ],
        ));
  }
}
