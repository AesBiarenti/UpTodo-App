import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDate = DateTime.now();
  int? selectedDay;
  late int daysInMonth;
  late int firstDayOfMonth;

  @override
  void initState() {
    super.initState();
    _calculateDaysInMonth();
  }

  void _calculateDaysInMonth() {
    final firstDay = DateTime(selectedDate.year, selectedDate.month, 1);
    final nextMonth = DateTime(selectedDate.year, selectedDate.month + 1, 1);
    setState(() {
      daysInMonth = nextMonth.subtract(const Duration(days: 1)).day;
      firstDayOfMonth = firstDay.weekday;
    });
  }

  void _changeMonth(int offset) {
    setState(() {
      selectedDate = DateTime(
          selectedDate.year, selectedDate.month + offset, selectedDate.day);
      selectedDay = null; // Ay değiştiğinde seçimi temizle
      _calculateDaysInMonth();
    });
  }

  String _getMonthName(int month) {
    const monthNames = [
      "Ocak",
      "Şubat",
      "Mart",
      "Nisan",
      "Mayıs",
      "Haziran",
      "Temmuz",
      "Ağustos",
      "Eylül",
      "Ekim",
      "Kasım",
      "Aralık"
    ];
    return monthNames[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    const weekDays = ["Pzt", "Sal", "Çar", "Per", "Cum", "Cmt", "Paz"];

    return Column(
      children: [
        // Ay değiştirme butonları
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => _changeMonth(-1),
            ),
            Text(
              '${_getMonthName(selectedDate.month)} ${selectedDate.year}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => _changeMonth(1),
            ),
          ],
        ),
        // Haftanın günleri
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDays
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: daysInMonth + firstDayOfMonth - 1,
            itemBuilder: (context, index) {
              if (index < firstDayOfMonth - 1) {
                return const SizedBox.shrink();
              }

              final day = index - firstDayOfMonth + 2;
              final isToday = today.year == selectedDate.year &&
                  today.month == selectedDate.month &&
                  today.day == day;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDay = day; // Seçilen günü güncelle
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isToday
                        ? Colors.blue.withOpacity(0.3) // Şu anki tarihin rengi
                        : (selectedDay == day
                            ? Colors.deepPurple[300]
                            : Colors.grey[200]), // Seçilen tarihin rengi
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '$day',
                    style: TextStyle(
                      fontSize: 16,
                      color: isToday
                          ? Colors.blue[100]
                          : (selectedDay == day ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
