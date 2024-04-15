import '../flipcard/flip_card.dart';
import '../flipcard/gesture_flip_card.dart';

///This controller used to call Fliping
class FlipCardController {
  FlipCardState? state;

  /// Flip the card
  Future flipcard() async => state?.flipcard();
}

class GestureFlipCardController {
  FlipCardState1? state;

  /// Flip the card
  Future flipcard() async => state?.gestureflipCard();
}
