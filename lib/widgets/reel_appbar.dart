import 'package:flutter/material.dart';

import '../reel_nepal_colors.dart';

class ReelAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final bool centerTitle;

  const ReelAppBar({
    Key key,
    this.title,
    this.actions = const [],
    this.automaticallyImplyLeading = true,
    this.centerTitle,
    this.leading,
  }) : super(key: key);

  bool _getEffectiveCenterTitle(ThemeData themeData) {
    if (centerTitle != null) return centerTitle;
    assert(themeData.platform != null);
    switch (themeData.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
        return actions == null || actions.length < 2;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    /*Widget leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      } else {
        if (canPop)
          leading = useCloseButton ? const CloseButton() : const BackButton();
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
        child: leading,
      );
    }*/
    return Material(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ReelNepalColors.reelnepal,
            ReelNepalColors.reelnepal[50],
          ]),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.0),
            Center(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme?.title,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                child: Semantics(
                  child: title,
                  header: true,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
