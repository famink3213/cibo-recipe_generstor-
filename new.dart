// new.dart
import 'package:flutter/material.dart';
import 'answer.dart';

class NewPage extends StatelessWidget {
  final List recommendationData;

  NewPage({required this.recommendationData});

  String trimRecipeName(String name) {
    List<String> words = name.split(' ');
    int endIndex = words.length > 3 ? 3 : words.length;
    return words.sublist(0, endIndex).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 253, 253, 253),
                const Color.fromARGB(255, 243, 239, 239)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Top Results',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "head",
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 244, 243, 242), Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.separated(
          itemCount: recommendationData.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.0);
          },
          itemBuilder: (context, index) {
            final dish = recommendationData[index];
            final trimmedName = dish['name'];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  trimmedName?.isNotEmpty ?? false
                      ? trimmedName![0].toUpperCase() +
                          trimmedName!.substring(1)
                      : '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      dish['description'] ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AnswerPage(dishDetails: dish),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnswerPage(dishDetails: dish),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
