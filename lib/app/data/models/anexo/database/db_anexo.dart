import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';

@Entity()
class DbAnexo{
  int id;
  String name;
  String path;
  String type;
  int size;
  String geolocation;
  @Property(type: PropertyType.date)
  DateTime createdAt;

  DbAnexo({
    this.id = 0,
    required this.name,
    required this.path,
    required this.type,
    required this.size,
    required this.geolocation,
    required this.createdAt,
  });

  Anexo toEntity(){
    return Anexo(
      id: id,
      name: name,
      path: path,
      type: type,
      size: size,
      geolocation: geolocation,
      createdAt: createdAt,
    );
  }

  factory DbAnexo.fromEntity(Anexo anexo){
    return DbAnexo(
      id: anexo.id ?? 0,
      name: anexo.name,
      path: anexo.path,
      type: anexo.type,
      size: anexo.size,
      geolocation: anexo.geolocation,
      createdAt: anexo.createdAt,
    );
  }

}