import 'package:intl/intl.dart';

extension DoubleExtension on double {
  static final _cache = <int, NumberFormat>{};

  String format([int decimalPlaces = 2]) {
    if(decimalPlaces == 0) return toStringAsFixed(0);
    final formatter = _cache.putIfAbsent(
      decimalPlaces,
          () => NumberFormat('#,##0.${'0' * decimalPlaces}', 'pt_BR'),
    );
    return formatter.format(this);
  }
}
