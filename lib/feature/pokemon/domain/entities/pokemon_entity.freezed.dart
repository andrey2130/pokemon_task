// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonEntity {

 int get id; String get name; String get imageUrl; String get silhouetteUrl; List<String> get types; PokemonStatsEntity get stats;
/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonEntityCopyWith<PokemonEntity> get copyWith => _$PokemonEntityCopyWithImpl<PokemonEntity>(this as PokemonEntity, _$identity);

  /// Serializes this PokemonEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.silhouetteUrl, silhouetteUrl) || other.silhouetteUrl == silhouetteUrl)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,silhouetteUrl,const DeepCollectionEquality().hash(types),stats);

@override
String toString() {
  return 'PokemonEntity(id: $id, name: $name, imageUrl: $imageUrl, silhouetteUrl: $silhouetteUrl, types: $types, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $PokemonEntityCopyWith<$Res>  {
  factory $PokemonEntityCopyWith(PokemonEntity value, $Res Function(PokemonEntity) _then) = _$PokemonEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String imageUrl, String silhouetteUrl, List<String> types, PokemonStatsEntity stats
});


$PokemonStatsEntityCopyWith<$Res> get stats;

}
/// @nodoc
class _$PokemonEntityCopyWithImpl<$Res>
    implements $PokemonEntityCopyWith<$Res> {
  _$PokemonEntityCopyWithImpl(this._self, this._then);

  final PokemonEntity _self;
  final $Res Function(PokemonEntity) _then;

/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? silhouetteUrl = null,Object? types = null,Object? stats = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,silhouetteUrl: null == silhouetteUrl ? _self.silhouetteUrl : silhouetteUrl // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PokemonStatsEntity,
  ));
}
/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonStatsEntityCopyWith<$Res> get stats {
  
  return $PokemonStatsEntityCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PokemonEntity implements PokemonEntity {
  const _PokemonEntity({required this.id, required this.name, required this.imageUrl, required this.silhouetteUrl, required final  List<String> types, required this.stats}): _types = types;
  factory _PokemonEntity.fromJson(Map<String, dynamic> json) => _$PokemonEntityFromJson(json);

@override final  int id;
@override final  String name;
@override final  String imageUrl;
@override final  String silhouetteUrl;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override final  PokemonStatsEntity stats;

/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonEntityCopyWith<_PokemonEntity> get copyWith => __$PokemonEntityCopyWithImpl<_PokemonEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.silhouetteUrl, silhouetteUrl) || other.silhouetteUrl == silhouetteUrl)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,silhouetteUrl,const DeepCollectionEquality().hash(_types),stats);

@override
String toString() {
  return 'PokemonEntity(id: $id, name: $name, imageUrl: $imageUrl, silhouetteUrl: $silhouetteUrl, types: $types, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$PokemonEntityCopyWith<$Res> implements $PokemonEntityCopyWith<$Res> {
  factory _$PokemonEntityCopyWith(_PokemonEntity value, $Res Function(_PokemonEntity) _then) = __$PokemonEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String imageUrl, String silhouetteUrl, List<String> types, PokemonStatsEntity stats
});


@override $PokemonStatsEntityCopyWith<$Res> get stats;

}
/// @nodoc
class __$PokemonEntityCopyWithImpl<$Res>
    implements _$PokemonEntityCopyWith<$Res> {
  __$PokemonEntityCopyWithImpl(this._self, this._then);

  final _PokemonEntity _self;
  final $Res Function(_PokemonEntity) _then;

/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? silhouetteUrl = null,Object? types = null,Object? stats = null,}) {
  return _then(_PokemonEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,silhouetteUrl: null == silhouetteUrl ? _self.silhouetteUrl : silhouetteUrl // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PokemonStatsEntity,
  ));
}

/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonStatsEntityCopyWith<$Res> get stats {
  
  return $PokemonStatsEntityCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$PokemonStatsEntity {

 int get hp; int get attack; int get defense; int get specialAttack; int get specialDefense; int get speed;
/// Create a copy of PokemonStatsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonStatsEntityCopyWith<PokemonStatsEntity> get copyWith => _$PokemonStatsEntityCopyWithImpl<PokemonStatsEntity>(this as PokemonStatsEntity, _$identity);

  /// Serializes this PokemonStatsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonStatsEntity&&(identical(other.hp, hp) || other.hp == hp)&&(identical(other.attack, attack) || other.attack == attack)&&(identical(other.defense, defense) || other.defense == defense)&&(identical(other.specialAttack, specialAttack) || other.specialAttack == specialAttack)&&(identical(other.specialDefense, specialDefense) || other.specialDefense == specialDefense)&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hp,attack,defense,specialAttack,specialDefense,speed);

@override
String toString() {
  return 'PokemonStatsEntity(hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
}


}

/// @nodoc
abstract mixin class $PokemonStatsEntityCopyWith<$Res>  {
  factory $PokemonStatsEntityCopyWith(PokemonStatsEntity value, $Res Function(PokemonStatsEntity) _then) = _$PokemonStatsEntityCopyWithImpl;
@useResult
$Res call({
 int hp, int attack, int defense, int specialAttack, int specialDefense, int speed
});




}
/// @nodoc
class _$PokemonStatsEntityCopyWithImpl<$Res>
    implements $PokemonStatsEntityCopyWith<$Res> {
  _$PokemonStatsEntityCopyWithImpl(this._self, this._then);

  final PokemonStatsEntity _self;
  final $Res Function(PokemonStatsEntity) _then;

/// Create a copy of PokemonStatsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hp = null,Object? attack = null,Object? defense = null,Object? specialAttack = null,Object? specialDefense = null,Object? speed = null,}) {
  return _then(_self.copyWith(
hp: null == hp ? _self.hp : hp // ignore: cast_nullable_to_non_nullable
as int,attack: null == attack ? _self.attack : attack // ignore: cast_nullable_to_non_nullable
as int,defense: null == defense ? _self.defense : defense // ignore: cast_nullable_to_non_nullable
as int,specialAttack: null == specialAttack ? _self.specialAttack : specialAttack // ignore: cast_nullable_to_non_nullable
as int,specialDefense: null == specialDefense ? _self.specialDefense : specialDefense // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PokemonStatsEntity implements PokemonStatsEntity {
  const _PokemonStatsEntity({required this.hp, required this.attack, required this.defense, required this.specialAttack, required this.specialDefense, required this.speed});
  factory _PokemonStatsEntity.fromJson(Map<String, dynamic> json) => _$PokemonStatsEntityFromJson(json);

@override final  int hp;
@override final  int attack;
@override final  int defense;
@override final  int specialAttack;
@override final  int specialDefense;
@override final  int speed;

/// Create a copy of PokemonStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonStatsEntityCopyWith<_PokemonStatsEntity> get copyWith => __$PokemonStatsEntityCopyWithImpl<_PokemonStatsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonStatsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonStatsEntity&&(identical(other.hp, hp) || other.hp == hp)&&(identical(other.attack, attack) || other.attack == attack)&&(identical(other.defense, defense) || other.defense == defense)&&(identical(other.specialAttack, specialAttack) || other.specialAttack == specialAttack)&&(identical(other.specialDefense, specialDefense) || other.specialDefense == specialDefense)&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hp,attack,defense,specialAttack,specialDefense,speed);

@override
String toString() {
  return 'PokemonStatsEntity(hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
}


}

/// @nodoc
abstract mixin class _$PokemonStatsEntityCopyWith<$Res> implements $PokemonStatsEntityCopyWith<$Res> {
  factory _$PokemonStatsEntityCopyWith(_PokemonStatsEntity value, $Res Function(_PokemonStatsEntity) _then) = __$PokemonStatsEntityCopyWithImpl;
@override @useResult
$Res call({
 int hp, int attack, int defense, int specialAttack, int specialDefense, int speed
});




}
/// @nodoc
class __$PokemonStatsEntityCopyWithImpl<$Res>
    implements _$PokemonStatsEntityCopyWith<$Res> {
  __$PokemonStatsEntityCopyWithImpl(this._self, this._then);

  final _PokemonStatsEntity _self;
  final $Res Function(_PokemonStatsEntity) _then;

/// Create a copy of PokemonStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hp = null,Object? attack = null,Object? defense = null,Object? specialAttack = null,Object? specialDefense = null,Object? speed = null,}) {
  return _then(_PokemonStatsEntity(
hp: null == hp ? _self.hp : hp // ignore: cast_nullable_to_non_nullable
as int,attack: null == attack ? _self.attack : attack // ignore: cast_nullable_to_non_nullable
as int,defense: null == defense ? _self.defense : defense // ignore: cast_nullable_to_non_nullable
as int,specialAttack: null == specialAttack ? _self.specialAttack : specialAttack // ignore: cast_nullable_to_non_nullable
as int,specialDefense: null == specialDefense ? _self.specialDefense : specialDefense // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
