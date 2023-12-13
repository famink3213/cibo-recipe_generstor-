import 'package:flutter/material.dart';
import 'halwa.dart';

class Group24 extends StatelessWidget {
  final String dishName;
  final String dishDesc;
  final String dishTime;
  // final String imageUrl; // Added imageUrl parameter

  Group24(this.dishName, this.dishDesc, this.dishTime);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HalwaPage(
              halwaData: {
                'name': 'Burger',
                'ingredients': [
                  'buns',
                  'lettuce',
                  'tomato',
                  'cheese slice',
                  'patty',
                  'tandoori sauce'
                ],
                'minutes': 30,
                'steps': [
                  'Use Ground Chuck Beef (80/20) – grind your own or buy it ground, but 20% fat is ideal and keep it refrigerated until you’re ready to use it.',
                  'Don’t overwork your meat – this will make it tough and dense.',
                  'Shape the patties 1” wider than the bun since they shrink on the grill.',
                  'Make an indentation in the center to prevent it from plumping up in the center.',
                  'Don’t Season too early – Salt changes the structure of proteins and toughens burgers so don’t season your ground beef until you have formed your patties and are ready to grill.',
                  'Get a good Sear – Once on the grill, let patties brown and sear well (3-5 min) before flipping, and do not press down on the burger save that for making',
                ],
              },
              // imageUrl: imageUrl, // Pass imageUrl to HalwaPage
            ),
          ),
        );
      }, // neededed
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
                        image: AssetImage("assets/images/burger4.png"),
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
