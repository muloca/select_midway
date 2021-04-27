import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class SelectCard extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SelectCard> {
  // Generating a long list to fill the ListView
  final List<Map> data = List.generate(
      1, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160,
        height: 96,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: data[index]['isSelected'] == true
                    ? Colors.grey[100]
                    : Colors.white,
                child: Container(
                  width: 160,
                  height: 92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: data[index]['isSelected'] == true
                              ? Colors.teal
                              : Colors.grey[200],
                          width: 1)),
                  child: ListTile(
                    trailing: Icon(
                      Icons.check_circle,
                      textDirection: TextDirection.rtl,
                      color: data[index]['isSelected'] == true
                          ? Colors.teal
                          : Colors.transparent,
                    ),
                    onTap: () {
                      setState(() {
                        data[index]['isSelected'] = !data[index]['isSelected'];
                      });
                    },
                    title: Center(
                      child: Icon(
                        Icons.ac_unit_sharp,
                        size: 60,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
