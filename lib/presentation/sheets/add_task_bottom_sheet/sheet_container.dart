import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/sheets/add_task_bottom_sheet/add_calendar_page.dart';
import 'package:uptodo_app/presentation/sheets/add_task_bottom_sheet/add_task_page.dart';
import 'package:uptodo_app/presentation/sheets/add_task_bottom_sheet/add_time_page.dart';

class SheetContainer extends StatefulWidget {
  const SheetContainer({super.key});

  @override
  State<SheetContainer> createState() => _SheetContainerState();
}

class _SheetContainerState extends State<SheetContainer> {
  final PageController _pageController = PageController();
  final int _currentIndex = 0;
  late TextEditingController taskTitleController;
  late TextEditingController taskDescController;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState() {
    super.initState();
    taskDescController = TextEditingController();
    taskTitleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: PageView(
          controller: _pageController,
          children: [
            AddTaskPage(
              taskTitleController: taskTitleController,
              taskDescController: taskDescController,
              onTap: _nextPage,
            ),
            const CalendarPage(),
            const TimePage(),
          ],
        ),
      ),
    );
  }
}
