import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/note_data.dart';

class EditScreen extends StatelessWidget {
  final int notIndex;
  EditScreen({super.key, required this.notIndex});
  TextEditingController titleController = TextEditingController();
  TextEditingController captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<NoteData>(context, listen: true);
    titleController.text = provide.listOfNotes[notIndex].title;
    captionController.text = provide.listOfNotes[notIndex].caption;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit note"),
        actions: [
          IconButton(
            onPressed: () {
              Note newNote = Note(
                title: titleController.text,
                caption: captionController.text,
              );
              provide.edit(newNote, notIndex);
              Navigator.pop(context);
            },
            icon: Icon(Icons.check),
          ),
        ],
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
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Edit title",
                prefixIcon: Icon(Icons.title),
              ),
              maxLines: 1,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
            child: TextField(
              controller: captionController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Edit caption",
                prefixIcon: Icon(Icons.note),
              ),
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
