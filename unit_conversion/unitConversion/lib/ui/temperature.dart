import 'package:flutter/material.dart';

import '../model/unit_List.dart';

class Temperature extends StatefulWidget {
  @override
  State<Temperature> createState() => _TemperatureConversion();
}

class _TemperatureConversion extends State<Temperature> {
  TextEditingController inputController = TextEditingController();
  String? _StartingUnit;
  String? _ConvertingUnit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text(
          "Unit Conversion",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 101, 236),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80),
                child: TextField(
                  controller: inputController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Enter Digits",
                  ),
                  onChanged: (text) {
                    _tempConversion();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("From",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: _StartingUnit,
                icon: const Icon(Icons.arrow_downward),
                elevation: 8,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
                underline: Container(
                  height: 4,
                  color: Colors.deepPurple,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _StartingUnit = newValue!;
                  });
                },
                items: temp.map<DropdownMenuItem<String>>((temp) {
                  return DropdownMenuItem<String>(
                    value: temp,
                    child: Text(temp),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("To",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: _ConvertingUnit,
                icon: const Icon(Icons.arrow_downward),
                elevation: 8,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
                underline: Container(
                  height: 4,
                  color: Colors.deepPurple,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _ConvertingUnit = newValue!;
                  });
                },
                items: temp.map<DropdownMenuItem<String>>((temp) {
                  return DropdownMenuItem<String>(
                    value: temp,
                    child: Text(temp),
                  );
                }).toList(),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // RaisedButton(
              //   onPressed: _tempConversion,
              //   color: Colors.amberAccent,
              //   child: const Text(
              //     "Convert",
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 17),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _tempConversion() {
    var userInput = double.parse(inputController.text);
    double? result;
////////////////////////  Celcius    ///////////////////////////////
    if (_StartingUnit == "Celcius" && _ConvertingUnit == "Fahrenheit") {
      result = (userInput * 1.8) + 32;
    } else if (_StartingUnit == "Celcius" && _ConvertingUnit == "Celcius") {
      result = (userInput * 1);
    } else if (_StartingUnit == "Celcius" && _ConvertingUnit == "Kelvin") {
      result = (userInput + 273.15);
    }

//////////////////// Fahrenheit  ///////////////////////////////////
    else if (_StartingUnit == "Fahrenheit" && _ConvertingUnit == "Celcius") {
      result = (userInput - 32) * 1.8;
    } else if (_StartingUnit == "Fahrenheit" &&
        _ConvertingUnit == "Fahrenheit") {
      result = (userInput * 1);
    } else if (_StartingUnit == "Fahrenheit" && _ConvertingUnit == "Kelvin") {
      result = (userInput - 32) * 0.55 + 255.37;
    }

    ////////////////////  Kelvin   ////////////////////////
    else if (_StartingUnit == "Kelvin" && _ConvertingUnit == "Celcius") {
      result = (userInput - 273.15);
    } else if (_StartingUnit == "Kelvin" && _ConvertingUnit == "Fahrenheit") {
      result = (userInput - 273.15) * 1.8 + 32;
    } else {
      result = (userInput * 1);
    }

    var snackBar = SnackBar(
      duration: const Duration(milliseconds: 5000),
      content: Text("$_StartingUnit to $_ConvertingUnit Conversion is $result"),
      backgroundColor: Colors.purple,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
