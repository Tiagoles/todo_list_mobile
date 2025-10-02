import 'package:smaservicos/app/utils/exceptions.dart';

class AppValidationException extends AppException {
  AppValidationException(super.message, [super.stackTrace]);
}