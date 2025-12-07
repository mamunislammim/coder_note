import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class NoteAdd {
 static Future<void> addNote({required String data}) async {
    try {
      Uri uri = Uri.parse("https://appapi.coderangon.com/api/notes/add");
      var response = await http.post(uri, body: {"note": data}, headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("Note Added");
        return;
      } else {
        EasyLoading.showError("Something Wrong");
      }
    } catch (e) {
      log("Error : $e");
    }
  }
}
