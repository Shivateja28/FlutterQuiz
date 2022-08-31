import 'package:assignment/components/questionModel.dart';
import 'package:assignment/components/resultApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Question extends StatelessWidget {
  var questions;
  var index;
  Question({this.questions, this.index});

  var answerr;

  @override
  Widget build(BuildContext context) {
    var question = questions[index - 1];
    return (Scaffold(
        appBar: AppBar(
          title: Text("Question : ${index} / 10"),
        ),
        body: Center(
          child: Card(
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                width: 500.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Q. ${question.question} : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        OutlinedButton(
                          child: Text(
                            'A. ${question.option1}',
                            style: TextStyle(fontSize: 20.0),
                          ),  
                          onPressed: () {
                            print("${question.option1}");
                            questions[index - 1].given = question.option1;
                            if (question.option1 == question.answer) {
                              print("Correct Answer");
                            } else {
                              print("Wrong Answer");
                            }
                            if (index <= 9) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Question(
                                  questions: questions,
                                  index: questions[index].no)
                                )
                              );
                            }
                            if (index == 10) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Result(questions: questions))
                              );
                            }
                          }
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        OutlinedButton(
                          child: Text(
                            'B. ${question.option2}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {
                            print("${question.option2}");
                            questions[index - 1].given = question.option2;
                            if (question.option2 == question.answer) {
                              print("Correct Answer");
                            } else {
                              print("Wrong Answer");
                            }
                            if (index <= 9) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Question(
                                  questions: questions,
                                  index: questions[index].no)
                                )
                              );
                            }
                            if (index == 10) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Result(questions: questions))
                              );
                            }
                          }
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        OutlinedButton(
                          child: Text(
                            'C. ${question.option3}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {
                            print("${question.option3}");
                            questions[index - 1].given = question.option3;
                            if (question.option3 == question.answer) {
                              print("Correct Answer");
                            } else {
                              print("Wrong Answer");
                            }
                            if (index <= 9) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Question(
                                  questions: questions,
                                  index: questions[index].no)
                                )
                              );
                            }
                            if (index == 10) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Result(questions: questions))
                              );
                            }
                          }
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        OutlinedButton(
                          child: Text(
                            'D. ${question.option4}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {
                            print("${question.option4}");
                            questions[index - 1].given = question.option4;
                            if (question.option4 == question.answer) {
                              print("Correct Answer");
                            } else {
                              print("Wrong Answer");
                            }
                            if (index <= 9) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Question(
                                  questions: questions,
                                  index: questions[index].no)
                                )
                              );
                            }
                            if (index == 10) {
                              Navigator.push( context,
                                MaterialPageRoute(builder: (_) => Result(questions: questions))
                              );
                            }
                          }
                        ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        )));
  }
}
