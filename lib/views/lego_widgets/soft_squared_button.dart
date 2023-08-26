import 'package:flutter/material.dart';

class SoftSquaredButton extends StatelessWidget {
  final Color bgColor;
  final Function onPressed;
  final Widget child;
  final double width;
  final double height;

  const SoftSquaredButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.bgColor = const Color(0xFFFFFFFF),
      this.width = 24,
      this.height = 24});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Center(child: child),
        ),
      ),
    );
  }
}
