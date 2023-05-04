import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/note_data.dart';

class CreateNote extends StatelessWidget {
  CreateNote({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<NoteData>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create note"),
        actions: [
          IconButton(
            onPressed: () async {
              Note newNote = Note(
                title: titleController.text,
                caption: captionController.text,
              );
              provide.add(newNote);
              provide.saveData();
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
              decoration:const InputDecoration(
                border: InputBorder.none,
                hintText: "Note title",
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
                hintText: "Note caption",
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
