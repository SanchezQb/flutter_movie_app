import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 10.0,
        ),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              ),
              child: Icon(Icons.chevron_left, size: 40.0)),
        ),
      ),
    );
  }
}
