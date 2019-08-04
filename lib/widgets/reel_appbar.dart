import 'package:flutter/material.dart';

import '../reel_nepal_colors.dart';

class ReelAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;

  const ReelAppBar({
    Key key,
    this.title,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
