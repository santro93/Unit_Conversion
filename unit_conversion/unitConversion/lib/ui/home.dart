import 'package:flutter/material.dart';

import '../model/unit_List.dart';

////////////////////////   Santosh   /////////////////////////////////////

class UnitConversion extends StatefulWidget {
  @override
  State<UnitConversion> createState() => _UnitConversionState();
}

class _UnitConversionState extends State<UnitConversion> {
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
                child: Center(
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
                      _unitConversion();
                    },
                  ),
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
                items: length.map<DropdownMenuItem<String>>((length) {
                  return DropdownMenuItem<String>(
                    value: length,
                    child: Text(length),
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
                items: length.map<DropdownMenuItem<String>>((length) {
                  return DropdownMenuItem<String>(
                    value: length,
                    child: Text(length),
                  );
                }).toList(),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // RaisedButton(
              //   onPressed: _unitConversion,
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

  void _unitConversion() {
    var userInput = double.parse(inputController.text);
    double? result;
////////////////////////  Meter    ///////////////////////////////

    if (_StartingUnit == "Meter" && _ConvertingUnit == "Centimeter") {
      result = (userInput * 100);
    } else if (_StartingUnit == "Meter" && _ConvertingUnit == "Meter") {
      result = (userInput * 1);
    } else if (_StartingUnit == "Meter" && _ConvertingUnit == "Kilometer") {
      result = (userInput / 1000);
    } else if (_StartingUnit == "Meter" && _ConvertingUnit == "Inch") {
      result = (userInput * 39.37);
    }

//////////////////// Centimeter  ///////////////////////////////////
    else if (_StartingUnit == "Centimeter" && _ConvertingUnit == "Meter") {
      result = (userInput / 100);
    } else if (_StartingUnit == "Centimeter" &&
        _ConvertingUnit == "Centimeter") {
      result = (userInput * 1);
    } else if (_StartingUnit == "Centimeter" &&
        _ConvertingUnit == "Kilometer") {
      result = (userInput / 100000);
    } else if (_StartingUnit == "Centimeter" && _ConvertingUnit == "Inch") {
      result = (userInput / 2.54);
    }

    //////////////////// Kilometer  //////////////////////////////////////

    else if (_StartingUnit == "Kilometer" && _ConvertingUnit == "Meter") {
      result = (userInput * 1000);
    } else if (_StartingUnit == "Kilometer" &&
        _ConvertingUnit == "Centimeter") {
      result = (userInput * 100000);
    } else if (_StartingUnit == "Kilometer" && _ConvertingUnit == "Kilometer") {
      result = (userInput * 1);
    } else if (_StartingUnit == "Kilometer" && _ConvertingUnit == "Inch") {
      result = (userInput * 39370);
    }

    //////////////////////////// Inch  /////////////////////////////////

    else if (_StartingUnit == "Inch" && _ConvertingUnit == "Meter") {
      result = (userInput / 39.37);
    } else if (_StartingUnit == "Inch" && _ConvertingUnit == "Centimeter") {
      result = (userInput * 2.54);
    } else if (_StartingUnit == "Inch" && _ConvertingUnit == "Kilometer") {
      result = (userInput / 39370);
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

////////////////////////   Chandan   /////////////////////////////////////
// class checkConverter extends StatelessWidget {
//   checkConverter({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Converter(),
//     );
//   }
// }

// class Converter extends StatefulWidget {
//   const Converter({Key? key}) : super(key: key);

//   @override
//   State<Converter> createState() => _ConverterState();
// }

// class _ConverterState extends State<Converter> {
//   @override
//   late double userInput;
//   late String _startMeasures;
//   late String _convertMeasures;

//   void initState() {
//     userInput = 0;
//     _startMeasures = "Meters";
//     _convertMeasures = "KiloMeters";
//     super.initState();
//   }

//   final List<String> measures = [
//     "Meters",
//     "KiloMeters",
//     "Grams",
//     "Kilograms",
//     "feet",
//     "Miles",
//     "pounds",
//     "ounces"
//   ];

//   final Map<String, int> measureMap = {
//     "Meters": 0,
//     "KiloMeters": 1,
//     "Grams": 2,
//     "Kilograms": 3,
//     "feet": 4,
//     "Miles": 5,
//     "pounds": 6,
//     "ounces": 7
//   };

//   dynamic formulas = {
//     "0": [1, 0.001, 0, 0, 3.280, 0.0006213, 0],
//     "1": [1000, 1, 0, 0, 3280.84, 0.6213, 0, 0],
//     "2": [0, 0, 1, 0.0001, 0, 0, 0.00220, 0.03],
//     "3": [0, 0, 1000, 1, 0, 0, 2.2046, 35.274],
//     "4": [0.0348, 0.00030, 0, 0, 1, 0.000189],
//     "5": [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
//     "6": [0, 0, 453.529, 0.4535, 0, 0, 1, 16],
//     "7": [0, 0, 28.3495, 0.02834, 3.28084, 0, 0.1]
//   };

//   void convert(double value, String from, String to) {
//     int? nFrom = measureMap[from];
//     int? nTo = measureMap[to];

//     var multi = formulas[nFrom.toString()][nTo];
//     var res = value * multi;
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blueAccent,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30),
//           child: Center(
//             child: Column(
//               children: [
//                 Text(
//                   "Measures",
//                   style: TextStyle(
//                       fontSize: 50,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "Converter!",
//                   style: TextStyle(
//                       fontSize: 50,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                   child: TextField(
//                     onChanged: (text) {
//                       var input = double.tryParse(text);
//                       if (input != null)
//                         setState(() {
//                           userInput = input;
//                         });
//                     },
//                     style: TextStyle(fontSize: 22, color: Colors.black),
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.grey[300],
//                         hintText: "Enter Your Values",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         )),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "From",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton(
//                         value: _startMeasures,
//                         isExpanded: true,
//                         dropdownColor: Colors.black,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20,
//                           color: Colors.amber,
//                         ),
//                         hint: Text(
//                           "Choose a unit",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         items: measures.map((String value) {
//                           return DropdownMenuItem(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                         onChanged: (String? value) {
//                           setState(() {
//                             _startMeasures = value!.toString();
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "To",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton(
//                         value: _convertMeasures,
//                         isExpanded: true,
//                         dropdownColor: Colors.black,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20,
//                           color: Colors.amber,
//                         ),
//                         hint: Text(
//                           "Choose a unit",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         items: measures.map((String value) {
//                           return DropdownMenuItem(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             _convertMeasures = value.toString();
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 FlatButton(
//                   onPressed: () {},
//                   child: Container(
//                     alignment: AlignmentDirectional.center,
//                     width: 200,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       "Convert",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 40,
//                         color: Colors.amber,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Text(
//                   "Result",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class Converter extends StateFulWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30),
//           child: Column(
//             children: [
//               Text(
//                 "Measures",
//                 style: TextStyle(
//                     fontSize: 50,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700),
//               ),
//               Text(
//                 "Converter!",
//                 style: TextStyle(
//                     fontSize: 50,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//                 child: TextField(
//                   onChanged: (text) {
//                     var input = double.parse(text);
//                   },
//                   style: TextStyle(fontSize: 22, color: Colors.red),
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey[300],
//                       hintText: "Enter Your Value",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       )),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//end here
