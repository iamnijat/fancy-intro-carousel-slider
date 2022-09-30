
# Fancy Intro Carousel Slider

![Cover](https://user-images.githubusercontent.com/42466886/193230556-3dffa02d-22d8-4838-9081-67165129d8c3.png)


Fancy Intro Carousel Slider package lets you add beautiful intro sliders to your Flutter app.

## Installation 

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  fancy_intro_carousel_slider: ^0.0.3
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:fancy_intro_carousel_slider/fancy_intro_carousel_slider.dart';
```

## Example
There are a number of properties that you can modify:

 - items
 - dotHeight               
 - activeDot 
 - disabledDot
 - innerPadding
 - actionButton
 - scrollDirection               
 - physics 
 - pageController

<hr>

<table>
<tr>
<td>

```dart
class FancyIntroCarouselSliderScreen extends StatelessWidget {                                                                                      
  const FancyIntroCarouselSliderScreen({Key? key}) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: FancyIntroCarouselSlider(

          actionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 300,
                height: 55,
                decoration: AppStyles.mainBlueColorBoxDecorationStyle,
                child: const Material(
                  color: AppPalette.transparentColor,
                  child: Center(
                      child: Text("Let's start",
                          style: AppStyles.whiteColor15spw700NotoSans)),
                ),
              ),
            ),
          ),

          pageController: pageController,
          dotHeight: 8,

          innerPadding: const EdgeInsets.only(left: 4),

          activeDot: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.only(right: 7),
            height: 8,
            width: 19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
          ),

          disabledDot: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.only(right: 7),
            height: 8,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
            ),
          ),
          items: [
           Column(
      children: [
        Container(
          width: 320,
          constraints: const BoxConstraints(maxHeight: 400),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: svg_provider.Svg(img),
            fit: BoxFit.fitWidth,
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.mainHeadlineColorw70020spPoppins,
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: AppStyles.mainHeadlineColorw50012spPoppinsLineHeight,
          ),
        )
      ],
    )
          ],
        ),
    );  
  }  
}
```

</td>

</tr>
</table>

## Next Goals
 
 - [ ] Add animational behaviors to the properties.
 
 - [ ] Add more functionalities to the package.
