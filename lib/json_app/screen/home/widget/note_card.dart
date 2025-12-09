import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../widgets/text.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({super.key, required this.data, required this.onDelete, required this.onEdit});
  final Map data;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.greenAccent.shade200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: CustomTextWidget(title: data['note'], color: Colors.black, fs: 15, maxLine: 4),
            ),
            Expanded(
              flex: 2,
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onEdit,
                    child: Icon(Icons.edit_note),
                  ),
                  InkWell(
                    onTap: onDelete,
                    child: Icon(Icons.delete_forever, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
