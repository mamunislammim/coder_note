import 'package:coder_note/json_app/widgets/text.dart';
import 'package:coder_note/model_app/data/data.dart';
import 'package:coder_note/model_app/model/note.dart';
import 'package:flutter/material.dart';

import '../../controller/get.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<NoteModel> list = [];

  fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    list = await GetDataFromAPI().getData();
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: CustomTextWidget(title: "Home 2"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.blue,
            leading: CustomTextWidget(title: list[index].id.toString()),
            title: CustomTextWidget(title: list[index].note.toString()),
          ),
        ),
      ),
    );
  }
}
