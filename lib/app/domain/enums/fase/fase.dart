enum Fase{

  monofasico(desc: 'Monofásico', cod: 'M'),
  bifasico(desc: 'Bifásico', cod: 'B'),
  trifasico(desc: 'Trifásico', cod: 'T');

  const Fase({
    required this.desc,
    required this.cod,
  });

  final String desc;
  final String cod;

  static Fase fromCod(String cod) {
    return Fase.values.firstWhere((element) => element.cod == cod.toUpperCase());
  }

}