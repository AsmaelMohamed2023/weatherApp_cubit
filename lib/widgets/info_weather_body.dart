import 'package:flutter/material.dart';

class InfoWeatherBody extends StatelessWidget {
  const InfoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Alaxandria",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "updated at 23:43",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/images/cloudy.png'),
                ),
                Text(
                  "17",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text("Maxtemp:24"),
                    Text("Mintemp:16"),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Ligh Rain",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
