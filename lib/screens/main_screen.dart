import 'package:flutter/material.dart';
import 'package:sqflite_test/database/db_helper.dart';
import 'package:sqflite_test/models/note.dart';
import 'package:sqflite_test/screens/detail_notes.dart';
import 'package:sqflite_test/screens/form_notes.dart';

class ListNotesPage extends StatefulWidget {
  const ListNotesPage({Key? key}) : super(key: key);

  @override
  _ListNotesPageState createState() => _ListNotesPageState();
}

class _ListNotesPageState extends State<ListNotesPage> {
  List<Notes> listNotes = [];
  DBHelper db = DBHelper();

  @override
  void initState() {
    _getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ui tampilan awal
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: listNotes.length,
        itemBuilder: (context, index) {
          Notes notes = listNotes[index];
          return Container(
              child: Column(children: [
            ListTile(
              onTap: () {
                //edit
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailNotesPage(notes),
                    ));
              },
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                "${notes.judul}",
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              //overflow: TextOverflow.ellipsis(pada text…)
              subtitle: Text(
                "${notes.isi}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  _deleteNotes(notes, index);
                },
                icon: const Icon(Icons.delete),
              ),
              leading: IconButton(
                onPressed: () {
                  _openFormEdit(notes);
                },
                icon: const Icon(Icons.edit),
              ),
            )
          ]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          //add
          _openFormCreate();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getAllNotes() async {
    var list = await db.getAllNotes();
    setState(() {
      listNotes.clear();
      for (var notes in list!) {
        listNotes.add(Notes.fromMap(notes));
      }
    });
  }

  //form create
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FormNotes()));
    if (result == 'save') {
      await _getAllNotes();
    }
  }

  Future<void> _deleteNotes(Notes notes, int position) async {
    await db.deleteNotes(notes.id!);

    setState(() {
      listNotes.removeAt(position);
    });
  }

  //form edit
  Future<void> _openFormEdit(Notes notes) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormNotes(notes: notes)));

    if (result == 'update') {
      await _getAllNotes();
    }
  }
}
