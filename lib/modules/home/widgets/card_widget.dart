import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CardWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
