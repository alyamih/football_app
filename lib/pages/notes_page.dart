import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/model/notes.dart';
import 'package:football_app/pages/add_note_page.dart';
import 'package:football_app/widgets/bottom_bar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key, required this.callBack});
  final Function() callBack;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    super.initState();
    getSP();
  }

  List<Notes> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 65, bottom: 42),
              child: Text(
                'Notes',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
            ),
            if (notes.isEmpty)
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Add your notes about matches',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                        ),
                      ),
                      Image.asset('assets/add_note.png')
                    ]),
              ),
            if (notes.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: getNotes(),
                )),
              ),
            BottomBar(
              callBack: () {
                widget.callBack();
              },
            )
          ]),
          Positioned(
            bottom: 110,
            right: 16,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => AddNotePage(
                            note: Notes(),
                            callBack: (note) {
                              notes.add(note);
                              addToSP(notes);
                              setState(() {});
                            },
                          )),
                );
              },
              child: Container(
                height: 62,
                width: 62,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF87112)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getNotes() {
    List<Widget> list = [];
    for (var note in notes) {
      list.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CupertinoContextMenu(
          actions: <Widget>[
            CupertinoContextMenuAction(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => AddNotePage(
                            note: note,
                            callBack: (note) {
                              addToSP(notes);
                              setState(() {});
                            },
                          )),
                );
              },
              trailingIcon: Icons.edit,
              child: const Text('Edit'),
            ),
            CupertinoContextMenuAction(
              onPressed: () {
                notes.remove(note);
                addToSP(notes);
                setState(() {});
                Navigator.pop(context);
              },
              isDestructiveAction: true,
              trailingIcon: CupertinoIcons.delete,
              child: const Text('Delete'),
            ),
          ],
          child: Material(
            color: Colors.transparent,
            elevation: 0.0,
            child: Container(
              width: 343,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xFFe8e8e8),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      note.text!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Divider(
                      color: Colors.black.withOpacity(0.3),
                      height: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("EEEE, dd MMMM.").format(note.date!),
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            color: Color(0xFFF87112)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  Future<void> addToSP(
    List<Notes>? notes,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    if (notes != null) {
      prefs.setString('notes', jsonEncode(notes));
    }
  }

  void getSP() async {
    final prefs = await SharedPreferences.getInstance();

    final List<dynamic> jsonData = jsonDecode(prefs.getString('notes') ?? '[]');

    notes = jsonData.map<Notes>((jsonList) {
      {
        return Notes.fromJson(jsonList);
      }
    }).toList();
    setState(() {});
  }
}
