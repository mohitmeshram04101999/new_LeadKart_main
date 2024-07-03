import 'package:animations/animations.dart';
import 'package:flutter/material.dart';import 'package:leadkart/helper/TextStyles.dart';import 'package:leadkart/them/constents.dart';


// SLIDE AND FADE TRANSITION ANIMATION  //
class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  CustomPageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(seconds: 1),
    reverseTransitionDuration: Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return FadeThroughTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ),
      );
    },
  );
}


// FADETRANSITION ANIMATION //
enum TransitionType {
  FadeThrough,
  SlideFromLeft,
  // Add more transition types as needed
}
class CustomAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;
  final TransitionType transitionType;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;

  CustomAnimation({
    required this.page,
    required this.transitionType,
    this.transitionDuration = const Duration(seconds: 1),
    this.reverseTransitionDuration = const Duration(seconds: 1),
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: transitionDuration,
    reverseTransitionDuration: reverseTransitionDuration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case TransitionType.FadeThrough:
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        case TransitionType.SlideFromLeft:
          var begin = Offset(-1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
      // Add more cases for additional transition types
        default:
        // Default to FadeThrough transition
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
      }
    },
  );
}



class SearchAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;

  SearchAnimation({required this.page})
      : super(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}




