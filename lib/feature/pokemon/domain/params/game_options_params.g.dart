// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_options_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameOptionsParams _$GameOptionsParamsFromJson(Map<String, dynamic> json) =>
    _GameOptionsParams(
      optionsCount: (json['optionsCount'] as num?)?.toInt() ?? 4,
      timerSeconds: (json['timerSeconds'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$GameOptionsParamsToJson(_GameOptionsParams instance) =>
    <String, dynamic>{
      'optionsCount': instance.optionsCount,
      'timerSeconds': instance.timerSeconds,
    };
