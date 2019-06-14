import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output="0";

  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";


  buttonpressed (String buttonText) {
    if (buttonText == "CLEAR") {
       _output = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand="";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget Buildbutton(String buttonText)
  {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(24.0),
        child: Text(buttonText,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        onPressed: ()=> buttonpressed(buttonText)

        ,
        color: Colors.blueAccent,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
            vertical:12.0,
          horizontal: 12.0
        ),
                child: Text(output,style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold
                ),)),

            Expanded(
              child: Divider(),
            ),
            Column(children: <Widget>[
                 Row(
                children:[
                  Buildbutton("7"),Buildbutton("8"),
                  Buildbutton("9"),Buildbutton("/"),]
              ),
                 Row(
                     children:[
                       Buildbutton("4"),Buildbutton("5"),
                       Buildbutton("6"),Buildbutton("X"),]
                 ),
                 Row(
                     children:[
                       Buildbutton("1"),Buildbutton("2"),
                       Buildbutton("3"),Buildbutton("-"),]
                 ),
                 Row(
                     children:[
                       Buildbutton("."),Buildbutton("0"),
                       Buildbutton("00"),Buildbutton("+"),]
                 ),
                 Row(
                     children:[
                       Buildbutton("CLEAR"),Buildbutton("="),
            ])
            ])

          ],
        ),
      )
      );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
