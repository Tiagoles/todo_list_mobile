// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Configs {

 int? get numeroPda; int get timer;
/// Create a copy of Configs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigsCopyWith<Configs> get copyWith => _$ConfigsCopyWithImpl<Configs>(this as Configs, _$identity);

  /// Serializes this Configs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Configs&&(identical(other.numeroPda, numeroPda) || other.numeroPda == numeroPda)&&(identical(other.timer, timer) || other.timer == timer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numeroPda,timer);

@override
String toString() {
  return 'Configs(numeroPda: $numeroPda, timer: $timer)';
}


}

/// @nodoc
abstract mixin class $ConfigsCopyWith<$Res>  {
  factory $ConfigsCopyWith(Configs value, $Res Function(Configs) _then) = _$ConfigsCopyWithImpl;
@useResult
$Res call({
 int? numeroPda, int timer
});




}
/// @nodoc
class _$ConfigsCopyWithImpl<$Res>
    implements $ConfigsCopyWith<$Res> {
  _$ConfigsCopyWithImpl(this._self, this._then);

  final Configs _self;
  final $Res Function(Configs) _then;

/// Create a copy of Configs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numeroPda = freezed,Object? timer = null,}) {
  return _then(_self.copyWith(
numeroPda: freezed == numeroPda ? _self.numeroPda : numeroPda // ignore: cast_nullable_to_non_nullable
as int?,timer: null == timer ? _self.timer : timer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Configs].
extension ConfigsPatterns on Configs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Configs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Configs() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Configs value)  $default,){
final _that = this;
switch (_that) {
case _Configs():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Configs value)?  $default,){
final _that = this;
switch (_that) {
case _Configs() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? numeroPda,  int timer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Configs() when $default != null:
return $default(_that.numeroPda,_that.timer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? numeroPda,  int timer)  $default,) {final _that = this;
switch (_that) {
case _Configs():
return $default(_that.numeroPda,_that.timer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? numeroPda,  int timer)?  $default,) {final _that = this;
switch (_that) {
case _Configs() when $default != null:
return $default(_that.numeroPda,_that.timer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Configs implements Configs {
  const _Configs({this.numeroPda, this.timer = 10});
  factory _Configs.fromJson(Map<String, dynamic> json) => _$ConfigsFromJson(json);

@override final  int? numeroPda;
@override@JsonKey() final  int timer;

/// Create a copy of Configs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigsCopyWith<_Configs> get copyWith => __$ConfigsCopyWithImpl<_Configs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Configs&&(identical(other.numeroPda, numeroPda) || other.numeroPda == numeroPda)&&(identical(other.timer, timer) || other.timer == timer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numeroPda,timer);

@override
String toString() {
  return 'Configs(numeroPda: $numeroPda, timer: $timer)';
}


}

/// @nodoc
abstract mixin class _$ConfigsCopyWith<$Res> implements $ConfigsCopyWith<$Res> {
  factory _$ConfigsCopyWith(_Configs value, $Res Function(_Configs) _then) = __$ConfigsCopyWithImpl;
@override @useResult
$Res call({
 int? numeroPda, int timer
});




}
/// @nodoc
class __$ConfigsCopyWithImpl<$Res>
    implements _$ConfigsCopyWith<$Res> {
  __$ConfigsCopyWithImpl(this._self, this._then);

  final _Configs _self;
  final $Res Function(_Configs) _then;

/// Create a copy of Configs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numeroPda = freezed,Object? timer = null,}) {
  return _then(_Configs(
numeroPda: freezed == numeroPda ? _self.numeroPda : numeroPda // ignore: cast_nullable_to_non_nullable
as int?,timer: null == timer ? _self.timer : timer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
