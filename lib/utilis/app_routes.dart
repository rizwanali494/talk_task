import 'dart:math';
import 'package:flutter/material.dart';


class MyRoute extends PageRouteBuilder{
  final Widget child;
  Random ob=Random();
  int ? randomElement;
  Offset ? newOffset;
  //List<AxisDirection>   _listDirections=[AxisDirection.up,AxisDirection.down,AxisDirection.left,AxisDirection.right];

  MyRoute(this.child):super(pageBuilder:(context, animation , animatio )=>child ){
    randomElement=ob.nextInt(4);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    var T=Tween<Offset>(begin: getOffSet(randomElement),end: Offset.zero);
    //var T1=Tween<double>(begin: 3.0,end: 1.0);
    return SlideTransition(
        position: animation.drive(T.chain(CurveTween(curve: Curves.easeIn))),
        child: child);
  }

  Offset getOffSet(randomElement){
    switch(randomElement) {
      case 0:
        newOffset = const Offset(0, -1);
        break;
      case 1:
        newOffset = const Offset(0, 1);
        break;
      case 2 :
        newOffset = const Offset(1, 0);
        break;
      case 3:
        newOffset = const Offset(-1, 0);
        break;
    }
    return newOffset!;
  }
}