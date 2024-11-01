import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  Duration selectedTime = Duration(
    hours: TimeOfDay.now().hour,
    minutes: TimeOfDay.now().minute,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Saat Seçimi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // CupertinoTimerPicker ile saat ve dakika seçimi
          SizedBox(
            height: 200,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              initialTimerDuration: selectedTime,
              onTimerDurationChanged: (Duration newTime) {
                setState(() {
                  selectedTime = newTime;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          // Seçilen saat gösterimi
          Text(
            'Seçilen Saat: ${selectedTime.inHours.toString().padLeft(2, '0')}:${(selectedTime.inMinutes % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
