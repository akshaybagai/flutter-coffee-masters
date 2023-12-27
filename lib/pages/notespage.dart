import 'package:flutter/material.dart';

import '../datamanager.dart';

class Notes extends StatelessWidget {
  final DataManager dataManager;

  const Notes({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return const Text("Write Something Here");
  }
}
