import 'package:flutter/material.dart';

class StackClip extends StatefulWidget {
  final Widget foregroundWidget;
  final Widget backgroundWidget;
  final double scrollOffset;

  StackClip({
    
    required this.backgroundWidget,
    required this.foregroundWidget,
    required this.scrollOffset,
  }) ;

  @override
  _StackClipState createState() => _StackClipState();
}

class _StackClipState extends State<StackClip> {
  late double _offset;
  late double _overlayOpacity;

  @override
  void initState() {
    super.initState();
    _offset = 0.0;
    _overlayOpacity = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    _offset = widget.scrollOffset;
    _overlayOpacity = ((_offset / 100) * 0.05).clamp(0.0, 0.3);

    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        Stack(
          fit: StackFit.expand,
          children: [
            widget.backgroundWidget,
            IgnorePointer(
              child: Container(
                color: Colors.black.withOpacity(_overlayOpacity),
              ),
            ),
          ],
        ),
        ClipPath(
          child: widget.foregroundWidget,
          clipper: _StackClipper(
            offset: _offset,
          ),
        ),
      ],
    );
  }
}

class _StackClipper extends CustomClipper<Path> {
  final double offset;
  _StackClipper({
    required this.offset,
  });
  @override
  Path getClip(Size size) {
    final path = new Path();

    path.addRect(
      Rect.fromLTWH(0, 0, size.width, offset),
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
