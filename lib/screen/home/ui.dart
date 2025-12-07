import 'dart:developer';

import 'package:coder_note/controller/get.dart';
import 'package:coder_note/screen/home/widget/note_card.dart';
import 'package:flutter/material.dart';
import '../../controller/delete.dart';
import '../../widgets/text.dart';
import '../note_add_edit/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List noteData = [];
  bool a = false;

  fetchNoteData() async {
    a = true;
    setState(() {});
    var data = await GetNoteData().getData();
    noteData = data;
    log("========Note : $noteData===");
    a = false;
    setState(() {});
  }

  @override
  void initState() {
    fetchNoteData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: CustomTextWidget(title: 'Coder Note', fs: 25),
      ),
      body: a == true
          ? Center(child: CircularProgressIndicator())
          : noteData.isEmpty
          ? Center(child: CustomTextWidget(title: "No Notes Available"))
          : ListView.builder(
              itemCount: noteData.length,
              itemBuilder: (context, i) => NoteCardWidget(
                data: noteData[i],
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NoteAddEditScreen(screenType: "Note Edit", note: noteData[i]['note'], id: noteData[i]['id']),
                    ),
                  ).then((c) {
                    fetchNoteData();
                  });
                },
                onDelete: () async {
                  log("============ID : ${noteData[i]['id']}");
                  await DeleteNote().deleteNote(id: noteData[i]['id']);
                  fetchNoteData();
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoteAddEditScreen(screenType: 'Note Add'))).then((v) {
            fetchNoteData();
          });
        },
        child: Icon(Icons.add_circle_outline_rounded),
      ),
    );
  }
}
