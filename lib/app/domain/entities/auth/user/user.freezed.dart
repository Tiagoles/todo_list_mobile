// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
User _$UserFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'notLoggedUser':
          return NotLoggedUser.fromJson(
            json
          );
                case 'loggedUser':
          return LoggedUser.fromJson(
            json
          );
                case 'notLoggedEletricista':
          return NotLoggedEletricista.fromJson(
            json
          );
                case 'loggedEletricista':
          return LoggedEletricista.fromJson(
            json
          );
                case 'notLoggedEquipe':
          return NotLoggedEquipe.fromJson(
            json
          );
                case 'loggedEquipe':
          return LoggedEquipe.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'User',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$User {

 String get usuario; String get nmUsuario;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nmUsuario, nmUsuario) || other.nmUsuario == nmUsuario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usuario,nmUsuario);

@override
String toString() {
  return 'User(usuario: $usuario, nmUsuario: $nmUsuario)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String usuario, String nmUsuario
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usuario = null,Object? nmUsuario = null,}) {
  return _then(_self.copyWith(
usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as String,nmUsuario: null == nmUsuario ? _self.nmUsuario : nmUsuario // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotLoggedUser value)?  notLoggedUser,TResult Function( LoggedUser value)?  loggedUser,TResult Function( NotLoggedEletricista value)?  notLoggedEletricista,TResult Function( LoggedEletricista value)?  loggedEletricista,TResult Function( NotLoggedEquipe value)?  notLoggedEquipe,TResult Function( LoggedEquipe value)?  loggedEquipe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotLoggedUser() when notLoggedUser != null:
return notLoggedUser(_that);case LoggedUser() when loggedUser != null:
return loggedUser(_that);case NotLoggedEletricista() when notLoggedEletricista != null:
return notLoggedEletricista(_that);case LoggedEletricista() when loggedEletricista != null:
return loggedEletricista(_that);case NotLoggedEquipe() when notLoggedEquipe != null:
return notLoggedEquipe(_that);case LoggedEquipe() when loggedEquipe != null:
return loggedEquipe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotLoggedUser value)  notLoggedUser,required TResult Function( LoggedUser value)  loggedUser,required TResult Function( NotLoggedEletricista value)  notLoggedEletricista,required TResult Function( LoggedEletricista value)  loggedEletricista,required TResult Function( NotLoggedEquipe value)  notLoggedEquipe,required TResult Function( LoggedEquipe value)  loggedEquipe,}){
final _that = this;
switch (_that) {
case NotLoggedUser():
return notLoggedUser(_that);case LoggedUser():
return loggedUser(_that);case NotLoggedEletricista():
return notLoggedEletricista(_that);case LoggedEletricista():
return loggedEletricista(_that);case NotLoggedEquipe():
return notLoggedEquipe(_that);case LoggedEquipe():
return loggedEquipe(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotLoggedUser value)?  notLoggedUser,TResult? Function( LoggedUser value)?  loggedUser,TResult? Function( NotLoggedEletricista value)?  notLoggedEletricista,TResult? Function( LoggedEletricista value)?  loggedEletricista,TResult? Function( NotLoggedEquipe value)?  notLoggedEquipe,TResult? Function( LoggedEquipe value)?  loggedEquipe,}){
final _that = this;
switch (_that) {
case NotLoggedUser() when notLoggedUser != null:
return notLoggedUser(_that);case LoggedUser() when loggedUser != null:
return loggedUser(_that);case NotLoggedEletricista() when notLoggedEletricista != null:
return notLoggedEletricista(_that);case LoggedEletricista() when loggedEletricista != null:
return loggedEletricista(_that);case NotLoggedEquipe() when notLoggedEquipe != null:
return notLoggedEquipe(_that);case LoggedEquipe() when loggedEquipe != null:
return loggedEquipe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String usuario,  String nmUsuario)?  notLoggedUser,TResult Function( String usuario,  String nmUsuario,  String token,  double empresa)?  loggedUser,TResult Function( String usuario,  String nmUsuario,  double? escritorio)?  notLoggedEletricista,TResult Function( String usuario,  String nmUsuario,  double escritorio,  String token)?  loggedEletricista,TResult Function( String usuario,  String nmUsuario,  double? empresa)?  notLoggedEquipe,TResult Function( String usuario,  String nmUsuario,  double empresa,  String token)?  loggedEquipe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotLoggedUser() when notLoggedUser != null:
return notLoggedUser(_that.usuario,_that.nmUsuario);case LoggedUser() when loggedUser != null:
return loggedUser(_that.usuario,_that.nmUsuario,_that.token,_that.empresa);case NotLoggedEletricista() when notLoggedEletricista != null:
return notLoggedEletricista(_that.usuario,_that.nmUsuario,_that.escritorio);case LoggedEletricista() when loggedEletricista != null:
return loggedEletricista(_that.usuario,_that.nmUsuario,_that.escritorio,_that.token);case NotLoggedEquipe() when notLoggedEquipe != null:
return notLoggedEquipe(_that.usuario,_that.nmUsuario,_that.empresa);case LoggedEquipe() when loggedEquipe != null:
return loggedEquipe(_that.usuario,_that.nmUsuario,_that.empresa,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String usuario,  String nmUsuario)  notLoggedUser,required TResult Function( String usuario,  String nmUsuario,  String token,  double empresa)  loggedUser,required TResult Function( String usuario,  String nmUsuario,  double? escritorio)  notLoggedEletricista,required TResult Function( String usuario,  String nmUsuario,  double escritorio,  String token)  loggedEletricista,required TResult Function( String usuario,  String nmUsuario,  double? empresa)  notLoggedEquipe,required TResult Function( String usuario,  String nmUsuario,  double empresa,  String token)  loggedEquipe,}) {final _that = this;
switch (_that) {
case NotLoggedUser():
return notLoggedUser(_that.usuario,_that.nmUsuario);case LoggedUser():
return loggedUser(_that.usuario,_that.nmUsuario,_that.token,_that.empresa);case NotLoggedEletricista():
return notLoggedEletricista(_that.usuario,_that.nmUsuario,_that.escritorio);case LoggedEletricista():
return loggedEletricista(_that.usuario,_that.nmUsuario,_that.escritorio,_that.token);case NotLoggedEquipe():
return notLoggedEquipe(_that.usuario,_that.nmUsuario,_that.empresa);case LoggedEquipe():
return loggedEquipe(_that.usuario,_that.nmUsuario,_that.empresa,_that.token);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String usuario,  String nmUsuario)?  notLoggedUser,TResult? Function( String usuario,  String nmUsuario,  String token,  double empresa)?  loggedUser,TResult? Function( String usuario,  String nmUsuario,  double? escritorio)?  notLoggedEletricista,TResult? Function( String usuario,  String nmUsuario,  double escritorio,  String token)?  loggedEletricista,TResult? Function( String usuario,  String nmUsuario,  double? empresa)?  notLoggedEquipe,TResult? Function( String usuario,  String nmUsuario,  double empresa,  String token)?  loggedEquipe,}) {final _that = this;
switch (_that) {
case NotLoggedUser() when notLoggedUser != null:
return notLoggedUser(_that.usuario,_that.nmUsuario);case LoggedUser() when loggedUser != null:
return loggedUser(_that.usuario,_that.nmUsuario,_that.token,_that.empresa);case NotLoggedEletricista() when notLoggedEletricista != null:
return notLoggedEletricista(_that.usuario,_that.nmUsuario,_that.escritorio);case LoggedEletricista() when loggedEletricista != null:
return loggedEletricista(_that.usuario,_that.nmUsuario,_that.escritorio,_that.token);case NotLoggedEquipe() when notLoggedEquipe != null:
return notLoggedEquipe(_that.usuario,_that.nmUsuario,_that.empresa);case LoggedEquipe() when loggedEquipe != null:
return loggedEquipe(_that.usuario,_that.nmUsuario,_that.empresa,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class NotLoggedUser extends User {
  const NotLoggedUser({this.usuario = '', this.nmUsuario = 'Usuário', final  String? $type}): $type = $type ?? 'notLoggedUser',super._();
  factory NotLoggedUser.fromJson(Map<String, dynamic> json) => _$NotLoggedUserFromJson(json);

@override@JsonKey() final  String usuario;
@override@JsonKey() final  String nmUsuario;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotLoggedUserCopyWith<NotLoggedUser> get copyWith => _$NotLoggedUserCopyWithImpl<NotLoggedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotLoggedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotLoggedUser&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nmUsuario, nmUsuario) || other.nmUsuario == nmUsuario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usuario,nmUsuario);

@override
String toString() {
  return 'User.notLoggedUser(usuario: $usuario, nmUsuario: $nmUsuario)';
}


}

/// @nodoc
abstract mixin class $NotLoggedUserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $NotLoggedUserCopyWith(NotLoggedUser value, $Res Function(NotLoggedUser) _then) = _$NotLoggedUserCopyWithImpl;
@override @useResult
$Res call({
 String usuario, String nmUsuario
});




}
/// @nodoc
class _$NotLoggedUserCopyWithImpl<$Res>
    implements $NotLoggedUserCopyWith<$Res> {
  _$NotLoggedUserCopyWithImpl(this._self, this._then);

  final NotLoggedUser _self;
  final $Res Function(NotLoggedUser) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usuario = null,Object? nmUsuario = null,}) {
  return _then(NotLoggedUser(
usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as String,nmUsuario: null == nmUsuario ? _self.nmUsuario : nmUsuario // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class LoggedUser extends User {
  const LoggedUser({required this.usuario, this.nmUsuario = 'Usuário', required this.token, this.empresa = Constants.empresa, final  String? $type}): $type = $type ?? 'loggedUser',super._();
  factory LoggedUser.fromJson(Map<String, dynamic> json) => _$LoggedUserFromJson(json);

@override final  String usuario;
@override@JsonKey() final  String nmUsuario;
 final  String token;
@JsonKey() final  double empresa;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedUserCopyWith<LoggedUser> get copyWith => _$LoggedUserCopyWithImpl<LoggedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoggedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedUser&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nmUsuario, nmUsuario) || other.nmUsuario == nmUsuario)&&(identical(other.token, token) || other.token == token)&&(identical(other.empresa, empresa) || other.empresa == empresa));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usuario,nmUsuario,token,empresa);

@override
String toString() {
  return 'User.loggedUser(usuario: $usuario, nmUsuario: $nmUsuario, token: $token, empresa: $empresa)';
}


}

/// @nodoc
abstract mixin class $LoggedUserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $LoggedUserCopyWith(LoggedUser value, $Res Function(LoggedUser) _then) = _$LoggedUserCopyWithImpl;
@override @useResult
$Res call({
 String usuario, String nmUsuario, String token, double empresa
});




}
/// @nodoc
class _$LoggedUserCopyWithImpl<$Res>
    implements $LoggedUserCopyWith<$Res> {
  _$LoggedUserCopyWithImpl(this._self, this._then);

  final LoggedUser _self;
  final $Res Function(LoggedUser) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usuario = null,Object? nmUsuario = null,Object? token = null,Object? empresa = null,}) {
  return _then(LoggedUser(
usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as String,nmUsuario: null == nmUsuario ? _self.nmUsuario : nmUsuario // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,empresa: null == empresa ? _self.empresa : empresa // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NotLoggedEletricista extends User {
  const NotLoggedEletricista({this.usuario = '', this.nmUsuario = 'Usuário', this.escritorio, final  String? $type}): $type = $type ?? 'notLoggedEletricista',super._();
  factory NotLoggedEletricista.fromJson(Map<String, dynamic> json) => _$NotLoggedEletricistaFromJson(json);

@override@JsonKey() final  String usuario;
@override@JsonKey() final  String nmUsuario;
 final  double? escritorio;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotLoggedEletricistaCopyWith<NotLoggedEletricista> get copyWith => _$NotLoggedEletricistaCopyWithImpl<NotLoggedEletricista>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotLoggedEletricistaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotLoggedEletricista&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nmUsuario, nmUsuario) || other.nmUsuario == nmUsuario)&&(identical(other.escritorio, escritorio) || other.escritorio == escritorio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usuario,nmUsuario,escritorio);

@override
String toString() {
  return 'User.notLoggedEletricista(usuario: $usuario, nmUsuario: $nmUsuario, escritorio: $escritorio)';
}


}

/// @nodoc
abstract mixin class $NotLoggedEletricistaCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $NotLoggedEletricistaCopyWith(NotLoggedEletricista value, $Res Function(NotLoggedEletricista) _then) = _$NotLoggedEletricistaCopyWithImpl;
@override @useResult
$Res call({
 String usuario, String nmUsuario, double? escritorio
});




}
/// @nodoc
class _$NotLoggedEletricistaCopyWithImpl<$Res>
    implements $NotLoggedEletricistaCopyWith<$Res> {
  _$NotLoggedEletricistaCopyWithImpl(this._self, this._then);

  final NotLoggedEletricista _self;
  final $Res Function(NotLoggedEletricista) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usuario = null,Object? nmUsuario = null,Object? escritorio = freezed,}) {
  return _then(NotLoggedEletricista(
usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as String,nmUsuario: null == nmUsuario ? _self.nmUsuario : nmUsuario // ignore: cast_nullable_to_non_nullable
as String,escritorio: freezed == escritorio ? _self.escritorio : escritorio // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class LoggedEletricista extends User {
  const LoggedEletricista({required this.usuario, this.nmUsuario = 'Usuário', required this.escritorio, required this.token, final  String? $type}): $type = $type ?? 'loggedEletricista',super._();
  factory LoggedEletricista.fromJson(Map<String, dynamic> json) => _$LoggedEletricistaFromJson(json);

@override final  String usuario;
@override@JsonKey() final  String nmUsuario;
 final  double escritorio;
 final  String token;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedEletricistaCopyWith<LoggedEletricista> get copyWith => _$LoggedEletricistaCopyWithImpl<LoggedEletricista>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoggedEletricistaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedEletricista&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nmUsuario, nmUsuario) || other.nmUsuario == nmUsuario)&&(identical(other.escritorio, escritorio) || other.escritorio == escritorio)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usuario,nmUsuario,escritorio,token);

@override
String toString() {
  return 'User.loggedEletricista(usuario: $usuario, nmUsuario: $nmUsuario, escritorio: $escritorio, token: $token)';
}


}

/// @nodoc
abstract mixin class $LoggedEletricistaCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $LoggedEletricistaCopyWith(LoggedEletricista value, $Res Function(LoggedEletricista) _then) = _$LoggedEletricistaCopyWithImpl;
@override @useResult
$Res call({
 String usuario, String nmUsuario, double escritorio, String token
});




}
/// @nodoc
class _$LoggedEletricistaCopyWithImpl<$Res>
    implements $LoggedEletricistaCopyWith<$Res> {
  _$LoggedEletricistaCopyWithImpl(this._self, this._then);

  final LoggedEletricista _self;
  final $Res Function(LoggedEletricista) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usuario = null,Object? nmUsuario = null,Object? escritorio = null,Object? token = null,}) {
  return _then(LoggedEletricista(
usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as String,nmUsuario: null == nmUsuario ? _self.nmUsuario : nmUsuario // ignore: cast_nullable_to_non_nullable
as String,escritorio: null == escritorio ? _self.escritorio : escritorio // ignore: cast_nullable_to_non_nullable
as double,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NotLoggedEquipe extends User {
  const NotLoggedEquipe({this.usuario = '', this.nmUsuario = 'Usuário', this.empresa, final  String? $type}): $type = $type ?? 'notLoggedEquipe',super._();
  factory NotLoggedEquipe.fromJson(Map<String, dynamic> json) => _$NotLoggedEquipeFromJson(json);

@override@JsonKey() final  String usuario;
@override@JsonKey() final  String nmUsuario;
 final  double? empresa;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotLoggedEquipeCopyWith<NotLoggedEquipe> get copyWith => _$NotLoggedEquipeCopyWithImpl<NotLoggedEquipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotLoggedEquipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotLoggedEquipe&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nmUsuario, nmUsuario) || other.nmUsuario == nmUsuario)&&(identical(other.empresa, empresa) || other.empresa == empresa));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usuario,nmUsuario,empresa);

@override
String toString() {
  return 'User.notLoggedEquipe(usuario: $usuario, nmUsuario: $nmUsuario, empresa: $empresa)';
}


}

/// @nodoc
abstract mixin class $NotLoggedEquipeCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $NotLoggedEquipeCopyWith(NotLoggedEquipe value, $Res Function(NotLoggedEquipe) _then) = _$NotLoggedEquipeCopyWithImpl;
@override @useResult
$Res call({
 String usuario, String nmUsuario, double? empresa
});




}
/// @nodoc
class _$NotLoggedEquipeCopyWithImpl<$Res>
    implements $NotLoggedEquipeCopyWith<$Res> {
  _$NotLoggedEquipeCopyWithImpl(this._self, this._then);

  final NotLoggedEquipe _self;
  final $Res Function(NotLoggedEquipe) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usuario = null,Object? nmUsuario = null,Object? empresa = freezed,}) {
  return _then(NotLoggedEquipe(
usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as String,nmUsuario: null == nmUsuario ? _self.nmUsuario : nmUsuario // ignore: cast_nullable_to_non_nullable
as String,empresa: freezed == empresa ? _self.empresa : empresa // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class LoggedEquipe extends User {
  const LoggedEquipe({required this.usuario, this.nmUsuario = 'Usuário', required this.empresa, required this.token, final  String? $type}): $type = $type ?? 'loggedEquipe',super._();
  factory LoggedEquipe.fromJson(Map<String, dynamic> json) => _$LoggedEquipeFromJson(json);

@override final  String usuario;
@override@JsonKey() final  String nmUsuario;
 final  double empresa;
 final  String token;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedEquipeCopyWith<LoggedEquipe> get copyWith => _$LoggedEquipeCopyWithImpl<LoggedEquipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoggedEquipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedEquipe&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nmUsuario, nmUsuario) || other.nmUsuario == nmUsuario)&&(identical(other.empresa, empresa) || other.empresa == empresa)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usuario,nmUsuario,empresa,token);

@override
String toString() {
  return 'User.loggedEquipe(usuario: $usuario, nmUsuario: $nmUsuario, empresa: $empresa, token: $token)';
}


}

/// @nodoc
abstract mixin class $LoggedEquipeCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $LoggedEquipeCopyWith(LoggedEquipe value, $Res Function(LoggedEquipe) _then) = _$LoggedEquipeCopyWithImpl;
@override @useResult
$Res call({
 String usuario, String nmUsuario, double empresa, String token
});




}
/// @nodoc
class _$LoggedEquipeCopyWithImpl<$Res>
    implements $LoggedEquipeCopyWith<$Res> {
  _$LoggedEquipeCopyWithImpl(this._self, this._then);

  final LoggedEquipe _self;
  final $Res Function(LoggedEquipe) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usuario = null,Object? nmUsuario = null,Object? empresa = null,Object? token = null,}) {
  return _then(LoggedEquipe(
usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as String,nmUsuario: null == nmUsuario ? _self.nmUsuario : nmUsuario // ignore: cast_nullable_to_non_nullable
as String,empresa: null == empresa ? _self.empresa : empresa // ignore: cast_nullable_to_non_nullable
as double,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
