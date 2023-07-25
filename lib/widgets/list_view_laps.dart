import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/widgets/list_item.dart';
import '../lists/listlaps.dart';
import '../models/lap_model.dart';

class ListViewLaps extends StatelessWidget {
  final Function deleteItem;
  const ListViewLaps({super.key, required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: listlaps.length,
        itemBuilder: (context, index) {
          LapModel lap = listlaps[index];
          return ListItemWidget(
              index: index, callBackFunction: deleteItem, lap: lap);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
