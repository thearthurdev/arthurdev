import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';

class CustomScrollbar extends StatefulWidget {
  const CustomScrollbar({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  _CustomScrollbarState createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<CustomScrollbar> {
  double maxScrollExtent;
  double screenHeight;
  double scrollbarHandleOffset;
  double scrollbarHandleLength;
  double scrollbarTrackExtent;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(handleScrolling);
    scrollbarHandleOffset = 0.0;
    scrollbarHandleLength = 80.0;
    scrollbarTrackExtent = 0.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = kScreenHeight(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      maxScrollExtent = widget.scrollController.position.maxScrollExtent;
      getScrollbarHandleLength();
    });
  }

  void getScrollbarHandleLength() {
    final double fractionVisible =
        (widget.scrollController.position.extentInside / maxScrollExtent)
            .clamp(0.0, 1.0);

    final double handleExtent = math.max(
      math.min(screenHeight, 8.0),
      screenHeight * fractionVisible,
    );

    scrollbarHandleLength = handleExtent.clamp(24.0, 80.0);

    scrollbarTrackExtent = screenHeight - (scrollbarHandleLength + 16.0);
  }

  void handleScrolling() {
    setState(() => scrollbarHandleOffset = scrollbarTrackExtent *
        widget.scrollController.position.extentBefore /
        maxScrollExtent);
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: kShortDuration,
      opacity: scrollbarHandleOffset < 60.0 ? 0.0 : 1.0,
      child: Listener(
        onPointerSignal: (pointerSignal) =>
            handleWheelScrollEvents(pointerSignal),
        child: Stack(
          children: [
            scrollbarTrack(),
            scrollbarHandle(),
          ],
        ),
      ),
    );
  }

  Widget scrollbarTrack() {
    return GestureDetector(
      child: Container(
        height: kScreenHeight(context),
        width: 16.0,
        color: kIsDesktop(context)
            ? Colors.black.withOpacity(0.06)
            : Colors.transparent,
        margin: EdgeInsets.only(left: kScreenWidth(context) - 16.0),
        alignment: Alignment.centerRight,
      ),
      onTapUp: (tapUpDetails) => handleTapEvents(tapUpDetails),
    );
  }

  Widget scrollbarHandle() {
    return AnimatedPositioned(
      duration: kVeryShortDuration,
      top: scrollbarHandleOffset,
      right: 5.0,
      child: GestureDetector(
        onVerticalDragUpdate: (dragDetails) => handleDragEvents(dragDetails),
        child: Container(
          height: scrollbarHandleLength,
          width: 6.0,
          margin: EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: kAccentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
          ),
        ),
      ),
    );
  }

  void handleDragEvents(DragUpdateDetails dragDetails) {
    double position = dragDetails.globalPosition.dy;
    widget.scrollController.position
        .moveTo(position * maxScrollExtent / screenHeight);
  }

  void handleTapEvents(TapUpDetails tapUpDetails) {
    double tapPosition = tapUpDetails.globalPosition.dy;
    widget.scrollController.position
        .moveTo(tapPosition * maxScrollExtent / screenHeight);
  }

  void handleWheelScrollEvents(PointerSignalEvent pointerSignal) {
    if (pointerSignal is PointerScrollEvent) {
      double scrollDirection = pointerSignal.scrollDelta.direction;
      double scrollDelta = 32.0;

      if (scrollDirection > 0) {
        widget.scrollController.position.moveTo(
          widget.scrollController.position.extentBefore +
              (scrollDelta * (maxScrollExtent / screenHeight)),
        );
      } else {
        widget.scrollController.position.moveTo(
          widget.scrollController.position.extentBefore -
              (scrollDelta * (maxScrollExtent / screenHeight)),
        );
      }
    }
  }
}
