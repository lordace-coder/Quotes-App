import 'package:flutter/material.dart';
import 'quotes_list.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'pacifico'),
    debugShowCheckedModeBanner: false,
    home: const QuotesPage(),
  ));
}

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuotesList(),
    );
  }
}
