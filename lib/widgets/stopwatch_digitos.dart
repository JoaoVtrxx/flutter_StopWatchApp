import 'package:flutter/material.dart';

class StopWatchDigitosWidget extends StatelessWidget {
  final String digitoHorasAtual;
  final String digitoMinutosAtual;
  final String digitoSegundosAtual;
  final String digitoMiliSegundosAtual;

  const StopWatchDigitosWidget(
      {super.key,
      required this.digitoHorasAtual,
      required this.digitoMinutosAtual,
      required this.digitoSegundosAtual,
      required this.digitoMiliSegundosAtual});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        "$digitoHorasAtual : $digitoMinutosAtual : $digitoSegundosAtual.$digitoMiliSegundosAtual",
        style: const TextStyle(fontSize: 45, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
