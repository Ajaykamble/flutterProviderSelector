import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/model/question.dart';
import 'package:providertest/provider/question_provider.dart';

class MultiChoice extends StatefulWidget {
  final MultiChoiceQuestion question;
  final int index;
  const MultiChoice({super.key, required this.question, required this.index});

  @override
  State<MultiChoice> createState() => _MultiChoiceState();
}

class _MultiChoiceState extends State<MultiChoice> {
  late QuestionProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<QuestionProvider>(context, listen: false);
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
        ...widget.question.options.map(
          (e) => MaterialButton(
            onPressed: () {},
            child: Text(e),
          ),
        ),
      ],
    );
  }
}
