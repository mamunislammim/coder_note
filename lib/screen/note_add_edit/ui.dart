import 'dart:developer';

import 'package:coder_note/controller/add.dart';
import 'package:coder_note/controller/update.dart';
import 'package:coder_note/widgets/text.dart';
import 'package:flutter/material.dart';

class NoteAddEditScreen extends StatefulWidget {
  const NoteAddEditScreen({super.key, required this.screenType, this.note, this.id});
  final String screenType;
  final String? note;
  final int? id;

  @override
  State<NoteAddEditScreen> createState() => _NoteAddEditScreenState();
}

class _NoteAddEditScreenState extends State<NoteAddEditScreen> {
  TextEditingController noteC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    noteC.text = widget.note ?? "";
    log("======${widget.id}=======");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: CustomTextWidget(title: widget.screenType, fs: 25),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          TextField(
            controller: noteC,
            maxLines: 10,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
          ),
          ElevatedButton(
            onPressed: () async {
              log("======${noteC.text}========");
              if (widget.screenType == "Note Add") {
                await NoteAdd.addNote(data: noteC.text);
              } else {
                await NoteUpdate.noteUpdate(i: widget.id ?? 0,title: noteC.text);
              }
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
