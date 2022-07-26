import 'package:flutter/material.dart';

class result extends StatelessWidget {
  bool isMale;
  double height;
  int weight;
  int age;
  double res;
  result ({Key? key,
  required this.weight,
  required this.age,
  required this.height,
  required this.isMale,
  required this.res,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
          ),
        ),
        title: const Text(
            'BMI Result',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GENDER: ${isMale? 'Male':'Female'}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'RESULT: ${res.round()}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'AGE: $age',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
