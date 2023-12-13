import 'package:flutter/material.dart';
import 'halwa.dart';

class Group23 extends StatelessWidget {
  final String dishName;
  final String dishDesc;
  final String dishTime;

  Group23(this.dishName, this.dishDesc, this.dishTime);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HalwaPage(halwaData: {
              'name': 'Butter chicken',
              'minutes': 100,
              'ingredients': [
                'chicken',
                'ghee',
                'curd',
                'tomato',
                'onion',
                'garlic'
              ],
              'steps': [
                'In a bowl, combine the chicken pieces with yogurt, ginger-garlic paste, turmeric powder, chili powder, ground cumin, ground coriander, and salt. Marinate for at least 1 hour, or overnight for best results.',
                'Heat vegetable oil in a pan over medium heat. Add chopped onions and sauté until golden brown.',
                'Add marinated chicken to the pan and cook until browned on all sides.',
                'Add butter and tomato puree to the chicken. Mix well and let it simmer for 10-15 minutes until the chicken is fully cooked and the flavors are well combined.',
                'Sprinkle garam masala over the chicken and stir. Cook for an additional 5 minutes.',
                'Pour in heavy cream, stirring continuously. Simmer for another 5 minutes until the sauce thickens.',
                'Garnish with fresh chopped cilantro.',
                'Serve the butter chicken hot with naan or rice.'
              ]
            }),
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
                              fontFamily: 'Vinila Test',
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
                        image: AssetImage("assets/images/bc.jpg"),
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

