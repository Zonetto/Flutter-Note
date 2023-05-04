import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/note_data.dart';
import 'editScreen.dart';

class ShowNoteScreen extends StatelessWidget {
  final int notIndex;
  ShowNoteScreen({super.key, required this.notIndex});
  TextEditingController titleController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<NoteData>(context, listen: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditScreen(
                  notIndex: notIndex,
                ),
              ),
            );
          },
          icon: Icon(Icons.edit),
        ),
      ),
      appBar: AppBar(
        title: const Text("Show note"),
        actions: [],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
            child: Text(
              provide.listOfNotes[notIndex].title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
            child: Text(
              provide.listOfNotes[notIndex].caption,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
