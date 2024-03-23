// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  const FormFields(
      {super.key,
      required this.formLabel,
      required this.formHint,
      required this.formController});

  final String formLabel;
  final String formHint;
  final TextEditingController formController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(formLabel,
                style: const TextStyle(
                  color: Color(0xFF003B65),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
          ),
          TextFormField(
            controller: formController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintStyle: const TextStyle(
                  fontSize: 12.0,
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF003B65), width: 2)),
                hintText: formHint),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}

class FormFieldPassword extends StatefulWidget {
  const FormFieldPassword(
      {super.key,
      required this.formLabel,
      required this.formHint,
      required this.formController});

  final String formLabel;
  final String formHint;
  final TextEditingController formController;

  @override
  State<FormFieldPassword> createState() => _FormFieldPasswordState();
}

class _FormFieldPasswordState extends State<FormFieldPassword> {
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.formLabel,
                style: const TextStyle(
                  color: Color(0xFF003B65),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
          ),
          TextFormField(
              controller: widget.formController,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              obscureText: _hideText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintStyle: const TextStyle(
                  fontSize: 12.0,
                ),
                hintText: widget.formHint,
                suffixIcon: IconButton(
                    icon: Icon(
                        _hideText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hideText = !_hideText;
                      });
                    }),
              )),
        ]));
  }
}
