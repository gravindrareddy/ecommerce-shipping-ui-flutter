import 'package:flutter/material.dart';

void main() => runApp(EcommerceOrderForm());

class EcommerceOrderForm extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Order Placing Form - Flutter Practise',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.greenAccent[600],

        // Define the default font family.
        fontFamily: 'LexendDeca',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
          title: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
        ),
      ),
      home: Scaffold(
        appBar: customAppBar,
        body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(child: FormStepWidget("1")),
                Expanded(child: FormStepIndicatorWidget("1")),
                Expanded(
                    flex: 8,
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(color: Colors.blue),
                      alignment: Alignment(-1, -1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Column1", textAlign: TextAlign.left),
                          Text(
                            "ToDo: Form fields & Buttons",
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}

/// Custom bold text widget with all required styles, size, etc

class _SmallTextBoldWidget extends StatelessWidget {
  final String text;

  ///@required will force users to pass value, else, compilation error
  _SmallTextBoldWidget(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );
  }
}

/// Custom normal text widget with all required styles, size, etc

class _SmallTextWidget extends StatelessWidget {
  final String text;

  ///@required will force users to pass value, else, compilation error
  _SmallTextWidget(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      textAlign: TextAlign.left,
    );
  }
}

/// Custom AppBar with all the required content and action items

final customAppBar = AppBar(
  backgroundColor: Colors.white,
  leading: Icon(
    Icons.dehaze,
    color: Colors.black,
  ),
  title: Padding(
      padding: EdgeInsets.all(5),
      child: Image.asset('assets/images/tracking.png')),
  actions: <Widget>[
    Row(children: [
      IconButton(
        icon: Image.asset("assets/images/boy.png"),
        onPressed: () {},
        color: Colors.pink,
      )
    ])
  ],
);

/// Widget to show steps verbose of the Form and also to differentiate active vs inactive.
/// In future, this widget shall accept the active page number based on the current page of a form.
/// In fact, that's the reason, this class is extended from statefulwidget

class FormStepWidget extends StatefulWidget {
  final String currentFormPage;

  ///@required will force users to pass value, else, compilation error
  FormStepWidget(this.currentFormPage);

  @override
  State<StatefulWidget> createState() {
    return FormStepState(currentFormPage);
  }
}

class FormStepState extends State<FormStepWidget> {
  final String currentFormPage;

  ///@required will force users to pass value, else, compilation error
  FormStepState(this.currentFormPage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(color: Colors.black12),
      alignment: Alignment(-1, -1),
      child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Create Shipment",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              _SmallTextBoldWidget(
                "Step 1 of 6 - Shipper",
              )
            ],
          )),
    );
  }
}

/// Widget to show steps 1,2,3,4, etc of the Form and also to differentiate active vs inactive
/// In future, this widget shall accept the active page number based on the current page of a form.
/// In fact, that's the reason, this class is extended from statefulwidget

class FormStepIndicatorWidget extends StatefulWidget {
  final String currentFormPage;

  ///@required will force users to pass value, else, compilation error
  FormStepIndicatorWidget(this.currentFormPage);

  @override
  State<StatefulWidget> createState() {
    return FormStepIndicatorState(currentFormPage);
  }
}

class FormStepIndicatorState extends State<FormStepIndicatorWidget> {
  final String currentFormPage;

  ///@required will force users to pass value, else, compilation error
  FormStepIndicatorState(this.currentFormPage);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(color: Colors.white),
      alignment: Alignment(-1, -1),
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ///ToDo: Call Active or Inactive widgets based on the input page number of the form
              ActiveCircleAvatarWidget("1"),
              Expanded(
                  child: Container(
                      child: Divider(
                color: Colors.grey,
                height: 36,
              ))),
              InactiveCircleAvatarWidget("2"),
              Expanded(
                  child: Container(
                      child: Divider(
                color: Colors.grey,
                height: 36,
              ))),
              InactiveCircleAvatarWidget("3"),
              Expanded(
                  child: Container(
                      child: Divider(
                color: Colors.grey,
                height: 36,
              ))),
              InactiveCircleAvatarWidget("4"),
              Expanded(
                  child: Container(
                      child: Divider(
                color: Colors.grey,
                height: 36,
              ))),
              InactiveCircleAvatarWidget("5"),
              Expanded(
                  child: Container(
                      child: Divider(
                color: Colors.grey,
                height: 36,
              ))),
              InactiveCircleAvatarWidget("6"),
            ],
          ))),
    );
  }
}

/// Stateless widget class to indicate the active page of the form

class ActiveCircleAvatarWidget extends StatelessWidget {
  String content;

  ActiveCircleAvatarWidget(this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      radius: 12,
      child: Text(content),
    );
  }
}

/// Stateless widget class to indicate the inactive page of the form

class InactiveCircleAvatarWidget extends StatelessWidget {
  String content;

  InactiveCircleAvatarWidget(this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.grey)),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey,
          child: Text(content),
          radius: 12,
        ));
  }
}
