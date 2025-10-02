// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apontamento_hora.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApontamentoHora {

 int get cdEletricista; String? get dsObservacao;
/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApontamentoHoraCopyWith<ApontamentoHora> get copyWith => _$ApontamentoHoraCopyWithImpl<ApontamentoHora>(this as ApontamentoHora, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApontamentoHora&&(identical(other.cdEletricista, cdEletricista) || other.cdEletricista == cdEletricista)&&(identical(other.dsObservacao, dsObservacao) || other.dsObservacao == dsObservacao));
}


@override
int get hashCode => Object.hash(runtimeType,cdEletricista,dsObservacao);

@override
String toString() {
  return 'ApontamentoHora(cdEletricista: $cdEletricista, dsObservacao: $dsObservacao)';
}


}

/// @nodoc
abstract mixin class $ApontamentoHoraCopyWith<$Res>  {
  factory $ApontamentoHoraCopyWith(ApontamentoHora value, $Res Function(ApontamentoHora) _then) = _$ApontamentoHoraCopyWithImpl;
@useResult
$Res call({
 int cdEletricista, String? dsObservacao
});




}
/// @nodoc
class _$ApontamentoHoraCopyWithImpl<$Res>
    implements $ApontamentoHoraCopyWith<$Res> {
  _$ApontamentoHoraCopyWithImpl(this._self, this._then);

  final ApontamentoHora _self;
  final $Res Function(ApontamentoHora) _then;

/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cdEletricista = null,Object? dsObservacao = freezed,}) {
  return _then(_self.copyWith(
cdEletricista: null == cdEletricista ? _self.cdEletricista : cdEletricista // ignore: cast_nullable_to_non_nullable
as int,dsObservacao: freezed == dsObservacao ? _self.dsObservacao : dsObservacao // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApontamentoHora].
extension ApontamentoHoraPatterns on ApontamentoHora {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApontamentoCompleto value)?  apontamentoCompleto,TResult Function( ApontamentoHoraEvento value)?  apontamentoHoraEvento,TResult Function( ApontamentoHoraTurno value)?  apontamentoHoraTurno,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApontamentoCompleto() when apontamentoCompleto != null:
return apontamentoCompleto(_that);case ApontamentoHoraEvento() when apontamentoHoraEvento != null:
return apontamentoHoraEvento(_that);case ApontamentoHoraTurno() when apontamentoHoraTurno != null:
return apontamentoHoraTurno(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApontamentoCompleto value)  apontamentoCompleto,required TResult Function( ApontamentoHoraEvento value)  apontamentoHoraEvento,required TResult Function( ApontamentoHoraTurno value)  apontamentoHoraTurno,}){
final _that = this;
switch (_that) {
case ApontamentoCompleto():
return apontamentoCompleto(_that);case ApontamentoHoraEvento():
return apontamentoHoraEvento(_that);case ApontamentoHoraTurno():
return apontamentoHoraTurno(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApontamentoCompleto value)?  apontamentoCompleto,TResult? Function( ApontamentoHoraEvento value)?  apontamentoHoraEvento,TResult? Function( ApontamentoHoraTurno value)?  apontamentoHoraTurno,}){
final _that = this;
switch (_that) {
case ApontamentoCompleto() when apontamentoCompleto != null:
return apontamentoCompleto(_that);case ApontamentoHoraEvento() when apontamentoHoraEvento != null:
return apontamentoHoraEvento(_that);case ApontamentoHoraTurno() when apontamentoHoraTurno != null:
return apontamentoHoraTurno(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  int cdEletricista,  int? idSequencia,  DateTime dtApontamento,  DateTime? dtHoraInicioApontamento,  EventoServico evento,  double vlCoordenadaXInicioApontamento,  double vlCoordenadaYInicioApontamento,  double? vlCoordenadaXTerminoApontamento,  double? vlCoordenadaYTerminoApontamento,  int idOrigem,  int? nrServico,  int? cdEnvio,  int? cdMatMembro,  int? cdEquipe,  int? cdUnConsumidora,  String? dsObservacao,  DateTime? updatedAt)?  apontamentoCompleto,TResult Function( int cdEletricista,  int? idSequencia,  DateTime dtHrApontamento,  double vlCoordenadaXApontamento,  double vlCoordenadaYApontamento,  int cdEvento,  OrigemAtualizacao origem,  int? nrServico,  int? cdUnConsumidora,  int idInicioTermino,  String? dsObservacao)?  apontamentoHoraEvento,TResult Function( int cdEletricista,  DateTime dtHrApontamento,  double vlCoordenadaXApontamento,  double vlCoordenadaYApontamento,  OrigemAtualizacao origem,  int idInicioTermino,  String? dsObservacao)?  apontamentoHoraTurno,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApontamentoCompleto() when apontamentoCompleto != null:
return apontamentoCompleto(_that.id,_that.cdEletricista,_that.idSequencia,_that.dtApontamento,_that.dtHoraInicioApontamento,_that.evento,_that.vlCoordenadaXInicioApontamento,_that.vlCoordenadaYInicioApontamento,_that.vlCoordenadaXTerminoApontamento,_that.vlCoordenadaYTerminoApontamento,_that.idOrigem,_that.nrServico,_that.cdEnvio,_that.cdMatMembro,_that.cdEquipe,_that.cdUnConsumidora,_that.dsObservacao,_that.updatedAt);case ApontamentoHoraEvento() when apontamentoHoraEvento != null:
return apontamentoHoraEvento(_that.cdEletricista,_that.idSequencia,_that.dtHrApontamento,_that.vlCoordenadaXApontamento,_that.vlCoordenadaYApontamento,_that.cdEvento,_that.origem,_that.nrServico,_that.cdUnConsumidora,_that.idInicioTermino,_that.dsObservacao);case ApontamentoHoraTurno() when apontamentoHoraTurno != null:
return apontamentoHoraTurno(_that.cdEletricista,_that.dtHrApontamento,_that.vlCoordenadaXApontamento,_that.vlCoordenadaYApontamento,_that.origem,_that.idInicioTermino,_that.dsObservacao);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  int cdEletricista,  int? idSequencia,  DateTime dtApontamento,  DateTime? dtHoraInicioApontamento,  EventoServico evento,  double vlCoordenadaXInicioApontamento,  double vlCoordenadaYInicioApontamento,  double? vlCoordenadaXTerminoApontamento,  double? vlCoordenadaYTerminoApontamento,  int idOrigem,  int? nrServico,  int? cdEnvio,  int? cdMatMembro,  int? cdEquipe,  int? cdUnConsumidora,  String? dsObservacao,  DateTime? updatedAt)  apontamentoCompleto,required TResult Function( int cdEletricista,  int? idSequencia,  DateTime dtHrApontamento,  double vlCoordenadaXApontamento,  double vlCoordenadaYApontamento,  int cdEvento,  OrigemAtualizacao origem,  int? nrServico,  int? cdUnConsumidora,  int idInicioTermino,  String? dsObservacao)  apontamentoHoraEvento,required TResult Function( int cdEletricista,  DateTime dtHrApontamento,  double vlCoordenadaXApontamento,  double vlCoordenadaYApontamento,  OrigemAtualizacao origem,  int idInicioTermino,  String? dsObservacao)  apontamentoHoraTurno,}) {final _that = this;
switch (_that) {
case ApontamentoCompleto():
return apontamentoCompleto(_that.id,_that.cdEletricista,_that.idSequencia,_that.dtApontamento,_that.dtHoraInicioApontamento,_that.evento,_that.vlCoordenadaXInicioApontamento,_that.vlCoordenadaYInicioApontamento,_that.vlCoordenadaXTerminoApontamento,_that.vlCoordenadaYTerminoApontamento,_that.idOrigem,_that.nrServico,_that.cdEnvio,_that.cdMatMembro,_that.cdEquipe,_that.cdUnConsumidora,_that.dsObservacao,_that.updatedAt);case ApontamentoHoraEvento():
return apontamentoHoraEvento(_that.cdEletricista,_that.idSequencia,_that.dtHrApontamento,_that.vlCoordenadaXApontamento,_that.vlCoordenadaYApontamento,_that.cdEvento,_that.origem,_that.nrServico,_that.cdUnConsumidora,_that.idInicioTermino,_that.dsObservacao);case ApontamentoHoraTurno():
return apontamentoHoraTurno(_that.cdEletricista,_that.dtHrApontamento,_that.vlCoordenadaXApontamento,_that.vlCoordenadaYApontamento,_that.origem,_that.idInicioTermino,_that.dsObservacao);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  int cdEletricista,  int? idSequencia,  DateTime dtApontamento,  DateTime? dtHoraInicioApontamento,  EventoServico evento,  double vlCoordenadaXInicioApontamento,  double vlCoordenadaYInicioApontamento,  double? vlCoordenadaXTerminoApontamento,  double? vlCoordenadaYTerminoApontamento,  int idOrigem,  int? nrServico,  int? cdEnvio,  int? cdMatMembro,  int? cdEquipe,  int? cdUnConsumidora,  String? dsObservacao,  DateTime? updatedAt)?  apontamentoCompleto,TResult? Function( int cdEletricista,  int? idSequencia,  DateTime dtHrApontamento,  double vlCoordenadaXApontamento,  double vlCoordenadaYApontamento,  int cdEvento,  OrigemAtualizacao origem,  int? nrServico,  int? cdUnConsumidora,  int idInicioTermino,  String? dsObservacao)?  apontamentoHoraEvento,TResult? Function( int cdEletricista,  DateTime dtHrApontamento,  double vlCoordenadaXApontamento,  double vlCoordenadaYApontamento,  OrigemAtualizacao origem,  int idInicioTermino,  String? dsObservacao)?  apontamentoHoraTurno,}) {final _that = this;
switch (_that) {
case ApontamentoCompleto() when apontamentoCompleto != null:
return apontamentoCompleto(_that.id,_that.cdEletricista,_that.idSequencia,_that.dtApontamento,_that.dtHoraInicioApontamento,_that.evento,_that.vlCoordenadaXInicioApontamento,_that.vlCoordenadaYInicioApontamento,_that.vlCoordenadaXTerminoApontamento,_that.vlCoordenadaYTerminoApontamento,_that.idOrigem,_that.nrServico,_that.cdEnvio,_that.cdMatMembro,_that.cdEquipe,_that.cdUnConsumidora,_that.dsObservacao,_that.updatedAt);case ApontamentoHoraEvento() when apontamentoHoraEvento != null:
return apontamentoHoraEvento(_that.cdEletricista,_that.idSequencia,_that.dtHrApontamento,_that.vlCoordenadaXApontamento,_that.vlCoordenadaYApontamento,_that.cdEvento,_that.origem,_that.nrServico,_that.cdUnConsumidora,_that.idInicioTermino,_that.dsObservacao);case ApontamentoHoraTurno() when apontamentoHoraTurno != null:
return apontamentoHoraTurno(_that.cdEletricista,_that.dtHrApontamento,_that.vlCoordenadaXApontamento,_that.vlCoordenadaYApontamento,_that.origem,_that.idInicioTermino,_that.dsObservacao);case _:
  return null;

}
}

}

/// @nodoc


class ApontamentoCompleto extends ApontamentoHora {
  const ApontamentoCompleto({this.id = 0, required this.cdEletricista, this.idSequencia, required this.dtApontamento, this.dtHoraInicioApontamento, required this.evento, required this.vlCoordenadaXInicioApontamento, required this.vlCoordenadaYInicioApontamento, this.vlCoordenadaXTerminoApontamento, this.vlCoordenadaYTerminoApontamento, required this.idOrigem, this.nrServico, this.cdEnvio, this.cdMatMembro, this.cdEquipe, this.cdUnConsumidora, this.dsObservacao, this.updatedAt}): super._();
  

@JsonKey() final  int id;
@override final  int cdEletricista;
 final  int? idSequencia;
 final  DateTime dtApontamento;
 final  DateTime? dtHoraInicioApontamento;
 final  EventoServico evento;
 final  double vlCoordenadaXInicioApontamento;
 final  double vlCoordenadaYInicioApontamento;
 final  double? vlCoordenadaXTerminoApontamento;
 final  double? vlCoordenadaYTerminoApontamento;
 final  int idOrigem;
 final  int? nrServico;
 final  int? cdEnvio;
 final  int? cdMatMembro;
 final  int? cdEquipe;
 final  int? cdUnConsumidora;
@override final  String? dsObservacao;
 final  DateTime? updatedAt;

/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApontamentoCompletoCopyWith<ApontamentoCompleto> get copyWith => _$ApontamentoCompletoCopyWithImpl<ApontamentoCompleto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApontamentoCompleto&&(identical(other.id, id) || other.id == id)&&(identical(other.cdEletricista, cdEletricista) || other.cdEletricista == cdEletricista)&&(identical(other.idSequencia, idSequencia) || other.idSequencia == idSequencia)&&(identical(other.dtApontamento, dtApontamento) || other.dtApontamento == dtApontamento)&&(identical(other.dtHoraInicioApontamento, dtHoraInicioApontamento) || other.dtHoraInicioApontamento == dtHoraInicioApontamento)&&(identical(other.evento, evento) || other.evento == evento)&&(identical(other.vlCoordenadaXInicioApontamento, vlCoordenadaXInicioApontamento) || other.vlCoordenadaXInicioApontamento == vlCoordenadaXInicioApontamento)&&(identical(other.vlCoordenadaYInicioApontamento, vlCoordenadaYInicioApontamento) || other.vlCoordenadaYInicioApontamento == vlCoordenadaYInicioApontamento)&&(identical(other.vlCoordenadaXTerminoApontamento, vlCoordenadaXTerminoApontamento) || other.vlCoordenadaXTerminoApontamento == vlCoordenadaXTerminoApontamento)&&(identical(other.vlCoordenadaYTerminoApontamento, vlCoordenadaYTerminoApontamento) || other.vlCoordenadaYTerminoApontamento == vlCoordenadaYTerminoApontamento)&&(identical(other.idOrigem, idOrigem) || other.idOrigem == idOrigem)&&(identical(other.nrServico, nrServico) || other.nrServico == nrServico)&&(identical(other.cdEnvio, cdEnvio) || other.cdEnvio == cdEnvio)&&(identical(other.cdMatMembro, cdMatMembro) || other.cdMatMembro == cdMatMembro)&&(identical(other.cdEquipe, cdEquipe) || other.cdEquipe == cdEquipe)&&(identical(other.cdUnConsumidora, cdUnConsumidora) || other.cdUnConsumidora == cdUnConsumidora)&&(identical(other.dsObservacao, dsObservacao) || other.dsObservacao == dsObservacao)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,cdEletricista,idSequencia,dtApontamento,dtHoraInicioApontamento,evento,vlCoordenadaXInicioApontamento,vlCoordenadaYInicioApontamento,vlCoordenadaXTerminoApontamento,vlCoordenadaYTerminoApontamento,idOrigem,nrServico,cdEnvio,cdMatMembro,cdEquipe,cdUnConsumidora,dsObservacao,updatedAt);

@override
String toString() {
  return 'ApontamentoHora.apontamentoCompleto(id: $id, cdEletricista: $cdEletricista, idSequencia: $idSequencia, dtApontamento: $dtApontamento, dtHoraInicioApontamento: $dtHoraInicioApontamento, evento: $evento, vlCoordenadaXInicioApontamento: $vlCoordenadaXInicioApontamento, vlCoordenadaYInicioApontamento: $vlCoordenadaYInicioApontamento, vlCoordenadaXTerminoApontamento: $vlCoordenadaXTerminoApontamento, vlCoordenadaYTerminoApontamento: $vlCoordenadaYTerminoApontamento, idOrigem: $idOrigem, nrServico: $nrServico, cdEnvio: $cdEnvio, cdMatMembro: $cdMatMembro, cdEquipe: $cdEquipe, cdUnConsumidora: $cdUnConsumidora, dsObservacao: $dsObservacao, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ApontamentoCompletoCopyWith<$Res> implements $ApontamentoHoraCopyWith<$Res> {
  factory $ApontamentoCompletoCopyWith(ApontamentoCompleto value, $Res Function(ApontamentoCompleto) _then) = _$ApontamentoCompletoCopyWithImpl;
@override @useResult
$Res call({
 int id, int cdEletricista, int? idSequencia, DateTime dtApontamento, DateTime? dtHoraInicioApontamento, EventoServico evento, double vlCoordenadaXInicioApontamento, double vlCoordenadaYInicioApontamento, double? vlCoordenadaXTerminoApontamento, double? vlCoordenadaYTerminoApontamento, int idOrigem, int? nrServico, int? cdEnvio, int? cdMatMembro, int? cdEquipe, int? cdUnConsumidora, String? dsObservacao, DateTime? updatedAt
});




}
/// @nodoc
class _$ApontamentoCompletoCopyWithImpl<$Res>
    implements $ApontamentoCompletoCopyWith<$Res> {
  _$ApontamentoCompletoCopyWithImpl(this._self, this._then);

  final ApontamentoCompleto _self;
  final $Res Function(ApontamentoCompleto) _then;

/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cdEletricista = null,Object? idSequencia = freezed,Object? dtApontamento = null,Object? dtHoraInicioApontamento = freezed,Object? evento = null,Object? vlCoordenadaXInicioApontamento = null,Object? vlCoordenadaYInicioApontamento = null,Object? vlCoordenadaXTerminoApontamento = freezed,Object? vlCoordenadaYTerminoApontamento = freezed,Object? idOrigem = null,Object? nrServico = freezed,Object? cdEnvio = freezed,Object? cdMatMembro = freezed,Object? cdEquipe = freezed,Object? cdUnConsumidora = freezed,Object? dsObservacao = freezed,Object? updatedAt = freezed,}) {
  return _then(ApontamentoCompleto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cdEletricista: null == cdEletricista ? _self.cdEletricista : cdEletricista // ignore: cast_nullable_to_non_nullable
as int,idSequencia: freezed == idSequencia ? _self.idSequencia : idSequencia // ignore: cast_nullable_to_non_nullable
as int?,dtApontamento: null == dtApontamento ? _self.dtApontamento : dtApontamento // ignore: cast_nullable_to_non_nullable
as DateTime,dtHoraInicioApontamento: freezed == dtHoraInicioApontamento ? _self.dtHoraInicioApontamento : dtHoraInicioApontamento // ignore: cast_nullable_to_non_nullable
as DateTime?,evento: null == evento ? _self.evento : evento // ignore: cast_nullable_to_non_nullable
as EventoServico,vlCoordenadaXInicioApontamento: null == vlCoordenadaXInicioApontamento ? _self.vlCoordenadaXInicioApontamento : vlCoordenadaXInicioApontamento // ignore: cast_nullable_to_non_nullable
as double,vlCoordenadaYInicioApontamento: null == vlCoordenadaYInicioApontamento ? _self.vlCoordenadaYInicioApontamento : vlCoordenadaYInicioApontamento // ignore: cast_nullable_to_non_nullable
as double,vlCoordenadaXTerminoApontamento: freezed == vlCoordenadaXTerminoApontamento ? _self.vlCoordenadaXTerminoApontamento : vlCoordenadaXTerminoApontamento // ignore: cast_nullable_to_non_nullable
as double?,vlCoordenadaYTerminoApontamento: freezed == vlCoordenadaYTerminoApontamento ? _self.vlCoordenadaYTerminoApontamento : vlCoordenadaYTerminoApontamento // ignore: cast_nullable_to_non_nullable
as double?,idOrigem: null == idOrigem ? _self.idOrigem : idOrigem // ignore: cast_nullable_to_non_nullable
as int,nrServico: freezed == nrServico ? _self.nrServico : nrServico // ignore: cast_nullable_to_non_nullable
as int?,cdEnvio: freezed == cdEnvio ? _self.cdEnvio : cdEnvio // ignore: cast_nullable_to_non_nullable
as int?,cdMatMembro: freezed == cdMatMembro ? _self.cdMatMembro : cdMatMembro // ignore: cast_nullable_to_non_nullable
as int?,cdEquipe: freezed == cdEquipe ? _self.cdEquipe : cdEquipe // ignore: cast_nullable_to_non_nullable
as int?,cdUnConsumidora: freezed == cdUnConsumidora ? _self.cdUnConsumidora : cdUnConsumidora // ignore: cast_nullable_to_non_nullable
as int?,dsObservacao: freezed == dsObservacao ? _self.dsObservacao : dsObservacao // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class ApontamentoHoraEvento extends ApontamentoHora {
  const ApontamentoHoraEvento({required this.cdEletricista, this.idSequencia, required this.dtHrApontamento, required this.vlCoordenadaXApontamento, required this.vlCoordenadaYApontamento, required this.cdEvento, required this.origem, this.nrServico, this.cdUnConsumidora, required this.idInicioTermino, this.dsObservacao}): super._();
  

@override final  int cdEletricista;
 final  int? idSequencia;
 final  DateTime dtHrApontamento;
 final  double vlCoordenadaXApontamento;
 final  double vlCoordenadaYApontamento;
 final  int cdEvento;
 final  OrigemAtualizacao origem;
 final  int? nrServico;
 final  int? cdUnConsumidora;
 final  int idInicioTermino;
@override final  String? dsObservacao;

/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApontamentoHoraEventoCopyWith<ApontamentoHoraEvento> get copyWith => _$ApontamentoHoraEventoCopyWithImpl<ApontamentoHoraEvento>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApontamentoHoraEvento&&(identical(other.cdEletricista, cdEletricista) || other.cdEletricista == cdEletricista)&&(identical(other.idSequencia, idSequencia) || other.idSequencia == idSequencia)&&(identical(other.dtHrApontamento, dtHrApontamento) || other.dtHrApontamento == dtHrApontamento)&&(identical(other.vlCoordenadaXApontamento, vlCoordenadaXApontamento) || other.vlCoordenadaXApontamento == vlCoordenadaXApontamento)&&(identical(other.vlCoordenadaYApontamento, vlCoordenadaYApontamento) || other.vlCoordenadaYApontamento == vlCoordenadaYApontamento)&&(identical(other.cdEvento, cdEvento) || other.cdEvento == cdEvento)&&(identical(other.origem, origem) || other.origem == origem)&&(identical(other.nrServico, nrServico) || other.nrServico == nrServico)&&(identical(other.cdUnConsumidora, cdUnConsumidora) || other.cdUnConsumidora == cdUnConsumidora)&&(identical(other.idInicioTermino, idInicioTermino) || other.idInicioTermino == idInicioTermino)&&(identical(other.dsObservacao, dsObservacao) || other.dsObservacao == dsObservacao));
}


@override
int get hashCode => Object.hash(runtimeType,cdEletricista,idSequencia,dtHrApontamento,vlCoordenadaXApontamento,vlCoordenadaYApontamento,cdEvento,origem,nrServico,cdUnConsumidora,idInicioTermino,dsObservacao);

@override
String toString() {
  return 'ApontamentoHora.apontamentoHoraEvento(cdEletricista: $cdEletricista, idSequencia: $idSequencia, dtHrApontamento: $dtHrApontamento, vlCoordenadaXApontamento: $vlCoordenadaXApontamento, vlCoordenadaYApontamento: $vlCoordenadaYApontamento, cdEvento: $cdEvento, origem: $origem, nrServico: $nrServico, cdUnConsumidora: $cdUnConsumidora, idInicioTermino: $idInicioTermino, dsObservacao: $dsObservacao)';
}


}

/// @nodoc
abstract mixin class $ApontamentoHoraEventoCopyWith<$Res> implements $ApontamentoHoraCopyWith<$Res> {
  factory $ApontamentoHoraEventoCopyWith(ApontamentoHoraEvento value, $Res Function(ApontamentoHoraEvento) _then) = _$ApontamentoHoraEventoCopyWithImpl;
@override @useResult
$Res call({
 int cdEletricista, int? idSequencia, DateTime dtHrApontamento, double vlCoordenadaXApontamento, double vlCoordenadaYApontamento, int cdEvento, OrigemAtualizacao origem, int? nrServico, int? cdUnConsumidora, int idInicioTermino, String? dsObservacao
});




}
/// @nodoc
class _$ApontamentoHoraEventoCopyWithImpl<$Res>
    implements $ApontamentoHoraEventoCopyWith<$Res> {
  _$ApontamentoHoraEventoCopyWithImpl(this._self, this._then);

  final ApontamentoHoraEvento _self;
  final $Res Function(ApontamentoHoraEvento) _then;

/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cdEletricista = null,Object? idSequencia = freezed,Object? dtHrApontamento = null,Object? vlCoordenadaXApontamento = null,Object? vlCoordenadaYApontamento = null,Object? cdEvento = null,Object? origem = null,Object? nrServico = freezed,Object? cdUnConsumidora = freezed,Object? idInicioTermino = null,Object? dsObservacao = freezed,}) {
  return _then(ApontamentoHoraEvento(
cdEletricista: null == cdEletricista ? _self.cdEletricista : cdEletricista // ignore: cast_nullable_to_non_nullable
as int,idSequencia: freezed == idSequencia ? _self.idSequencia : idSequencia // ignore: cast_nullable_to_non_nullable
as int?,dtHrApontamento: null == dtHrApontamento ? _self.dtHrApontamento : dtHrApontamento // ignore: cast_nullable_to_non_nullable
as DateTime,vlCoordenadaXApontamento: null == vlCoordenadaXApontamento ? _self.vlCoordenadaXApontamento : vlCoordenadaXApontamento // ignore: cast_nullable_to_non_nullable
as double,vlCoordenadaYApontamento: null == vlCoordenadaYApontamento ? _self.vlCoordenadaYApontamento : vlCoordenadaYApontamento // ignore: cast_nullable_to_non_nullable
as double,cdEvento: null == cdEvento ? _self.cdEvento : cdEvento // ignore: cast_nullable_to_non_nullable
as int,origem: null == origem ? _self.origem : origem // ignore: cast_nullable_to_non_nullable
as OrigemAtualizacao,nrServico: freezed == nrServico ? _self.nrServico : nrServico // ignore: cast_nullable_to_non_nullable
as int?,cdUnConsumidora: freezed == cdUnConsumidora ? _self.cdUnConsumidora : cdUnConsumidora // ignore: cast_nullable_to_non_nullable
as int?,idInicioTermino: null == idInicioTermino ? _self.idInicioTermino : idInicioTermino // ignore: cast_nullable_to_non_nullable
as int,dsObservacao: freezed == dsObservacao ? _self.dsObservacao : dsObservacao // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ApontamentoHoraTurno extends ApontamentoHora {
  const ApontamentoHoraTurno({required this.cdEletricista, required this.dtHrApontamento, required this.vlCoordenadaXApontamento, required this.vlCoordenadaYApontamento, required this.origem, required this.idInicioTermino, this.dsObservacao}): super._();
  

@override final  int cdEletricista;
 final  DateTime dtHrApontamento;
 final  double vlCoordenadaXApontamento;
 final  double vlCoordenadaYApontamento;
 final  OrigemAtualizacao origem;
 final  int idInicioTermino;
@override final  String? dsObservacao;

/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApontamentoHoraTurnoCopyWith<ApontamentoHoraTurno> get copyWith => _$ApontamentoHoraTurnoCopyWithImpl<ApontamentoHoraTurno>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApontamentoHoraTurno&&(identical(other.cdEletricista, cdEletricista) || other.cdEletricista == cdEletricista)&&(identical(other.dtHrApontamento, dtHrApontamento) || other.dtHrApontamento == dtHrApontamento)&&(identical(other.vlCoordenadaXApontamento, vlCoordenadaXApontamento) || other.vlCoordenadaXApontamento == vlCoordenadaXApontamento)&&(identical(other.vlCoordenadaYApontamento, vlCoordenadaYApontamento) || other.vlCoordenadaYApontamento == vlCoordenadaYApontamento)&&(identical(other.origem, origem) || other.origem == origem)&&(identical(other.idInicioTermino, idInicioTermino) || other.idInicioTermino == idInicioTermino)&&(identical(other.dsObservacao, dsObservacao) || other.dsObservacao == dsObservacao));
}


@override
int get hashCode => Object.hash(runtimeType,cdEletricista,dtHrApontamento,vlCoordenadaXApontamento,vlCoordenadaYApontamento,origem,idInicioTermino,dsObservacao);

@override
String toString() {
  return 'ApontamentoHora.apontamentoHoraTurno(cdEletricista: $cdEletricista, dtHrApontamento: $dtHrApontamento, vlCoordenadaXApontamento: $vlCoordenadaXApontamento, vlCoordenadaYApontamento: $vlCoordenadaYApontamento, origem: $origem, idInicioTermino: $idInicioTermino, dsObservacao: $dsObservacao)';
}


}

/// @nodoc
abstract mixin class $ApontamentoHoraTurnoCopyWith<$Res> implements $ApontamentoHoraCopyWith<$Res> {
  factory $ApontamentoHoraTurnoCopyWith(ApontamentoHoraTurno value, $Res Function(ApontamentoHoraTurno) _then) = _$ApontamentoHoraTurnoCopyWithImpl;
@override @useResult
$Res call({
 int cdEletricista, DateTime dtHrApontamento, double vlCoordenadaXApontamento, double vlCoordenadaYApontamento, OrigemAtualizacao origem, int idInicioTermino, String? dsObservacao
});




}
/// @nodoc
class _$ApontamentoHoraTurnoCopyWithImpl<$Res>
    implements $ApontamentoHoraTurnoCopyWith<$Res> {
  _$ApontamentoHoraTurnoCopyWithImpl(this._self, this._then);

  final ApontamentoHoraTurno _self;
  final $Res Function(ApontamentoHoraTurno) _then;

/// Create a copy of ApontamentoHora
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cdEletricista = null,Object? dtHrApontamento = null,Object? vlCoordenadaXApontamento = null,Object? vlCoordenadaYApontamento = null,Object? origem = null,Object? idInicioTermino = null,Object? dsObservacao = freezed,}) {
  return _then(ApontamentoHoraTurno(
cdEletricista: null == cdEletricista ? _self.cdEletricista : cdEletricista // ignore: cast_nullable_to_non_nullable
as int,dtHrApontamento: null == dtHrApontamento ? _self.dtHrApontamento : dtHrApontamento // ignore: cast_nullable_to_non_nullable
as DateTime,vlCoordenadaXApontamento: null == vlCoordenadaXApontamento ? _self.vlCoordenadaXApontamento : vlCoordenadaXApontamento // ignore: cast_nullable_to_non_nullable
as double,vlCoordenadaYApontamento: null == vlCoordenadaYApontamento ? _self.vlCoordenadaYApontamento : vlCoordenadaYApontamento // ignore: cast_nullable_to_non_nullable
as double,origem: null == origem ? _self.origem : origem // ignore: cast_nullable_to_non_nullable
as OrigemAtualizacao,idInicioTermino: null == idInicioTermino ? _self.idInicioTermino : idInicioTermino // ignore: cast_nullable_to_non_nullable
as int,dsObservacao: freezed == dsObservacao ? _self.dsObservacao : dsObservacao // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
