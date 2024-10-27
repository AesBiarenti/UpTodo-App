import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo_app/core/constants/theme_control.dart';
import 'package:uptodo_app/core/extensions/svg_extensions.dart';

class SvgWidget extends ConsumerWidget {
  final String assetName;
  const SvgWidget({required this.assetName, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      child: SvgPicture.asset(
        assetName.svgRouter,
       
      ),
    );
  }
}
