import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(50),
          child: BreadCrumb(
            length: 4,
            color: Colors.green,
            showVerically: false,
            elementSelected: [
              true,
              true,
              false,
              false,
            ],
            showTickForSelectedElements: true,
          ),
        ),
      ),
    );
  }
}

class BreadCrumb extends StatelessWidget {
  const BreadCrumb(
      {super.key,
      required this.length,
      required this.color,
      // required this.isSelected,
      required this.elementSelected,
      required this.showVerically,
      required this.showTickForSelectedElements});
  final int length;
  final Color color;
  final List<bool> elementSelected;
  final bool showVerically;
  final bool showTickForSelectedElements;
  @override
  Widget build(BuildContext context) {
    return showVerically
        ? Column(
            children: [
              if (length == elementSelected.length)
                for (int i = 0; i < length; i++)
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: elementSelected[i] ? color : Colors.white,
                            border: Border.all(color: color),
                            shape: BoxShape.circle),
                        child: elementSelected[i] && showTickForSelectedElements
                            ? const Icon(
                                Icons.check,
                                size: 25,
                              )
                            : Text(
                                (i + 1).toString(),
                                style: GoogleFonts.dmSans(
                                    color: elementSelected[i]
                                        ? Colors.white
                                        : color,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                      if (!(i == length - 1))
                        Container(
                          height: 70,
                          width: 2,
                          decoration: BoxDecoration(
                            border: Border.all(color: color, width: 0.5),
                            color: elementSelected[i] ? color : Colors.white,
                          ),
                        )
                    ],
                  )
            ],
          )
        : Row(
            children: [
              if (length == elementSelected.length)
                for (int i = 0; i < length; i++)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: elementSelected[i] ? color : Colors.white,
                            border: Border.all(color: color),
                            shape: BoxShape.circle),
                        child: elementSelected[i] && showTickForSelectedElements
                            ? const Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.white,
                              )
                            : Text(
                                (i + 1).toString(),
                                style: GoogleFonts.dmSans(
                                    color: elementSelected[i]
                                        ? Colors.white
                                        : color,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                      if (!(i == length - 1))
                        Container(
                          height: 2,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: color, width: 0.5),
                            color: elementSelected[i] ? color : Colors.white,
                          ),
                        )
                    ],
                  ),
            ],
          );
  }
}
