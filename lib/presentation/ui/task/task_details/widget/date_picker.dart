import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100]
      ),
      child: DatePicker(
        DateTime.now(),
        height: 75,
        daysCount: 30,
        initialSelectedDate: DateTime.now(),
        selectionColor: Theme.of(context).primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[400]),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[400]),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[400]),
        ),
        onDateChange: (date) {},
      ),
    );
  }
}
