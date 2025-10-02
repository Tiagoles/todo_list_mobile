import 'package:smaservicos/app/utils/exceptions.dart';

extension ExceptionExtension on Exception {
  String get message {
    if(this is AppException){
      return (this as AppException).message;
    }
    return toString();
  }
}