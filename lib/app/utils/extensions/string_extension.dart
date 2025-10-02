import 'package:more/more.dart';

extension StringExtension on String{
  String normalizeToUpperCase(){
    final normalized = normalize(form: NormalizationForm.nfd)
        .replaceAll(RegExp(r'[\u0300-\u036f]'), '');

    final noPunct = normalized.replaceAll(RegExp(r'[^\w\s]'), '');

    return noPunct.toUpperCase();
  }
}