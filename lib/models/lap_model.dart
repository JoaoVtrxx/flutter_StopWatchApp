class LapModel {
  String numVolta;
  String digitoHoras;
  String digitoMinutos;
  String digitoSegundos;
  String digitoMiliSegundos;

  LapModel({
    required this.numVolta,
    required this.digitoHoras,
    required this.digitoMinutos,
    required this.digitoSegundos,
    required this.digitoMiliSegundos,
  });

  LapModel.fromMap(Map<String, dynamic> map)
      : numVolta = map["numVolta"],
        digitoHoras = map["digitoHoras"],
        digitoMinutos = map["digitoMinutos"],
        digitoSegundos = map["digitoSegundos"],
        digitoMiliSegundos = map["digitoMiliSegundos"];

  Map<String, dynamic> toMap() {
    return {
      "numVolta": numVolta,
      "digitoHoras": digitoHoras,
      "digitoMinutos": digitoMinutos,
      "digitoSegundos": digitoSegundos,
      "digitoMiliSegundos": digitoMiliSegundos,
    };
  }
}
