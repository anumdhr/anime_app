import 'package:flutter/material.dart';

class AnimeInfoText extends StatelessWidget {
  const AnimeInfoText({
    super.key,
    required this.label,
    required this.info,
  });

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: label, style: Theme.of(context).textTheme.bodyMedium, children: [
          TextSpan(
            text: info,
          ),
        ]));
  }
}
