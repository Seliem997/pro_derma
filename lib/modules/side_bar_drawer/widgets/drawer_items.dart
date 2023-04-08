import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({
    Key? key,
    required this.itemIcon,
    required this.itemTextName,
    required this.onTap
  }) : super(key: key);

  final IconData itemIcon;
  final String itemTextName;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(itemIcon),
          horizontalSpace(2),
          Text(
            itemTextName,
            style: Theme.of(context).textTheme.subtitle1
          ),
        ],
      ),
    );
  }
}
