import 'package:assesmentmanushtech/core/constants/assets.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPressed; // Add a callback for the button press
  final List<Widget>? actions;
  const CommonAppBar({
    super.key,
    required this.title,
    required this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: onBackPressed,
        child: Transform.scale(
          scale: 0.6,
          child: Image.asset(
            Assets.iconsBack,
            fit: BoxFit.contain,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
