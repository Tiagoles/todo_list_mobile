import 'package:smaservicos/app/utils/exceptions.dart';

class ConfigValidationException extends AppException{
  ConfigValidationException(super.message, [super.stackTrace]);
}