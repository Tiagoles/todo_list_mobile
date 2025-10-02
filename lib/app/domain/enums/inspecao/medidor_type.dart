class MedidorType{
  static final MedidorType kwh = MedidorType._(
    code: 'kwh',
    description: 'kWh',
  );
  static final MedidorType kvarh = MedidorType._(
    code: 'kvarh',
    description: 'kVArh',
  );
  static final MedidorType kw = MedidorType._(
    code: 'kw',
    description: 'kW',
  );
  static final MedidorType especial = MedidorType._(
    code: 'especial',
    description: 'Especial',
  );

  static final List<MedidorType> values = [
    kwh,
    kvarh,
    kw,
    especial,
  ];

  final String code;
  final String description;

  MedidorType._({
    required this.code,
    required this.description,
  });

}