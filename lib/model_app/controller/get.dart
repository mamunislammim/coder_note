import 'dart:convert';
import 'dart:developer';

import 'package:coder_note/model_app/model/note.dart';
import 'package:http/http.dart' as http;

class GetDataFromAPI {
  Future<List<NoteModel>> getData() async {
    try {
      Uri u = Uri.parse("https://appapi.coderangon.com/api/notes");
      var r = await http.get(u);
      if (r.statusCode == 200) {
        var data = jsonDecode(r.body)['notes'];

        List<NoteModel> a = [];
        for (var i in data) {
          a.add(NoteModel.fromJson(i));
        }
        return a;
      }
    } catch (e) {
      log('===Error : $e');
    }
    return [];
  }
}
