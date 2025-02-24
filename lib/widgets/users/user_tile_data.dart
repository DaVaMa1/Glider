import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:glider/models/user.dart';
import 'package:glider/widgets/common/decorated_html.dart';
import 'package:glider/widgets/common/metadata_item.dart';
import 'package:glider/widgets/users/user_bottom_sheet.dart';

class UserTileData extends StatelessWidget {
  const UserTileData(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onLongPress: () => _buildModalBottomSheet(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                MetadataItem(
                  icon: FluentIcons.arrow_up_24_regular,
                  text: user.karma.toString(),
                ),
                MetadataItem(
                  icon: FluentIcons.comment_24_regular,
                  text: user.submitted.length.toString(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Text(
                    user.id,
                    style: textTheme.caption?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const SizedBox(width: 8),
                const Spacer(),
                Text(
                  'since ${user.createdDate}',
                  style: textTheme.caption,
                ),
              ],
            ),
            if (user.about != null) ...<Widget>[
              const SizedBox(height: 12),
              DecoratedHtml(user.about!),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _buildModalBottomSheet(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      builder: (_) => UserBottomSheet(user),
    );
  }
}
