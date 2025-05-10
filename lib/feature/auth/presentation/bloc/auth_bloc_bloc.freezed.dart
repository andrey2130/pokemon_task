// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthBlocEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBlocEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocEvent()';
}


}

/// @nodoc
class $AuthBlocEventCopyWith<$Res>  {
$AuthBlocEventCopyWith(AuthBlocEvent _, $Res Function(AuthBlocEvent) __);
}


/// @nodoc


class InitializeAuthState implements AuthBlocEvent {
  const InitializeAuthState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeAuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocEvent.initializeAuthState()';
}


}




/// @nodoc


class Register implements AuthBlocEvent {
  const Register(this.params);
  

 final  RegisterParams params;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterCopyWith<Register> get copyWith => _$RegisterCopyWithImpl<Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Register&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthBlocEvent.register(params: $params)';
}


}

/// @nodoc
abstract mixin class $RegisterCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) _then) = _$RegisterCopyWithImpl;
@useResult
$Res call({
 RegisterParams params
});


$RegisterParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$RegisterCopyWithImpl<$Res>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._self, this._then);

  final Register _self;
  final $Res Function(Register) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(Register(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as RegisterParams,
  ));
}

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterParamsCopyWith<$Res> get params {
  
  return $RegisterParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class SignIn implements AuthBlocEvent {
  const SignIn(this.params);
  

 final  LoginParams params;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInCopyWith<SignIn> get copyWith => _$SignInCopyWithImpl<SignIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignIn&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthBlocEvent.signIn(params: $params)';
}


}

/// @nodoc
abstract mixin class $SignInCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $SignInCopyWith(SignIn value, $Res Function(SignIn) _then) = _$SignInCopyWithImpl;
@useResult
$Res call({
 LoginParams params
});


$LoginParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$SignInCopyWithImpl<$Res>
    implements $SignInCopyWith<$Res> {
  _$SignInCopyWithImpl(this._self, this._then);

  final SignIn _self;
  final $Res Function(SignIn) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(SignIn(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as LoginParams,
  ));
}

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginParamsCopyWith<$Res> get params {
  
  return $LoginParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class SignOut implements AuthBlocEvent {
  const SignOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocEvent.signOut()';
}


}




/// @nodoc
mixin _$AuthBlocState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBlocState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState()';
}


}

/// @nodoc
class $AuthBlocStateCopyWith<$Res>  {
$AuthBlocStateCopyWith(AuthBlocState _, $Res Function(AuthBlocState) __);
}


/// @nodoc


class Initial implements AuthBlocState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.initial()';
}


}




/// @nodoc


class Loading implements AuthBlocState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.loading()';
}


}




/// @nodoc


class Authenticated implements AuthBlocState {
  const Authenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.authenticated()';
}


}




/// @nodoc


class Unauthenticated implements AuthBlocState {
  const Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.unauthenticated()';
}


}




/// @nodoc


class Failure implements AuthBlocState {
  const Failure({required this.message});
  

 final  String message;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthBlocState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $AuthBlocStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
