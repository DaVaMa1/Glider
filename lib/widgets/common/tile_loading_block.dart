import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TileLoadingBlock extends StatelessWidget {
  const TileLoadingBlock({Key? key, this.width, this.height, this.color})
      : super(key: key);

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color ??
            (kIsWeb ? Theme.of(context).colorScheme.surface : Colors.white),
      ),
    );
  }
}
