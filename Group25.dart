import 'package:flutter/material.dart';
import 'halwa.dart';

class Group25 extends StatelessWidget {
  final String dishName;
  final String dishDesc;
  final String dishTime;
  // final String imageUrl; // Added imageUrl parameter

  Group25(this.dishName, this.dishDesc, this.dishTime);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HalwaPage(
              halwaData: {
                'name': 'Carrot Halwa',
                'minutes': 150,
                'ingredients': ['carrots', 'ghee', 'milk', 'sugar', 'khoya'],
                'steps': [
                  'To a pan heat 1 tablespoon ghee add 1 tablespoon chopped nuts. You can add more nuts if you prefer. Fry until golden. Remove to a bowl and set aside.',
                  'Wash carrots well, trim the edges and peel off the skin. Grate it using a grater, measure 2 cups and add it.',
                  'Saute for at least 3-5 mins or until it shrinks a bit and the color changes.',
                  'Add 1 and 1/2 cups full-fat milk (boiled). Keep the flame in low medium for the milk to reduce. It will nicely bubble and start reducing slowly, stir on and off. Cook for 10 mins or until milk reduces to 3/4th. Keep stirring in between to avoid sticking at the bottom. Keep scraping the sides for the milk solids, add it into the boiling mixture. Keep cooking in medium flame.',
                  'Now milk is reduced to 3/4th. At this stage add 2 tablespoon unsweetened khoya. If you add sweetened khoya adjust sugar accordingly. You can completely skip this step if you do not have khoya.',
                  'Add 1/3 cup sugar. Once you add sugar, it will again become runny, just keep cooking and stirring. Keep stirring so that it does not stick to the bottom of the pan. It will start to thicken. Halwa becomes thick but still moist. The mixture comes together with a sticky texture that’s the right consistency.',
                  'Delicious Carrot Halwa is ready',
                ],
              },
              // imageUrl: "assets/images/ch.jpg", // Pass imageUrl to HalwaPage
            ),
          ),
        );
      }, // needed
      child: Column(
        children: [
          Container(
            width: 365,
            height: 152,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 36,
                  child: Container(
                    width: 365,
                    height: 116,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.09),
                        end: Alignment(-1, 0.09),
                        colors: [Color(0xFFF09E23), Color(0xFFDD8400)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 174,
                          top: 16,
                          child: Text(
                            '$dishName',
                            style: TextStyle(
                              color: Color(0xFF3C2000),
                              fontSize: 20,
                              fontFamily: 'reg',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 174,
                          top: 79,
                          child: Text(
                            '$dishTime',
                            style: TextStyle(
                              color: Color(0xFF3C2000),
                              fontSize: 11,
                              fontFamily: 'reg',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 176,
                          top: 37,
                          child: SizedBox(
                            width: 169,
                            height: 37,
                            child: Text(
                              '$dishDesc',
                              style: TextStyle(
                                color: Color(0xAD1A1A1A),
                                fontSize: 10,
                                fontFamily: 'reg',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 0,
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ch.jpg"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
