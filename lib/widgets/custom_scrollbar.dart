import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
  double scrollbarHandleExtent;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(handleScrolling);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = kScreenHeight(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      maxScrollExtent = widget.scrollController.position.maxScrollExtent;
      getscrollbarHandleExtent().whenComplete(() => setState(() {}));
    });
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  Future<void> getscrollbarHandleExtent() async {
    final double visibleViewRatio = maxScrollExtent / screenHeight;

    final double handleExtent = (1 / visibleViewRatio) * screenHeight;

    scrollbarHandleExtent = handleExtent.clamp(24.0, screenHeight);
  }

  void handleScrolling() {
    final double scrollExtentBefore =
        widget.scrollController.position.extentBefore;

    final double scrollbarTrackExtent =
        screenHeight - (scrollbarHandleExtent + 16.0);

    setState(() => scrollbarHandleOffset =
        (scrollbarTrackExtent / maxScrollExtent) * scrollExtentBefore);
  }

  void handleWheelScrollEvents(PointerSignalEvent pointerSignal) {
    final double scrollExtentBefore =
        widget.scrollController.position.extentBefore;

    if (pointerSignal is PointerScrollEvent) {
      double scrollDirection = pointerSignal.scrollDelta.direction;
      double scrollDelta = 32.0;

      if (scrollDirection > 0) {
        widget.scrollController.position.moveTo(
          scrollExtentBefore + (scrollDelta * (maxScrollExtent / screenHeight)),
        );
      } else {
        widget.scrollController.position.moveTo(
          scrollExtentBefore - (scrollDelta * (maxScrollExtent / screenHeight)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) =>
          handleWheelScrollEvents(pointerSignal),
      child: Stack(
        children: [
          ScrollbarTrack(
            scrollController: widget.scrollController,
            maxScrollExtent: maxScrollExtent,
            screenHeight: screenHeight,
          ),
          ScrollbarHandle(
            scrollController: widget.scrollController,
            scrollbarHandleOffset: scrollbarHandleOffset,
            scrollbarHandleExtent: scrollbarHandleExtent,
            maxScrollExtent: maxScrollExtent,
            screenHeight: screenHeight,
          ),
        ],
      ),
    );
  }
}

class ScrollbarTrack extends StatelessWidget {
  const ScrollbarTrack({
    Key key,
    this.scrollController,
    this.maxScrollExtent,
    this.screenHeight,
  }) : super(key: key);

  final ScrollController scrollController;
  final double maxScrollExtent;
  final double screenHeight;

  void handleTapEvents(TapUpDetails tapUpDetails) {
    double tapPosition = tapUpDetails.globalPosition.dy;
    scrollController.position
        .moveTo(tapPosition * maxScrollExtent / screenHeight);
  }

  @override
  Widget build(BuildContext context) {
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
}

class ScrollbarHandle extends StatelessWidget {
  const ScrollbarHandle({
    Key key,
    this.scrollController,
    this.scrollbarHandleOffset,
    this.scrollbarHandleExtent,
    this.maxScrollExtent,
    this.screenHeight,
  }) : super(key: key);

  final ScrollController scrollController;
  final double scrollbarHandleOffset;
  final double scrollbarHandleExtent;
  final double maxScrollExtent;
  final double screenHeight;

  void handleDragEvents(DragUpdateDetails dragDetails) {
    double position = dragDetails.globalPosition.dy;
    scrollController.position.moveTo(position * maxScrollExtent / screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: kVeryShortDuration,
      top: scrollbarHandleOffset,
      right: 5.0,
      child: GestureDetector(
        onVerticalDragUpdate: (dragDetails) => handleDragEvents(dragDetails),
        child: Container(
          height: scrollbarHandleExtent,
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
}
