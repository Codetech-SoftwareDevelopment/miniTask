// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FirstProject());
  }
}

class FirstProject extends StatefulWidget {
  const FirstProject({super.key});

  @override
  State<FirstProject> createState() => _FirstProjectState();
}

class _FirstProjectState extends State<FirstProject> {
  int index = 0;
  List hadith = [
    {
      "line1": "عن أبي هريرة رضي الله عنه قال: قال رسول الله ﷺ",

      "line2": "المسلم أخو المسلم؛ لا يظلمه، ولا يَحقره، ولا يخذله",
    },
    {
      "line1": "عَنْ عَبْدِ اللَّهِ بْنِ عَمْرٍو رَضِيَ اللَّهُ عَنْهُمَا",
      "line2":
          "أنَّ رَجُلًا سَأَلَ النَّبِيَّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ: أَيُّ الإِسْلاَمِ خَيْرٌ؟ قَالَ: «تُطْعِمُ الطَّعَامَ، وَتَقْرَأُ السَّلاَمَ عَلَى مَنْ عَرَفْتَ وَمَنْ لَمْ تَعْرِفْ»",
    },
    {
      "line1": " عن أبي هريرة رضي الله عنه قال: قال رسول الله ﷺ",
      "line2": "الكلمة الطيبة صدقة",
    },
  ];

  void changeIndex(String direction) {
    if (direction == "right") {
      setState(() {
        if (index == hadith.length - 1) {
          index = 0;
        } else {
          index++;
        }
      });
    } else if (direction == "left") {
      setState(() {
        if (index == 0) {
          index = hadith.length - 1;
        } else {
          index--;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(hadith[index]["line1"], style: TextStyle(fontSize: 11)),
            SizedBox(height: 25),
            Text(hadith[index]["line2"], style: TextStyle(fontSize: 16)),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    changeIndex("left");
                  },
                  child: Icon(Icons.arrow_left, size: 50),
                ),
                SizedBox(width: 40),
                FloatingActionButton(
                  onPressed: () {
                    changeIndex("right");
                  },
                  child: Icon(Icons.arrow_right, size: 50),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
