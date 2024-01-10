

import 'package:flutter/material.dart';
class MyApppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delayed Dismissible'),
        ),
        body: DelayedDismissibleListView(),
      ),
    );
  }
}

class DelayedDismissibleListView extends StatefulWidget {
  @override
  _DelayedDismissibleListViewState createState() =>
      _DelayedDismissibleListViewState();
}

class _DelayedDismissibleListViewState
    extends State<DelayedDismissibleListView> with SingleTickerProviderStateMixin{
       late AnimationController controller;
  List<String> myList = ["Item 1", "Item 2", "Item 3", "Item 4"];
@override
  void initState() {
    // TODO: implement initState
    super.initState(); 
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () {
            // Handle long press
            print("Long press on item $index");
            // Add your custom logic here for a long press
          },
          child: AnimatedBuilder(
            animation: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.easeOut,
              ),
            ),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(controller.value * 100, 0),
                child: Dismissible(
                  key: Key(myList[index]),
                  onDismissed: (direction) {
                    // Remove the item from the data source
                    setState(() {
                      myList.removeAt(index);
                    });

                    // Show a snackbar to indicate item is removed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item removed'),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 16.0),
                  ),
                  child: ListTile(
                    title: Text(myList[index]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}