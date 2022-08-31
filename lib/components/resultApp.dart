import 'package:flutter/material.dart';
import 'dart:convert';

class Result extends StatelessWidget {
  var questions;
  var li = [];
  var correct = 0;
  Result({this.questions});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].given == questions[i].answer) {
        correct += 1;
      }
      print("${questions[i].given}");
      li.add(questions[i]);
    }
    return (Scaffold(
        appBar: AppBar(
          title: Text("Result"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "${li[0].name}!! Your Score : $correct / 10",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  )),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: li
                      .map(
                        (value) => Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                if (value.given == value.answer)
                                  Icon(Icons.done)
                                else
                                  Icon(Icons.close),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${value.question}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 16, 78, 59)),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Your Answer : ${value.given}",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                              "Correct Answer : ${value.answer}",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        )));
  }
}
