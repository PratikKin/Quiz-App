import 'package:flutter/material.dart';
import 'package:quiz/Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int que_no = 0;
  bool correctAns = false;
  List<Icon> scoreKeeper = [];

  List<Question> Quest = [
    Question(q: "You can lead a cow down stairs but not up stairs.", a: false),
    Question(
        q: "Approximately one quarter of human bones are in the feet.",
        a: true),
    Question(q: "A slug's blood is green.", a: true),
  ];

  //Question.dart is question-answer class

  void checkAns(bool userAns) {
    correctAns = Quest[que_no].queAns;
    setState(() {
      if (userAns == correctAns) {
        scoreKeeper.add(Icon(Icons.check_box, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(
          Icons.error,
          color: Colors.red,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        Quest[que_no].queText,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {

                      if (que_no < 2) {
                        checkAns(true);
                        que_no += 1;
                      }
                      else if(que_no >= 2){
                        checkAns(true);
                        que_no = 0;
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "RFLUTTER ALERT",
                          desc: "Flutter is more awesome with RFlutter Alert.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "COOL",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();

                      }
                    });
                  },
                  child: Text(
                    "True",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      checkAns(false);
                      if (que_no < 3) que_no += 1;
                      if (que_no >= 3) que_no = 0;
                    });
                  },
                  child: Text(
                    "False",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              )),
              //TODO : Here the score recorder come
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
