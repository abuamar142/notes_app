import "package:flutter/material.dart";
import "package:sqflite_test/database/db_helper.dart";
import "package:sqflite_test/models/note.dart";

class FormNotes extends StatefulWidget {
  final Notes? notes;

  const FormNotes({super.key, this.notes});

  @override
  _FormNotesState createState() => _FormNotesState();
}

class _FormNotesState extends State<FormNotes> {
  DBHelper db = DBHelper();

  TextEditingController? judul;
  TextEditingController? isi;

  @override
  void initState() {
    judul = TextEditingController(
        text: widget.notes == null ? "" : widget.notes!.judul);
    isi = TextEditingController(
        text: widget.notes == null ? "" : widget.notes!.isi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: () {
              upsertNotes();
            },
            icon: const Icon(Icons.save),
          ),
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: ListView(
            children: [
              Container(
                child: Column(children: [
                  TextFormField(
                    controller: judul,
                    decoration:
                        const InputDecoration(hintText: 'Judul Catatan'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: isi,
                    maxLines: 2,
                    decoration: const InputDecoration(hintText: 'Isi Catatan'),
                  ),
                ]),
              ),
            ],
          )),
    );
  }

  //update insert notes
  Future<void> upsertNotes() async {
    if (widget.notes != null) {
      //insert
      await db.updateNotes(Notes.fromMap({
        'id': widget.notes!.id,
        'judul': judul!.text,
        'isi': isi!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //update
      await db.saveNotes(Notes(
        judul: judul!.text,
        isi: isi!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
