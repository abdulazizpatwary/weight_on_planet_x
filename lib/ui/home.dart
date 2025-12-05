import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  /*
  Mercury: 0.38
  venus=0.91
  Earth: 1.0
  mars:0.38
  saturn:1.06
  jupiter:2.34
  uranus:0.92
  neptune:1.19
  pluto:0.06
   */
  final TextEditingController weightController= TextEditingController();
  int selected_value=0;
  double _finalResult=0.0;
  String formatedText="";

  void handleRadioValueChanged(int? value){
    if(value != null){
      setState(() {
        selected_value=value;
        switch(selected_value){
          case 0:
            _finalResult=calculateWeight(weightController.text,0.06);
            formatedText="Your weight on  Pluto is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 1:
            _finalResult=calculateWeight(weightController.text, 0.38);
            formatedText="Your weight on  Mars is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 2:
            _finalResult=calculateWeight(weightController.text, 0.91);
            formatedText="Your weight on  Venus is ${_finalResult.toStringAsFixed(1)}";
            break;

        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight on Planet X",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black38,
       ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
              "images/planet.png",
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In Pounds',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  //radio button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //radio buttons
                        Radio<int>(activeColor:Colors.brown,value: 0, groupValue: selected_value, onChanged: handleRadioValueChanged),
                        Text("Pluto",style: TextStyle(color:Colors.white30),),
                        Radio<int>(activeColor:Colors.red,value: 1, groupValue: selected_value, onChanged: handleRadioValueChanged),
                        Text("Mars",style: TextStyle(color:Colors.white30),),
                        Radio<int>(activeColor:Colors.orangeAccent,value: 2, groupValue: selected_value, onChanged: handleRadioValueChanged),
                        Text("Venus",style: TextStyle(color:Colors.white30),),
                      ],
                  ),
                  Padding(padding: EdgeInsets.all(15.6)),
                  //resultText
                  Text(weightController.text.isEmpty?"Please enter weight": "$formatedText lbs",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 19.4),),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight)*multiplier;
    }else{
      print('Wrong');
      return int.parse("180")*0.38;
    }
  }
}
