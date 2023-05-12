import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/quote_formater.dart';

class MainPage extends StatelessWidget {
  int selected_quote;
  Quotes newquote = Quotes();

  MainPage({super.key, required this.selected_quote}) {
    newquote.currentdata = selected_quote;
    newquote.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        constraints: const BoxConstraints.tightFor(width: null, height: 1000),
        margin: const EdgeInsets.all(50.0),
        child: ScopedModel<Quotes>(
          model: newquote,
          child: Center(
            child: ScopedModelDescendant<Quotes>(
              builder: (context, child, model) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${newquote.quote}',
                      style: pacifico(26),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "~ ${newquote.name}",
                          style: pacifico(20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextButton(
                            onPressed: () {
                              newquote.prevdata();
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.pink)),
                            // icon:
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.skip_previous_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Prev",
                                  style: pacifico(19),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextButton(
                            onPressed: () {
                              newquote.nextdata();
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.pink)),
                            // icon:
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.skip_next_rounded,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Next",
                                  style: pacifico(19),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}

TextStyle pacifico(double size) {
  return TextStyle(fontFamily: 'pacifico', fontSize: size, color: Colors.white);
}
