import 'package:flutter/material.dart';

import '../common.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.actions,
  });
  final String? title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefaultText(
        title ?? '',
        color: AppColors.blackColor,
      ),
      elevation: 1,
      backgroundColor: AppColors.backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
