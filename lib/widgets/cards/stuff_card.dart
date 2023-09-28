import 'package:stuffbox/data/data_stuff_list.dart';
import 'package:flutter/material.dart';

class StuffCard extends StatelessWidget {
  const StuffCard({super.key, required this.stuff, required this.removeStuff});

  final Stuff stuff;
  final Function removeStuff;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: stuff.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stuff.name,
              maxLines: 2, // Set the maximum number of lines to display
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: stuff.fgColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rp. ${stuff.price.toString()}",
                  style: TextStyle(fontSize: 12, color: stuff.fgColor),
                ),
                InkWell(
                  onTap: () {
                    removeStuff(stuff);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(
                    Icons.delete,
                    size: 20,
                    color: stuff.fgColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
