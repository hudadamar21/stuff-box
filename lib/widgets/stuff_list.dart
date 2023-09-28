import 'package:stuffbox/data/data_stuff_list.dart';
import 'package:stuffbox/widgets/cards/stuff_card.dart';
import 'package:flutter/material.dart';

class StuffList extends StatelessWidget {
  final List<Stuff> stuffList;
  final Function removeStuff;

  const StuffList({
    super.key,
    required this.stuffList,
    required this.removeStuff,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 1280
        ? 6
        : screenWidth > 860
            ? 4
            : screenWidth > 680
                ? 3
                : 2;

    return GridView.builder(
      itemCount: stuffList.length, // Number of items in the grid
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, // Number of columns in the grid
        crossAxisSpacing: 15, // Spacing between columns
        mainAxisSpacing: 15, // Spacing between rows
        childAspectRatio: 148 / 107,
      ),
      itemBuilder: (context, index) {
        // Widget for each item in the grid
        return StuffCard(
            stuff: stuffList[index],
            removeStuff: (value) {
              removeStuff(value);
            });
      },
    );
  }
}
