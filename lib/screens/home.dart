import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/models/lap_model.dart';
import '../lists/listlaps.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int horas = 0, segundos = 0, minutos = 0, miliSegundos = 0;
  String digitoHorasAtual = "00";
  String digitoMinutosAtual = "00";
  String digitoSegundosAtual = "00";
  String digitoMiliSegundosAtual = "00";
  bool isRunning = false;
  Timer? timer;

  void _stopWatch() {
    timer!.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void _startWatch() {
    isRunning = true;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      int horasLocal = horas;
      int minutosLocal = minutos;
      int segundosLocal = segundos;
      int miliSegundosLocal = miliSegundos + 1;

      if (segundosLocal > 59 &&
          minutosLocal > 59 &&
          horasLocal > 59 &&
          miliSegundosLocal > 99) {
        horasLocal = 0;
        minutosLocal = 0;
        segundosLocal = 0;
        miliSegundosLocal = 0;
      } else if (segundosLocal > 59 &&
          minutosLocal > 59 &&
          miliSegundosLocal > 99) {
        horasLocal++;
        minutosLocal = 0;
        segundosLocal = 0;
        miliSegundosLocal = 0;
      } else if (segundosLocal > 59 && miliSegundosLocal > 99) {
        minutosLocal++;
        segundosLocal = 0;
        miliSegundosLocal = 0;
      } else if (miliSegundosLocal > 99) {
        segundosLocal++;
        miliSegundosLocal = 0;
      }

      setState(
        () {
          horas = horasLocal;
          minutos = minutosLocal;
          segundos = segundosLocal;
          miliSegundos = miliSegundosLocal;

          digitoHorasAtual = (horas >= 10) ? "$horas" : "0$horas";
          digitoMinutosAtual = (minutos >= 10) ? "$minutos" : "0$minutos";
          digitoSegundosAtual = (segundos >= 10) ? "$segundos" : "0$segundos";
          digitoMiliSegundosAtual =
              (miliSegundos >= 10) ? "$miliSegundos" : "0$miliSegundos";
        },
      );
    });
  }

  void _startPause() {
    setState(() {
      if (!isRunning) {
        _startWatch();
      } else {
        _stopWatch();
      }
    });
  }

  void _reset() {
    setState(() {
      horas = 0;
      minutos = 0;
      segundos = 0;
      miliSegundos = 0;

      digitoHorasAtual = "00";
      digitoMinutosAtual = "00";
      digitoSegundosAtual = "00";
      digitoMiliSegundosAtual = "00";
    });
  }

  void _lap() {
    setState(() {
      listlaps.add(LapModel(
          numVolta: "${listlaps.length + 1}",
          digitoHoras: digitoHorasAtual,
          digitoMinutos: digitoMinutosAtual,
          digitoSegundos: digitoSegundosAtual,
          digitoMiliSegundos: digitoMiliSegundosAtual));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf84444),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf84444),
        title: const Text("Cronômetro by João V."),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "$digitoHorasAtual : $digitoMinutosAtual : $digitoSegundosAtual.$digitoMiliSegundosAtual",
                style: const TextStyle(fontSize: 45, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: listlaps.length,
                itemBuilder: (context, index) {
                  LapModel lap = listlaps[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          setState(() {
                            listlaps.removeAt(index);
                          });
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
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: _reset,
                  icon: const Icon(Icons.restore),
                ),
                IconButton(
                  color: Colors.white,
                  iconSize: 80,
                  onPressed: _startPause,
                  icon: (isRunning)
                      ? const Icon(Icons.pause_circle_outlined)
                      : const Icon(Icons.play_circle_outline),
                ),
                IconButton(
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: _lap,
                  icon: const Icon(Icons.flag),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
