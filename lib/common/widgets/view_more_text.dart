import 'package:flutter/material.dart';

class ViewMoreText extends StatefulWidget {
  const ViewMoreText({
    super.key,
    required this.animeDetails,
  });

  final String animeDetails;

  @override
  State<ViewMoreText> createState() => _ViewMoreTextState();
}

class _ViewMoreTextState extends State<ViewMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(
          widget.animeDetails,
          style: TextStyle(
          ),
          maxLines: isExpanded ? 500 : 5,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? "View Less" : "View More",
                style: TextStyle(

                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}