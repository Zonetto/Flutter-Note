import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'createNote.dart';
import 'data/note_data.dart';
import 'showNotes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<NoteData>(context, listen: true);
    if (!isLoaded) {
      provide.loadData();
      print('1');
      isLoaded = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Note app",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNote(),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: provide.listOfNotes.length,
        itemBuilder: (context, index) {
          return note(
            noteIndex: index,
            title: provide.listOfNotes[index].title,
            caption: provide.listOfNotes[index].caption,
          );
        },
      ),
    );
  }
}

class note extends StatelessWidget {
  final int noteIndex;
  final String title;
  final String caption;
  const note({
    super.key,
    required this.noteIndex,
    required this.title,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<NoteData>(context, listen: true);
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowNoteScreen(
              notIndex: noteIndex,
            ),
          ),
        );
      },
      child: Container(
        height: 150.0,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  pressedOpacity: 0.8,
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {
                    provide.changeIcon();
                  },
                  child: Container(
                    height: 150,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Icon(
                      color: Colors.red,
                      !provide.isCheck ? Icons.favorite_border : Icons.favorite,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  endIndent: 50.0,
                ),
                Text(
                  caption,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
