import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardNote extends StatefulWidget {
  const CardNote({
    Key? key,
  }) : super(key: key);

  @override
  State<CardNote> createState() => _CardNoteState();
}

class _CardNoteState extends State<CardNote> {
  /// Item Nota
  Column itemNote(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(right: 5, bottom: 5),
            child: const Text(
              'Nota',
              style: textStyleSubtitle,
            )),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Escribir nota...',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 25, top: 10, left: 5, right: 5),
      decoration: boxShadow,
      child: itemNote(context),
    );
  }
}
