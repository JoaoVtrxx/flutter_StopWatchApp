import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/models/lap_model.dart';

class ListItemWidget extends StatelessWidget {
  final int index;
  final LapModel lap;
  final Function callBackFunction;
  const ListItemWidget(
      {super.key,
      required this.index,
      required this.callBackFunction,
      required this.lap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.8),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          "${lap.digitoHoras} : ${lap.digitoMinutos} : ${lap.digitoSegundos} : ${lap.digitoMiliSegundos}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.justify,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Color(0xFFf84444),
          ),
          onPressed: () {
            callBackFunction(index);
          },
        ),
        leading: Text(
          "Volta ${index + 1}",
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
