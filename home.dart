import 'package:flutter/material.dart';
import 'package:recipe_generator/selector.dart';
import 'Group23.dart';
import 'Group24.dart';
import 'Group25.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 1),
              child: Row(
                children: [
                  PopupMenuButton<String>(
                    icon: Icon(Icons.menu, size: 30.0),
                    onSelected: (value) {
                      handleMenuClick(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return {'App Version', 'About'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(
                            choice,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showImageDialog(); // Show the image dialog on tap
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/icons/logo.png'),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: Text(
                            'Welcome user,',
                            style: TextStyle(
                              fontFamily: 'reg',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                          child: Text(
                            'Let us Cook',
                            style: TextStyle(
                              fontFamily: 'head',
                              fontSize: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: (MediaQuery.of(context).size.width),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        IngredientSelectionPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(233, 233, 233, 1),
                                onPrimary: Color.fromRGBO(88, 88, 88, 1),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 20),
                                    child: Icon(Icons.search),
                                  ),
                                  Center(
                                    child: Text(
                                      'Select your ingredients',
                                      style: TextStyle(
                                        fontFamily: 'reg',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Positioned(
                    //   top: 20,
                    //   right: 10,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // Add your action for the circular button here
                    //     },
                    //     child: CircleAvatar(
                    //       radius: 20,
                    //       backgroundImage: AssetImage('assets/icons/logo.png'),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: SizedBox(
                    height: (MediaQuery.of(context).size.height),
                    width: (MediaQuery.of(context).size.width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                          child: Text(
                            'Popular Dishes',
                            style: TextStyle(
                              fontFamily: 'bold',
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Group23(
                            "Butter chicken",
                            "Butter Chicken also known as Chicken Makhani is a classic Indian dish that's made by simmering marinated & grilled chicken ",
                            "100 mins",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Group24(
                              "Burger",
                              "A burger is a handheld culinary delight featuring a seasoned ground meat patty in a bun, customizable with various toppings and condiments.",
                              "30 mins"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Group25(
                              "Carrot halwa",
                              "Popular Indian sweet dish made from carrot",
                              "180 mins"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleMenuClick(String value) {
    switch (value) {
      case 'App Version':
        showAppVersionDialog();
        break;
      case 'About':
        showAboutDialog();
        break;
    }
  }

  void showAppVersionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('App Version'),
          content: Text('Version 1.02'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showAboutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Recipe Generator App: Cibo'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Developers:'),
              Text('Pratham'),
              Text('Vikas'),
              Text('Abhishek'),
              Text('Kartikeya'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/icons/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
