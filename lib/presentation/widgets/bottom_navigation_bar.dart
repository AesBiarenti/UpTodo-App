import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/widgets/svg_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [SvgWidget(assetName: "Vector"), Text("Home")],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgWidget(assetName: "calendar"),
                        Text("Calendar")
                      ]),
                )),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [SvgWidget(assetName: "timer"), Text("Timer")],
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgWidget(assetName: "user"), Text("Profile")],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
