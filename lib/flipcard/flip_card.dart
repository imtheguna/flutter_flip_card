import 'package:flutter/material.dart';
import '../modal/flip_side.dart';
import '../controllers/flip_card_controllers.dart';
import 'dart:math';

/// [FlipCard] A component that provides a flip card animation

class FlipCard extends StatefulWidget {
  /// [controller] used to ccontrol the flip
  final FlipCardController controller;

  ///[frontWidget] The Front side widget of the card
  final Widget frontWidget;

  ///[backWidget] The Back side widget of the card
  final Widget backWidget;

  /// [onTapFlipping]  When enabled, the card will flip automatically when touched.
  final bool onTapFlipping;

  /// [axis] The flip axis [Horizontal] and [Vertical]
  final FlipAxis axis;

  /// [rotateSide] The card rotate side
  final RotateSide rotateSide;

  /// [animationDuration] The amount of milliseconds a turn animation will take.
  final Duration animationDuration;

  /// [disableSplashEffect] The option for disable Inkwell widget's splash effect.
  final bool disableSplashEffect;

  /// [splashColor] The option for Inkwell widget's splashColor.
  final Color? splashColor;

  /// [focusColor] The option for Inkwell widget's focusColor.
  final Color? focusColor;

  const FlipCard({
    Key? key,
    this.focusColor,
    this.splashColor,
    this.onTapFlipping = false,
    this.disableSplashEffect = false,
    required this.frontWidget,
    required this.backWidget,
    required this.controller,
    this.axis = FlipAxis.vertical,
    required this.rotateSide,
    this.animationDuration = const Duration(milliseconds: 800),
  }) : super(key: key);

  @override
  FlipCardState createState() => FlipCardState();
}

class FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late AnimationController animationController;
  final flipCardController = FlipCardController();
  bool isFront = true;
  double anglePlus = 0;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: widget.animationDuration, vsync: this);
    widget.controller.state = this;
    flipCardController.state = this;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  ///Flip the card
  Future flipCard() async {
    if (animationController.isAnimating) return;
    isFront = !isFront;
    await animationController.forward(from: 0).then((value) => anglePlus = pi);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        double piValue = 0.0;
        if (widget.rotateSide == RotateSide.top ||
            widget.rotateSide == RotateSide.left) {
          piValue = pi;
        } else {
          piValue = -pi;
        }
        double angle = animationController.value * piValue;
        late Matrix4 transform;
        late Matrix4 transformForBack;
        if (isFront) angle += anglePlus;
        if (widget.axis == FlipAxis.horizontal) {
          transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(angle);
          transformForBack = Matrix4.identity()..rotateX(pi);
        } else {
          transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);
          transformForBack = Matrix4.identity()..rotateY(pi);
        }

        return InkWell(
          onTap: widget.onTapFlipping == false
              ? null
              : () {
                  flipCardController.state!.flipCard();
                },
          splashColor: widget.splashColor,
          focusColor: widget.focusColor,
          overlayColor: widget.disableSplashEffect
              ? null
              : MaterialStateProperty.all(Colors.transparent),
          child: Transform(
              alignment: Alignment.center,
              transform: transform,
              child: isFrontWidget(angle.abs())
                  ? widget.frontWidget
                  : Transform(
                      transform: transformForBack,
                      alignment: Alignment.center,
                      child: widget.backWidget,
                    )),
        );
      });

  bool isFrontWidget(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;
    return angle <= degrees90 || angle >= degrees270;
  }
}
