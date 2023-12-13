import 'package:flutter/material.dart';

class HalwaPage extends StatefulWidget {
  final Map<String, dynamic> halwaData;

  HalwaPage({required this.halwaData});

  @override
  _HalwaPageState createState() => _HalwaPageState();
}

class _HalwaPageState extends State<HalwaPage> {
  int selectedTabIndex = 0; // 0 for Ingredients, 1 for Steps

  String trimTitle(String fullName) {
    List<String> words = fullName.split(' ');
    return words.take(4).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          trimTitle(widget.halwaData['name']),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 0, // No elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.black),
                      SizedBox(width: 8.0),
                      Text(
                        '${widget.halwaData['minutes']} minutes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  _buildTabs(),
                  SizedBox(height: 12.0),
                  selectedTabIndex == 0 ? _buildIngredients() : _buildSteps(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _buildTab('Ingredients'),
        SizedBox(width: 16.0),
        _buildTab('Steps'),
      ],
    );
  }

  Widget _buildTab(String label) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black),
          color: selectedTabIndex == (label == 'Ingredients' ? 0 : 1)
              ? Colors.orange
              : Colors.white,
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              selectedTabIndex = label == 'Ingredients' ? 0 : 1;
            });
          },
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: selectedTabIndex == (label == 'Ingredients' ? 0 : 1)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredients() {
    List<String>? ingredientsList = widget.halwaData['ingredients'];
    // ?.replaceAll(RegExp(r"[\[\]']"), '')
    // .split(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8.0),
        if (ingredientsList != null)
          ListView.builder(
            shrinkWrap: true,
            itemCount: ingredientsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ingredientsList[index]),
              );
            },
          ),
      ],
    );
  }

  Widget _buildSteps() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Steps:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8.0),
        if (widget.halwaData['steps'] != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                widget.halwaData['steps'].toString().split(',').map((step) {
              // Split steps by commas and display each on a new line
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ${step.replaceAll(RegExp(r"[,\[\]']"), '').trim()}'),
                  SizedBox(height: 8.0), // Adjust the spacing as needed
                ],
              );
            }).toList(),
          ),
      ],
    );
  }
}