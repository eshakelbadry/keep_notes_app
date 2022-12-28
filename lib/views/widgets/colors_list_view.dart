import 'package:flutter/material.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color.fromARGB(0, 59, 59, 184),
    Color.fromARGB(0, 52, 186, 95),
    Color.fromARGB(0, 189, 128, 29),
    Color.fromARGB(0, 169, 36, 36),
    Color.fromARGB(0, 141, 40, 146),
    Color.fromARGB(0, 33, 162, 153),
  ];
  _ColorsListViewState();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: (() {
                currentIndex = index;
                setState(() {});
              }),
              child: ColorsItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
