import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _notes = <String>["Primeiro item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < _notes.length; i++)
              CardWidget(
                title: _notes[i],
                onTap: () async {
                  final response = await Navigator.pushNamed(
                      context, "/create-note",
                      arguments: _notes[i]);

                  if (response != null) {
                    final description = response as String;
                    if (description.isEmpty) {
                      _notes.removeAt(i);
                    } else {
                      _notes[i] = description;
                    }

                    setState(() {});
                  }
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final description =
              await Navigator.pushNamed(context, "/create-note");
          if (description != null) {
            _notes.add(description as String);
            setState(() {});
          }
        },
      ),
    );
  }
}
