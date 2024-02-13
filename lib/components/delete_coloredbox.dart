import 'package:flutter/material.dart';

class DeleteColoredBox extends StatelessWidget {
  const DeleteColoredBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
