import 'package:flutter/material.dart';
import 'package:quizzler/main.dart';
import 'package:quizzler/question.dart';

enum SingingCharacter { True, False }

class NewQuestion extends StatefulWidget {
  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {
  SingingCharacter _character = SingingCharacter.True;
  final myController = TextEditingController();
  bool answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 80.0, 32.0, 32.0),
                child: TextField(
                  style: TextStyle(
                      fontSize: 15.0, height: 2.0, color: Colors.black),
                  controller: myController,
                ),
              ),
              ListTile(
                title: const Text('True'),
                leading: Radio(
                  value: SingingCharacter.True,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('False'),
                leading: Radio(
                  value: SingingCharacter.False,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (_character == SingingCharacter.True) {
                    answer = true;
                  } else {
                    answer = false;
                  }
                  quizBrain.questionBank
                      .add(Question(myController.text, answer));
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Question Added'),
                  ));
                },
                child: Text('Add Question'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
