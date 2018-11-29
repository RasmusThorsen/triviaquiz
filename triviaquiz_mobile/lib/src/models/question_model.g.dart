// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
      id: json['id'] as String,
      value: json['value'] as String,
      correctAnswer: json['correctAnswer'] as String,
      difficulty:
          _$enumDecodeNullable(_$QuestionDifficultyEnumMap, json['difficulty']),
      incorrectAnswers:
          (json['incorrectAnswers'] as List)?.map((e) => e as String)?.toList(),
      type: _$enumDecodeNullable(_$QuestionTypeEnumMap, json['type']));
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'correctAnswer': instance.correctAnswer,
      'incorrectAnswers': instance.incorrectAnswers,
      'type': _$QuestionTypeEnumMap[instance.type],
      'difficulty': _$QuestionDifficultyEnumMap[instance.difficulty]
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$QuestionDifficultyEnumMap = <QuestionDifficulty, dynamic>{
  QuestionDifficulty.easy: 0,
  QuestionDifficulty.medium: 1,
  QuestionDifficulty.hard: 2
};

const _$QuestionTypeEnumMap = <QuestionType, dynamic>{
  QuestionType.boolean: 0,
  QuestionType.multiple: 1
};
