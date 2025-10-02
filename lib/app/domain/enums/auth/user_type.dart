
enum UserType{
  sism(description: 'Usuário SISM', code: 1),
  eletricista(description: 'Eletricista', code: 2);

  const UserType({
    required this.description,
    required this.code
  });

  final String description;
  final int code;

  static UserType fromCode(int code){
    return UserType.values.firstWhere((element) => element.code == code);
  }

  static List<int> get codes => UserType.values.map((e) => e.code).toList();

}