## flutter_flip_card

A widget that does transition between two children in a flipping manner.

FlipCard             |  GestureFlipCard
:-------------------------:|:-------------------------:
![FlipCard](https://user-images.githubusercontent.com/58139175/137616437-89cbfdba-7de2-4d5f-9a4f-28309dc71202.gif) | ![GestureFlipCard](https://user-images.githubusercontent.com/58139175/137616522-20dc43c4-0cab-4ced-a948-91d50c9ccda6.gif)


## How to Use 

To use flutter_flip_card, first start by importing the package.
```dart
import 'package:flutter_flip_card/flutter_flip_card.dart';
```
## Currently Available Methods
- `FlipCard` A component that provides a flip card animation
</br>

- `GestureFlipCard` A component that provides a gsture(Swipe) flip card animation
</br>

## FlipCard

```dart
    FlipCard(
        rotateSide: RotateSide.bottom,
        onTapFlipping: false, //When enabled, the card will flip automatically when touched.
        axis: FlipAxis.horizontal,
        controller: con1,
        frontWidget: Center(
        child: Container(
            height: 200,
            width: 140,
            child: Image.asset(
                    'image/01.png',
                    fit: BoxFit.fitHeight)
                )
            ),
        backWidget: Container(
            height: 200,
            width: 140,
            child: Image.asset(
                    `'image/02.jpg',
                    fit: BoxFit.fitHeight)
            )
        )
        
    final controller = FlipCardController();
    // Flip the card programmatically
    controller.flipcard();
```
## GestureFlipCard

```dart
    GestureFlipCard(
            animationDuration: const Duration(milliseconds: 300),
            axis: FlipAxis.horizontal,
            controller:cong // used to ccontrol the Gesture flip programmatically
            enableController : false // if [True] if you need flip the card using programmatically
            frontWidget: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'image/011.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            backWidget: Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'image/11.jpg',
                  fit: BoxFit.contain,
                ),
            ),
        ),
```

#### Project Created & Maintained By

#### Gunanithi

Passionate #Flutter, #Android Developer. #UI Designer.


<a href="https://www.linkedin.com/in/imtheguna/"><img src="https://raw.githubusercontent.com/aritraroy/social-icons/master/linkedin-icon.png" alt="linkedin"  width="60"></a> <a href="https://medium.com/@imtheguna"><img src="https://raw.githubusercontent.com/aritraroy/social-icons/master/medium-icon.png" alt="medium" width="60"></a>

## Notes
Please [open an issue](https://github.com/imtheguna/flutter_flip_card/issues) if you find any bugs.

#### Donate

You like the package ? Buy me a coffee :)

<a href="https://www.buymeacoffee.com/imtheguna" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

