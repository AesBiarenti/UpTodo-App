import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Uyarı"),
          content: const Text("Girdiğiniz veriler kaybolacak. Çıkmak istediğinize emin misiniz?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Vazgeç"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Çık"),
            ),
          ],
        ),
      ) ??
      false;
}
