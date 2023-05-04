import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Note {
  final String title;
  final String caption;
  Note({
    required this.title,
    required this.caption,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'caption': caption,
    };
  }
}

class NoteData extends ChangeNotifier {
  List<Note> listOfNotes = [];
  bool isCheck = false;
  void changeIcon() {
    !isCheck ? isCheck = true : isCheck = false;
    print(isCheck);
    notifyListeners();
  }

  void add(Note note) {
    listOfNotes.add(note);
    notifyListeners();
  }

  void edit(Note note, int index) {
    listOfNotes[index] = note;
    notifyListeners();
  }

  saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<String> templist = [];
    for (var i = 0; i < listOfNotes.length; i++) {
      templist.add(jsonEncode(listOfNotes[i]));
    }
    pref.remove('noteList');
    pref.setStringList('noteList', templist);
  }

  loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getStringList('noteList') != null) {
      List<String> tempList = pref.getStringList('noteList')!;
      for (int i = 0; i < tempList.length; i++) {
        Map<String, dynamic> temp = jsonDecode(tempList[i]);
        add(
          Note(
            title: temp['title'],
            caption: temp['caption'],
          ),
        );
      }
    }
  }
}
