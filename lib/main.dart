import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/provider/custom_provider.dart';
import 'package:providertest/provider/language_provider.dart';
import 'package:providertest/provider/question_provider.dart';

import 'list_example.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => CustomProvider()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:const ListExample(),
          ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    log("called second page build");
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Welcome"),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("POP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log("---------------------------");
    log("CALLED BUILD OF HOMEPAGE");
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const WidgetOne(),
              const SizedBox(
                height: 20,
              ),
              const WidgetTwo(),
              const SizedBox(
                height: 20,
              ),
              const WidgetThree(),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SecondPage()));
                },
                child: const Text("Second Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetOne extends StatefulWidget {
  const WidgetOne({super.key});

  @override
  State<WidgetOne> createState() => _WidgetOneState();
}

class _WidgetOneState extends State<WidgetOne> {
  @override
  Widget build(BuildContext context) {
    log("called One build");
    return ChangeNotifierProvider(
      create: (context) => CustomProvider(),
      builder: (context, child) => Container(
        height: 200,
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          children: [
            const Text("WidgetOne"),
            Selector<CustomProvider, int>(
              selector: (context, provider) => provider.widgetOneValue,
              builder: (context, value, child) {
                log("rebuild Widget One Selector");
                return Text("$value");
              },
            ),

            //sc
           /*  Consumer<CustomProvider>(
              builder: (context, provider, child) {
                log("rebuild Widget One Consumer");
                return Text("${provider.widgetOneValue}");
              },
            ), */
            TextButton(
              onPressed: () {
                Provider.of<CustomProvider>(context, listen: false)
                    .updatwWidgetOne();
              },
              child: const Text("Update Widget One"),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetTwo extends StatefulWidget {
  const WidgetTwo({super.key});

  @override
  State<WidgetTwo> createState() => _WidgetTwoState();
}

class _WidgetTwoState extends State<WidgetTwo> {
  @override
  Widget build(BuildContext context) {
    log("called Two build");
    return Container(
      height: 200,
      color: Colors.green,
      width: double.infinity,
      child: Column(
        children: [
          const Text("WidgetTwo"),
          Selector<CustomProvider, int>(
            selector: (_, provider) => provider.widgetTwoValue,
            builder: (context, value, child) {
              log("rebuild Widget two Selector");
              return Text("$value");
            },
          ),
          /* Consumer<CustomProvider>(
            builder: (context, provider, child){
              log("rebuild Widget two Consumer");
              return Text("${provider.widgetTwoValue}");
            },
          ), */
          TextButton(
            onPressed: () {
              Provider.of<CustomProvider>(context, listen: false)
                  .updatwWidgetThree();
            },
            child: const Text("Update Widget Two"),
          ),
        ],
      ),
    );
  }
}

class WidgetThree extends StatefulWidget {
  const WidgetThree({super.key});

  @override
  State<WidgetThree> createState() => _WidgetThreeState();
}

class _WidgetThreeState extends State<WidgetThree> {
  @override
  Widget build(BuildContext context) {
    log("called widgetThree build");
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          const Text("WidgetThree"),
          Selector<CustomProvider, int>(
            selector: (_, provider) => provider.widgetThreeValue,
            builder: (context, value, child) {
              log("rebuild Widget Three Selector");
              return Text("$value");
            },
          ),
          /* Consumer<CustomProvider>(
            builder: (context, provider, child){
              log("rebuild Widget Three Consumer");
              return Text("${provider.widgetThreeValue}");
            },
          ), */
          TextButton(
            onPressed: () {
              Provider.of<CustomProvider>(context, listen: false)
                  .updatwWidgetThree();
            },
            child: const Text("Update Widget Three"),
          ),
        ],
      ),
    );
  }
}
