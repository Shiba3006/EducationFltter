import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {

   final bool isMale;
   final int height;
   final int weight;
   final int age;
   final int result;

  const BmiResult({
    required this.isMale,
    required this.height,
    required this.weight,
    required this.age,
    required this.result,
  });


  @override
  Widget build(BuildContext context) {
    String WeightStatus;
    if (result < 19 ) {
      WeightStatus = 'Underweight';
    }
    else if (result >= 19 && result <  25 ) {
      WeightStatus = 'Healthy';
    }
    else if (result >= 25 && result <  30 ) {
      WeightStatus = 'Overweight';
    }
    else if (result >= 30 ) {
      WeightStatus = 'Obese';
    }
    else {
      WeightStatus = 'ولا حاجة';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
        ),
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios_rounded
          ),
          onPressed: () {
            Navigator.pop(context);
          },

        ),
      ),
      body: Center(
        child: Column(
          children:  [
            Text(
                'Gender : ${isMale? 'male' : 'female' }',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'Height : $height',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                ' Weight : $weight',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'Age : $age',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'Result : $result',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                '$WeightStatus',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );

  }
}
