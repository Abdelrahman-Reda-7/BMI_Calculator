import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  bool isFemale = false;

  double height = 120;
  int weight = 75;
  int age = 18;

  double bmi = 0;
  String val = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),

        child: Column(
          children: [
            const SizedBox(height: 8),

            // Gender
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    isMale = !isMale;
                    isFemale = false;
                    setState(() {});
                  },
                  child: Container(
                    width: 165,
                    height: 145,
                    decoration: BoxDecoration(
                      color: isMale ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isMale
                            ? Colors.blue
                            : Colors.grey.shade300,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 55,
                          color: isMale ? Colors.white : Colors.blue,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: isMale ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    isFemale = !isFemale;
                    isMale = false;
                    setState(() {});
                  },
                  child: Container(
                    width: 165,
                    height: 145,
                    decoration: BoxDecoration(
                      color: isFemale ? Colors.pink : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isFemale
                            ? Colors.pink
                            : Colors.grey.shade300,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 55,
                          color: isFemale ? Colors.white : Colors.pink,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: isFemale ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Height
            Container(
              width: double.infinity,
              height: 145,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),

                  Text(
                    "${height.toInt()} cm",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Slider(
                    value: height,
                    max: 250,
                    min: 100,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      height = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Weight + Age
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCounterCard(
                  title: "WEIGHT",
                  value: weight,
                  onMinus: () {
                    if (weight > 1) {
                      weight--;
                      setState(() {});
                    }
                  },
                  onPlus: () {
                    weight++;
                    setState(() {});
                  },
                ),

                buildCounterCard(
                  title: "AGE",
                  value: age,
                  onMinus: () {
                    if (age > 1) {
                      age--;
                      setState(() {});
                    }
                  },
                  onPlus: () {
                    age++;
                    setState(() {});
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Result
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "YOUR RESULT",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),

                    Text(
                      "BMI : ${bmi.toStringAsFixed(1)}",
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      val.isEmpty ? "Calculate your BMI" : val,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: bmi >= 18.5 && bmi < 25
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Calculate
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  bmi = weight /
                      ((height / 100) * (height / 100));

                  setState(() {
                    if (bmi >= 30) {
                      val = "Obese";
                    } else if (bmi >= 25) {
                      val = "Overweight";
                    } else if (bmi >= 18.5) {
                      val = "Normal";
                    } else {
                      val = "Underweight";
                    }
                  });
                },
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget buildCounterCard({
    required String title,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      width: 165,
      height: 135,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          Text(
            "$value",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onMinus,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(40, 40),
                ),
                icon: const Icon(Icons.remove),
              ),

              const SizedBox(width: 12),

              IconButton(
                onPressed: onPlus,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(40, 40),
                ),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}