import 'package:flutter/material.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Save Changes?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Do you want to save the changes?'),
          ],
        ),
      ),
      actions:[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // User doesn't want to save
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // User wants to save
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}