import 'dart:ffi';

import 'package:flutter/material.dart';

class Entrances extends StatefulWidget {  
  @override
  State<Entrances> createState() => _EntrancesState();
}

class _EntrancesState extends State<Entrances> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> radius;
  late Animation<double> rotate;
  bool isanimmating = false;

@override
  void initState() {
   
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 2))..forward();
    rotate =Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    radius = Tween(begin: 45.0,end: 10.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.addListener(() {
      setState(() {
        
      });
    });

    controller.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        controller.reverse();
      }else if(status==AnimationStatus.dismissed){
        controller.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
   return Stack(alignment: Alignment.center,children: [
    Transform.rotate(angle: rotate.value,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.value),color: Color.fromARGB(255, 130, 0, 162),boxShadow: [BoxShadow(blurRadius: 2220,offset: Offset(-2,-2)),]),width: 200,height: 200,))
    ,Transform.rotate(angle: rotate.value,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.value),color: Color.fromARGB(255, 233, 50, 250),boxShadow: [BoxShadow(blurRadius: 20,offset: Offset(-1,-1))]),width: 170,height: 170,)),
    Transform.rotate(angle: rotate.value,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.value),color: Color.fromARGB(255, 230, 133, 235),boxShadow: [BoxShadow(blurRadius: 20,offset: Offset(-1,-1))]),width: 150,height: 150,)),
    Transform.rotate(angle: rotate.value,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.value),color: Color.fromARGB(255, 251, 215, 252),boxShadow: [BoxShadow(blurRadius: 20,offset: Offset(-1,-1))]),width: 120,height: 120,)),
    Transform.rotate(angle: rotate.value,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.value),color: Color.fromARGB(255, 255, 176, 236),boxShadow: [BoxShadow(blurRadius: 20,offset: Offset(-1,-1))]),width: 100,height: 100,)),
    Transform.rotate(angle: rotate.value,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.value),color: Color.fromARGB(255, 223, 167, 233),boxShadow: [BoxShadow(blurRadius: 20,offset: Offset(-1,-1))]),width: 80,height: 80,)),
    Transform.rotate(angle: rotate.value,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.value),color: Color.fromARGB(255, 198, 165, 204),boxShadow: [BoxShadow(blurRadius: 20,offset: Offset(-1,-1))]),width: 50,height: 50,)),
    
    ],);
   
   

   
  }
}
