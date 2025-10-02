class InspecaoFormSteps{

  static final InspecaoFormSteps identificacao = InspecaoFormSteps._(
      step: 0,
      description: 'Identificação'
  );
  static final InspecaoFormSteps lacresRetirados = InspecaoFormSteps._(
      step: 1,
      description: 'Lacres Retirados'
  );
  static final InspecaoFormSteps medicao = InspecaoFormSteps._(
      step: 2,
      description: 'Medição'
  );
  static final InspecaoFormSteps complementar = InspecaoFormSteps._(
      step: 3,
      description: 'Complementar'
  );
  static final InspecaoFormSteps itensInspecionados = InspecaoFormSteps._(
      step: 4,
      description: 'Itens Inspecionados'
  );
  static final InspecaoFormSteps irregularidades = InspecaoFormSteps._(
      step: 5,
      description: 'Irregularidades'
  );
  static final InspecaoFormSteps acoesTomadas = InspecaoFormSteps._(
      step: 6,
      description: 'Ações Tomadas'
  );
  static final InspecaoFormSteps lacresAdicionados = InspecaoFormSteps._(
      step: 7,
      description: 'Lacres Adicionados'
  );
  static final InspecaoFormSteps observacoes = InspecaoFormSteps._(
      step: 8,
      description: 'Observações'
  );

  static List<InspecaoFormSteps> get values => [
    identificacao,
    lacresRetirados,
    medicao,
    complementar,
    itensInspecionados,
    irregularidades,
    acoesTomadas,
    lacresAdicionados,
    observacoes
  ];

  final int step;
  final String description;

  InspecaoFormSteps._({
    required this.step,
    required this.description
  });

}