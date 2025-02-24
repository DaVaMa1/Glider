import 'package:flutter/material.dart';
import 'package:glider/models/slidable_action.dart';

class Slidable extends StatelessWidget {
  const Slidable({
    required Key key,
    this.startToEndAction,
    this.endToStartAction,
    this.onDismiss,
    required this.child,
  }) : super(key: key);

  static const Duration movementDuration = Duration(milliseconds: 200);

  final Widget child;
  final SlidableAction? startToEndAction;
  final SlidableAction? endToStartAction;
  final DismissDirectionCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    if (startToEndAction == null && endToStartAction == null) {
      return child;
    }

    return Dismissible(
      key: key!,
      background: _buildBackground(startToEndAction, Alignment.centerLeft),
      secondaryBackground:
          _buildBackground(endToStartAction, Alignment.centerRight),
      direction: startToEndAction != null
          ? endToStartAction != null
              ? DismissDirection.horizontal
              : DismissDirection.startToEnd
          : DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        switch (direction) {
          case DismissDirection.startToEnd:
            return startToEndAction?.action();
          case DismissDirection.endToStart:
            return endToStartAction?.action();
          case DismissDirection.horizontal:
          case DismissDirection.vertical:
          case DismissDirection.up:
          case DismissDirection.down:
          case DismissDirection.none:
            assert(false, 'Direction $direction is not supported');
            return null;
        }
      },
      onDismissed: onDismiss,
      // ignore: avoid_redundant_argument_values
      movementDuration: movementDuration,
      child: child,
    );
  }

  Widget _buildBackground(SlidableAction? action, Alignment alignment) {
    if (action != null) {
      return Container(
        color: action.color,
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Icon(action.icon, color: action.iconColor),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
