import 'package:flutter/material.dart';

class ProgramSummary extends StatefulWidget {
  final String? title;

  const ProgramSummary({super.key, this.title});

  @override
  State<ProgramSummary> createState() => _ProgramSummaryState();
}

class _ProgramSummaryState extends State<ProgramSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title.toString(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(
                  "assets/bgptrr.png",
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
