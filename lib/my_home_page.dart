import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  var bgColor = Colors.green.shade400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: SizedBox(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Weight Input
                    TextField(
                      controller: wtController,
                      decoration: const InputDecoration(
                        label: Text('Enter your weight in (Kgs)'),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(
                      height: 11,
                    ),

                    //Feet Input
                    TextField(
                      controller: ftController,
                      decoration: const InputDecoration(
                        label: Text('Enter your Height in (Ft)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(
                      height: 11,
                    ),

                    //Inch Input
                    TextField(
                      controller: inController,
                      decoration: const InputDecoration(
                        label: Text('Enter your Height in (Inchs)'),
                        prefixIcon: Icon(Icons.height_rounded),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    //Button
                    SizedBox(
                      height: 80,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: calculateBMI,
                        child: const Text(
                          'Calculate',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    //result
                    Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bgColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Result',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Text(
                            result,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    var wt = wtController.text.toString();
    var ft = ftController.text.toString();
    var inch = inController.text.toString();

    if (wt != '' && ft != '' && inch != '') {
      var iWt = double.parse(wt);
      var iFt = int.parse(ft);
      var iInch = int.parse(inch);

      var tInch = (iFt * 12) + iInch;
      var tCm = tInch * 2.54;
      var tM = tCm / 100;

      var bmi = iWt / (tM * tM);

      if (bmi > 25) {
        bgColor = Colors.red.shade400;
        setState(() {
          result = 'Your BMI is ${bmi.toStringAsFixed(2)} - Overweight!';
        });
      } else if (bmi < 18.5) {
        bgColor = Colors.orange.shade400;
        setState(() {
          result = 'Your BMI is ${bmi.toStringAsFixed(2)} - Underweight!';
        });
      } else {
        bgColor = Colors.green.shade400;
        setState(() {
          result = 'Your BMI is ${bmi.toStringAsFixed(2)} - Normal range!';
        });
      }
    } else {
      setState(() {
        result = 'Please fill up all the details!';
      });
    }
  }
}
