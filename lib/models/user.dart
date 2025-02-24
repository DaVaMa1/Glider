import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required int created,
    required int karma,
    String? about,
    @Default(<int>[]) Iterable<int> submitted,
    @Default(false) bool cache,
  }) = _User;

  User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  late final String createdDate = Jiffy.unix(created).yMMMMd;
}
