import 'package:flutter/material.dart';
import 'package:lttimer/i18n/translations.g.dart';

class SettingsInputDialog extends StatefulWidget {
  final String title;
  final String hintText;
  final String defaultValue;
  final ValueChanged<String> onTapOK;
  const SettingsInputDialog(
      {required this.defaultValue,
      required this.title,
      required this.hintText,
      required this.onTapOK,
      super.key});

  @override
  State<StatefulWidget> createState() => _SettingsInputDialogState();
}

class _SettingsInputDialogState extends State<SettingsInputDialog> {
  late final TextEditingController _textFieldController =
      TextEditingController(text: widget.defaultValue);

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(hintText: widget.hintText),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(t.settings.buttonCancel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(t.settings.butotnClear),
          onPressed: () {
            _textFieldController.clear();
          },
        ),
        TextButton(
          child: Text(t.settings.buttonOK),
          onPressed: () {
            Navigator.pop(context);
            widget.onTapOK(_textFieldController.text);
          },
        ),
      ],
    );
  }
}
