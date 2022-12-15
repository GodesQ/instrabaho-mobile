import 'package:flutter/material.dart';
import 'package:instrabaho/component/myText.dart';
import 'package:ionicons/ionicons.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.subtitle, required this.title});
  final String subtitle, title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Ionicons.search_outline),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: title,
                      size: 15,
                      color: Colors.black87,
                      type: 'heading',
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    MyText(
                      text: subtitle,
                      size: 12,
                      type: 'light',
                    )
                  ],
                ),
              ],
            ),
            const Icon(Ionicons.options_outline),
          ],
        ),
      ),
    );
  }
}
