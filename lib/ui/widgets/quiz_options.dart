import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_trivia/models/category.dart';
import 'package:open_trivia/models/question.dart';
import 'package:open_trivia/resources/api_provider.dart';
import 'package:open_trivia/ui/pages/error.dart';
import 'package:open_trivia/ui/pages/quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget
{
  final Category category;
  const QuizOptionsDialog({Key key, this.category}) : super(key: key);
  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog>
{
  int _noOfQuestions;
  String _difficulty;
  bool processing;

  @override
  void initState()
  { 
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView
    (
        child: Column
        (
          children: <Widget>
          [
            Container
            (
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.indigo.shade700,
              //Theme.of(context).textTheme.headline6.copyWith() [text style below]
              child: Text
              (
                widget.category.name,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                textAlign: TextAlign.center,
                
              )
            ),

            const SizedBox(height: 15.0),
            const Text("Select Total Number of Questions", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),

            SizedBox
            (
              width: double.infinity,
              child: Wrap
              (
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 15.0,
                spacing: 15.0,
                children: <Widget>
                [
                  //SizedBox(width: 0.0),
                  ActionChip
                  (
                    label: const Text("10"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 10 ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(10),
                  ),
                  ActionChip
                  (
                    label: const Text("20"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 20 ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(20),
                  ),
                  ActionChip
                  (
                    label: const Text("30"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 30 ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(30),
                  ),
                  ActionChip
                  (
                    label: const Text("40"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 40 ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(40),
                  ),
                  ActionChip
                  (
                    label: const Text("50"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 50 ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(50),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Text("Select Difficulty", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            SizedBox
            (
              width: double.infinity,
              child: Wrap
              (
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 15.0,
                spacing: 15.0,
                children: <Widget>
                [
                  ActionChip
                  (
                    label: const Text("Any"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == null ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty(null),
                  ),
                  ActionChip
                  (
                    label: const Text("Easy"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == "easy" ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty("easy"),
                  ),
                  ActionChip
                  (
                    label: const Text("Medium"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == "medium" ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty("medium"),
                  ),
                  ActionChip
                  (
                    label: const Text("Hard"),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == "hard" ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty("hard"),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            // Raised Button [below]
            processing ? const CircularProgressIndicator() : ElevatedButton
            (
              onPressed: _startQuiz,
              child: const Text('Start Quiz', style: TextStyle(color: Colors.white, fontSize: 20) ),
              style: ButtonStyle
              (
                shape: MaterialStateProperty.all<RoundedRectangleBorder>
                (
                  RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) )
                )
              )
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      );
  }

  _selectNumberOfQuestions(int i){setState(() {_noOfQuestions = i;});}
  _selectDifficulty(String s){setState(() {_difficulty=s;});}

  void _startQuiz() async
  {
    setState((){processing=true;});
    try
    {
      List<Question> questions =  await getQuestions(widget.category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if(questions.length < 1)
      {
        Navigator.of(context).push
        (
          MaterialPageRoute
          (
            builder: (_) => const ErrorPage(message: "There are not enough questions in the category, with the options you have selected.")
          )
        );
        return;
      }

      Navigator.push
      (
        context,
        MaterialPageRoute
        (
          builder: (_) => QuizPage(questions: questions, category: widget.category,)
        )
      );
    }
    
    on SocketException catch (_)
    {
      Navigator.pushReplacement
      (
        context,
        MaterialPageRoute
        (
          builder: (_) => const ErrorPage(message: "Can't reach the servers. \n Please check your internet connection.")
        )
      );
    } catch(e)
    {
      print(e.message);
      Navigator.pushReplacement
      (
        context,
        MaterialPageRoute
        (
        builder: (_) => const ErrorPage(message: "Unexpected error trying to connect to the API.")
        )
      );
    }
    setState(() {processing=false;});
  }
}