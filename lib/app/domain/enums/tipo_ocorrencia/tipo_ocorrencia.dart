enum TipoOcorrencia{
  localNaoEncontrado(1, 'Local não encontrado'),
  problemaViatura(2, 'Problemas com a viatura'),
  dependeLinhaViva(3, 'Depende da linha viva'),
  dependeDesligamento(4, 'Depende de desligamento'),
  limpezaFaixa(5, 'Limpeza de faixa'),
  naoAtingeRede(6, 'Não atinge rede'),
  encaminharOutraEquipe(7, 'Encaminhar para outra equipe'),
  outros(8, 'Outros/Especificar'),
  faltaMaterialConsumidor(9, 'Serviço não executado por falta de material pelo consumidor'),
  autoReligado(10, 'Auto-religado');

  final int code;
  final String description;

  const TipoOcorrencia(this.code, this.description);

}