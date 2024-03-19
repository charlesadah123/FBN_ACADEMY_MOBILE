import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  const FormFields(
      {super.key, required this.formLabel, required this.formHint});

  final String formLabel;
  final String formHint;

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
          TextField(
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
          )
        ],
      ),
    );
  }
}

class FormFieldPassword extends StatelessWidget {
  const FormFieldPassword(
      {super.key, required this.formLabel, required this.formHint});

  final String formLabel;
  final String formHint;

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
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintStyle: const TextStyle(
                  fontSize: 12.0,
                ),
                hintText: formHint,
                suffixIcon: const Icon(Icons.visibility_outlined)),
          )
        ],
      ),
    );
  }
}
