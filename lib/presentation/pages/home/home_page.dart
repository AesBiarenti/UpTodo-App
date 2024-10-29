import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uptodo_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:uptodo_app/presentation/widgets/float_ac_button.dart';
import 'package:uptodo_app/presentation/widgets/svg_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Index"),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list,
                size: 35,
              ),
            ),
          ),
          actions: const [
            CircleAvatar(),
            SizedBox(width: 15),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatAcButton(),
        bottomNavigationBar: const BottomNavBar(),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgWidget(assetName: "Checklist-rafiki 1")),
            Text("What do you want to do today?",
                style: TextStyle(fontSize: 20)),
            Text("Tap + to add your tasks", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
