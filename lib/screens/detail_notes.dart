import 'package:flutter/material.dart';
import 'package:sqflite_test/models/note.dart';

class DetailNotesPage extends StatelessWidget {
  final Notes? notes;

  const DetailNotesPage(this.notes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Judul Catatan:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text('${notes!.judul}'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Isi Catatan:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text('${notes!.isi}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
