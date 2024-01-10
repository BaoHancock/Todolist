import 'package:flutter/material.dart';

class Listt extends StatefulWidget { 
  String title;

  Listt({super.key,required this.title});

  @override
  State<Listt> createState() => _ListtState();
}

class _ListtState extends State<Listt> {
  bool copied = false;

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [Align(alignment: Alignment.topRight,child: ElevatedButton(onPressed: (){setState(() {
        copied = true;
      });}, child: Text(copied?"copied !":"copy"),)),Text(widget.title,textAlign: TextAlign.justify,strutStyle: StrutStyle(leadingDistribution: TextLeadingDistribution.even),style: TextStyle(color: Color.fromARGB(255, 70, 5, 73),fontSize: 20,fontWeight: FontWeight.bold),),],),
      // child: ListTile(leading: Icon(Icons.remove,size: 40,color: Color.fromARGB(255, 255, 255, 255),),title: SelectableText(title,strutStyle: StrutStyle(leadingDistribution: TextLeadingDistribution.even),style: TextStyle(color: Color.fromARGB(255, 70, 5, 73),fontSize: 20,fontWeight: FontWeight.bold),),),
    );
  }
}
