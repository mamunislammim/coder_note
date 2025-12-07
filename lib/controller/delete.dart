import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class DeleteNote {
  Future deleteNote({required int id}) async {
    try {
      Uri uri = Uri.parse("https://appapi.coderangon.com/api/notes/delete/$id");
      var response = await http.delete(uri);
      if (response.statusCode == 200) {
        EasyLoading.showSuccess("Deleted");
        return;
      } else if (response.statusCode == 404) {
        EasyLoading.showError("Already Deleted or Wrong ID");
        return;
      }
    } catch (e) {
      log("== Error : $e");
    }
  }
}
