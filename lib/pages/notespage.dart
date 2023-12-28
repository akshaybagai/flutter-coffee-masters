import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../datamanager.dart';

class Notes extends StatefulWidget {
  final DataManager dataManager;

  const Notes({super.key, required this.dataManager});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('en'),
              ),
            ),
          ),
          SizedBox(
            width: 600,
            height: 150,
            child: Card(
              elevation: 7,
              color: Theme.of(context).secondaryHeaderColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "${_controller.document.getPlainText(0, _controller.document.length)}"),
              ),
            ),
          ),
          Expanded(
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: _controller,
                readOnly: false,
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('en'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
