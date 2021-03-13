import 'package:flutter/material.dart';

class StackClip extends StatefulWidget {
  final Widget foregroundWidget;
  final Widget backgroundWidget;
  final double scrollOffset;

  StackClip({
    Key key,
    @required this.backgroundWidget,
    @required this.foregroundWidget,
    @required this.scrollOffset,
  }) : super(key: key);

  @override
  _StackClipState createState() => _StackClipState();
}

class _StackClipState extends State<StackClip> {
  double _offset;

  @override
  void initState() {
    super.initState();
    _offset = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    _offset = widget.scrollOffset;
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        widget.backgroundWidget,
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
    @required this.offset,
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
