import 'package:flutter/material.dart';
import 'package:instrabaho/component/searchCard.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            SearchCard(
              title: 'Searching for a skilled workers?',
              subtitle: 'Anywhere?  Anytime?  In an instant?',
            )
          ],
        ),
      ),
    );
  }
}
