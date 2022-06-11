import 'package:flutter/material.dart';

const int maxFailedLoadAttempts = 3;

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('appbar'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Image.asset("images/demoimage.jpg"),
                Column(
                  children: const <Widget>[
                    SizedBox(height: 10),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF4CBE99),
                      ),
                      child: const Text(
                        "Download",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
