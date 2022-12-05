import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/model/question.dart';
import 'package:providertest/provider/question_provider.dart';

class TextQuestion extends StatefulWidget {
  final TextFieldQuestion question;
  final int index;
  const TextQuestion({super.key, required this.question, required this.index});

  @override
  State<TextQuestion> createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  late TextEditingController _controller;
  late QuestionProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<QuestionProvider>(context, listen: false);
    _controller = TextEditingController(text: widget.question.answer);
  }

  @override
  Widget build(BuildContext context) {
    log("rebuild ${widget.question.questioId}");
    return Column(
      children: [
        Text(widget.question.questioId),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _controller,
          onChanged: (value) {
            (provider.questionList[widget.index] as TextFieldQuestion).answer =
                value;
          },
          decoration: const InputDecoration(hintText: "Enter Text"),
        ),
        
      ],
    );
  }
}
