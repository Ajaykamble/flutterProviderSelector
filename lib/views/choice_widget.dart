import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/model/question.dart';
import 'package:providertest/provider/question_provider.dart';

class ChoiceWidget extends StatefulWidget {
  final ChoiceQuestion question;
  final int index;
  const ChoiceWidget({super.key, required this.question, required this.index});

  @override
  State<ChoiceWidget> createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
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
          (e) => Column(
            children: [
              MaterialButton(
                onPressed: () {
                  provider.setAnswer(widget.index, e);
                },
                color: (widget.question.answer==null || widget.question.answer!=e)?Colors.red:Colors.green,
                child: Text(e,),
              ),
              const SizedBox(height: 5,)
            ],
          ),
        ),
      ],
    );
  }
}
