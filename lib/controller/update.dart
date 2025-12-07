import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class NoteUpdate {
  static noteUpdate({required int i,required String title}) async {
    try {
      Uri uri = Uri.parse("https://appapi.coderangon.com/api/notes/update/$i");
      var result = await http.put(uri, body: {"note": title}, headers: {"Accept": "Application/json"});

      log("======${result.body}============");
      if (result.statusCode == 200) {
        EasyLoading.showSuccess("Note Updated");
        return;
      } else {
        EasyLoading.showError("Update Failed");
        return;
      }
    } catch (e) {
      log("Error : $e");
    }
  }
}
