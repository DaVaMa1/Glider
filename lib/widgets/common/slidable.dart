import 'package:flutter/material.dart';
import 'package:glider/models/slidable_action.dart';

class Slidable extends StatelessWidget {
  const Slidable({
    @required Key key,
    this.enabled = true,
    this.startToEndAction,
    this.endToStartAction,
    this.child,
  })  : assert(startToEndAction != null || endToStartAction != null,
            'Must provide either a startToEndAction or an endToStartAction'),
        super(key: key);

  final Widget child;
  final bool enabled;
  final SlidableAction startToEndAction;
  final SlidableAction endToStartAction;

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }

    return Dismissible(
      key: key,
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
            startToEndAction.action?.call();
            break;
          case DismissDirection.endToStart:
            endToStartAction.action?.call();
            break;
          case DismissDirection.horizontal:
          case DismissDirection.vertical:
          case DismissDirection.up:
          case DismissDirection.down:
            assert(false, 'Direction $direction is not supported');
        }

        return null;
      },
      resizeDuration: null,
      child: child,
    );
  }

  Widget _buildBackground(SlidableAction action, Alignment alignment) {
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
