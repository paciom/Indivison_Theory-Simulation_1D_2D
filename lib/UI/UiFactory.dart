import 'package:flutter/material.dart';

class UiFactory {
  Widget TooltipButton({required String text, required String tooltip, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Tooltip(
        message: tooltip,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }

  Widget NumberInput({required TextEditingController controller, required String labelText}) {
    return Expanded(
        child: TextField(
      controller: controller,
      decoration: InputDecoration(border: const OutlineInputBorder(), labelText: labelText),
    ));
  }
}
