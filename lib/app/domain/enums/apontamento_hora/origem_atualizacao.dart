enum OrigemAtualizacao {
  servicos(1,'Serviços'),
  obras(2,'Obras'),
  cortes(3,'Cortes'),
  leitura(4,'Leitura'),
  inspecao(5,'Inspeção');

  final int id;
  final String desc;

  const OrigemAtualizacao(this.id,this.desc);

  static OrigemAtualizacao fromId(int id) {
    return OrigemAtualizacao.values.firstWhere((e) => e.id == id, orElse: () => OrigemAtualizacao.servicos);
  }

}