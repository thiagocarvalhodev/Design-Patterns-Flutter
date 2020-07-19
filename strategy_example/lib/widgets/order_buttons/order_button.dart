import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:strategy_example/widgets/platform_button.dart';

class OrderButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPressed;

  const OrderButton({
    @required this.iconData,
    @required this.title,
    @required this.onPressed,
  })  : assert(iconData != null),
        assert(title != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return PlatformButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
      materialColor: Colors.black,
      materialTextColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
