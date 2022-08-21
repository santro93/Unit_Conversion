import 'package:bizzcard/model/unit_List.dart';
import 'package:flutter/material.dart';

class Pressure extends StatefulWidget {
  @override
  State<Pressure> createState() => _PressureConversion();
}

class _PressureConversion extends State<Pressure> {
  TextEditingController inputController = TextEditingController();
  String? _StartingUnit;
  String? _ConvertingUnit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.lightBlue,
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
                    _pressureConversion();
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
                items: pressure.map<DropdownMenuItem<String>>((pressure) {
                  return DropdownMenuItem<String>(
                    value: pressure,
                    child: Text(pressure),
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
                items: pressure.map<DropdownMenuItem<String>>((pressure) {
                  return DropdownMenuItem<String>(
                    value: pressure,
                    child: Text(pressure),
                  );
                }).toList(),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // RaisedButton(
              //   onPressed: _pressureConversion,
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

  void _pressureConversion() {
    var userInput = double.parse(inputController.text);
    double? result;

    ////////////////////////  Bar    ///////////////////////////////
    if (_StartingUnit == "Bar" && _ConvertingUnit == "Pascal") {
      result = (userInput * 100000);
    } else if (_StartingUnit == "Bar" && _ConvertingUnit == "Bar") {
      result = (userInput * 1);
    } else if (_StartingUnit == "Bar" && _ConvertingUnit == "Torr") {
      result = (userInput * 750.1);
    }

    //////////////////// Pascal  ///////////////////////////////////
    else if (_StartingUnit == "Pascal" && _ConvertingUnit == "Bar") {
      result = (userInput / 100000);
    } else if (_StartingUnit == "Pascal" && _ConvertingUnit == "Pascal") {
      result = (userInput * 1);
    } else if (_StartingUnit == "Pascal" && _ConvertingUnit == "Torr") {
      result = (userInput / 133.3);
    }

    //////////////////// Torr  ///////////////////////////////////
    else if (_StartingUnit == "Torr" && _ConvertingUnit == "Bar") {
      result = (userInput / 750.1);
    } else if (_StartingUnit == "Torr" && _ConvertingUnit == "Pascal") {
      result = (userInput / 133.3);
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
