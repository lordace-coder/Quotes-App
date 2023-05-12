import 'package:flutter/material.dart';
import 'models/quote_formater.dart';
import 'mainpage.dart';

class QuotesList extends StatelessWidget {
  QuotesList({super.key});
  final Quotes authList = Quotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Authors list'),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: authList.getdatalist().length,
            itemBuilder: (BuildContext context, int index) {
              return authorContainer(
                  authList.getdatalist()[index], context, index);
            }),
      ),
    );
  }
}

// customise container widget for displaying list
Widget authorContainer(String authname, BuildContext context, int index) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(81, 0, 0, 0),
        width: 2,
      ),
    ),
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          authname,
          style: const TextStyle(fontSize: 18.4),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(
                  selected_quote: index,
                ),
              ),
            );
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: const Text('Visit'),
        ),
      ],
    ),
  );
}
