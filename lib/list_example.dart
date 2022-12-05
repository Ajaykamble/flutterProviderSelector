import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/provider/question_provider.dart';
import 'package:providertest/views/choice_widget.dart';
import 'package:providertest/views/multi_choice.dart';
import 'package:providertest/views/text_question.dart';

import 'model/question.dart';

class ListExample extends StatefulWidget {
  const ListExample({super.key});

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  late QuestionProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<QuestionProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    log("ASK", name: "SWEKEN");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          provider.addMethod();
        },
      ),
      /* body: Consumer<QuestionProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: provider.questionList.length,
          itemBuilder: (BuildContext context, int index) {
            return Text("s");
          },
        ),
      ), */

      body: Selector<QuestionProvider, int> /* Consumer<QuestionProvider> */ (
        selector: (_, provider) => provider.questionList.length,
        builder: (context, value, child) {
          log("CALLED");
          return ListView.builder(
            itemCount: value,
            //value.questionList.length,
            itemBuilder: (context, index) {
              switch (provider.questionList[index].runtimeType) {
                case ChoiceQuestion:
                  return Selector<QuestionProvider, int>(
                    selector: (_, provider) => provider.lastUpdated,
                    shouldRebuild: (previous, next) {
                      return index == next;
                    },
                    builder: (context, value, child) => ChoiceWidget(
                        question:
                            (provider.questionList[index] as ChoiceQuestion),
                        index: index),
                  );
                case MultiChoiceQuestion:
                  return Selector<QuestionProvider, MultiChoiceQuestion>(
                    selector: (_, provider) =>
                        provider.questionList[index] as MultiChoiceQuestion,
                    builder: (context, value, child) => MultiChoice(
                        question:
                            provider.questionList[index] as MultiChoiceQuestion,
                        index: index),
                  );
                default:
                  return Selector<QuestionProvider, TextFieldQuestion>(
                    selector: (p0, provider) =>
                        provider.questionList[index] as TextFieldQuestion,
                    builder: (context, value, child) => TextQuestion(
                        question:
                            provider.questionList[index] as TextFieldQuestion,
                        index: index),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
