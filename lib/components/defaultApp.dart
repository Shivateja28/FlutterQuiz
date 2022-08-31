import 'package:assignment/components/question.dart';
import 'package:assignment/components/questionModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    String userName = args.toString().substring(1, args.toString().length - 1);

    return (Scaffold(
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/db.json"),
            builder: (context, snapshot) {
              var li = [];
              var mydata = jsonDecode(snapshot.data.toString());

              for (int i = 0; i < mydata.length; i++) {
                questionModel x = questionModel(
                  name: userName,
                  no: mydata[i]["no"],
                  question: mydata[i]["question"],
                  option1: mydata[i]["option1"],
                  option2: mydata[i]["option2"],
                  option3: mydata[i]["option3"],
                  option4: mydata[i]["option4"],
                  answer: mydata[i]["answer"],
                  given: "",
                );
                li.add(x);
              }
              print("Name" + li[0].name);
              print(li[0].no);
              return Question(questions: li, index: li[0].no);
            })));
  }
}

class userInfo extends StatefulWidget {
  const userInfo({Key? key}) : super(key: key);

  @override
  State<userInfo> createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  final formKey = GlobalKey<FormState>();

  var userName;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Name: ",
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "William John Malik",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    setState(() {
                      userName = value;
                    });
                    Navigator.pushNamed(context, '/myapp',
                        arguments: {userName});
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("Valid");
                    } else {
                      print("Invalid");
                    }
                  },
                  child: const Text('Click to Start'),
                ),
              ],
            ),
          ),
      ),
    ));
  }
}
