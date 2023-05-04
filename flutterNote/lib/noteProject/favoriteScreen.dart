import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/note_data.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<NoteData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Note favorite"),
      ),
      body: Container(
        height: 150.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[300],
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
              children: const [
                Text(
                  "Ahmed",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  endIndent: 50.0,
                ),
                Text(
                  "Ahmed",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
