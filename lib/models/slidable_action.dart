import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'slidable_action.freezed.dart';

@freezed
class SlidableAction with _$SlidableAction {
  factory SlidableAction({
    required Future<bool?> Function() action,
    required IconData icon,
    Color? color,
    Color? iconColor,
  }) = _SlidableAction;
}
