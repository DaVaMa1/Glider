import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glider/models/item_type.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:jiffy/jiffy.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    required int id,
    bool? deleted,
    ItemType? type,
    String? by,
    int? time,
    String? text,
    bool? dead,
    int? parent,
    int? poll,
    @Default(<int>[]) Iterable<int> kids,
    String? url,
    int? score,
    String? title,
    @Default(<int>[]) Iterable<int> parts,
    int? descendants,
    @Default(<int>[]) Iterable<int> ancestors,
    @Default(false) bool cache,
  }) = _Item;

  Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  static final RegExp _videoRegExp = RegExp(r'\s+\[video\]$');
  static final RegExp _pdfRegExp = RegExp(r'\s+\[pdf\]$');
  static final RegExp _yearRegExp = RegExp(r'\s+\((\d+)\)');

  late final String? formattedTitle = title != null
      ? HtmlUnescape().convert(title!
          .replaceAll(_videoRegExp, '')
          .replaceAll(_pdfRegExp, '')
          .replaceAll(_yearRegExp, ''))
      : null;

  late final String? urlHost = url != null ? Uri.parse(url!).host : null;

  late final String? timeAgo =
      time != null ? Jiffy.unix(time!).fromNow() : null;

  late final String? thumbnailUrl =
      localOnly ? null : 'https://drcs9k8uelb9s.cloudfront.net/$id.png';

  late final bool localOnly = id < 0;

  late final bool hasVideo = title != null && _videoRegExp.hasMatch(title!);

  late final bool hasPdf = title != null && _pdfRegExp.hasMatch(title!);

  late final bool hasOriginalYear =
      title != null && _yearRegExp.hasMatch(title!);

  late final String? originalYear =
      title != null ? _yearRegExp.firstMatch(title!)?.group(1) : null;

  Item addKid(int kidId) => copyWith(kids: <int>[kidId, ...kids]);

  Item incrementDescendants() =>
      copyWith(descendants: descendants != null ? descendants! + 1 : null);
}
