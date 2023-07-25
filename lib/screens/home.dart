import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/models/lap_model.dart';
import 'package:flutter_stopwatch/widgets/bottom_buttons.dart';
import 'package:flutter_stopwatch/widgets/list_view_laps.dart';
import 'package:flutter_stopwatch/widgets/stopwatch_digitos.dart';
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

  void stopWatch() {
    timer!.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void startWatch() {
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

  void startPause() {
    setState(() {
      if (!isRunning) {
        startWatch();
      } else {
        stopWatch();
      }
    });
  }

  void reset() {
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

  void lap() {
    setState(() {
      listlaps.add(LapModel(
          numVolta: "${listlaps.length + 1}",
          digitoHoras: digitoHorasAtual,
          digitoMinutos: digitoMinutosAtual,
          digitoSegundos: digitoSegundosAtual,
          digitoMiliSegundos: digitoMiliSegundosAtual));
    });
  }

  void deleteItem(int index) {
    setState(() {
      listlaps.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 38, 122, 72),
        title: const Text("Cronômetro by João V."),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img_background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StopWatchDigitosWidget(
                  digitoHorasAtual: digitoHorasAtual,
                  digitoMinutosAtual: digitoMinutosAtual,
                  digitoSegundosAtual: digitoSegundosAtual,
                  digitoMiliSegundosAtual: digitoMiliSegundosAtual),
              ListViewLaps(deleteItem: deleteItem),
              BottomButtonsWidget(
                  isRunning: isRunning,
                  reset: reset,
                  startPause: startPause,
                  lap: lap),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
