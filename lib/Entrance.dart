import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todolistani/glovalvar.dart';
import 'package:todolistani/listtile.dart';
import 'package:http/http.dart' as http;
import 'package:todolistani/loadingbar.dart';
  // String title="";
class Entrance extends StatefulWidget {  

  @override
  State<Entrance> createState() => _EntranceState();
}

class _EntranceState extends State<Entrance>{
int asa = 1;
List<String> data = [];
var contorll;
String isnull ="";
bool isEven =true;

bool isloading = false;


final TextEditingController controller=TextEditingController();

    void count()async{
    
    }
   
 

    void getbefore()async{
    http.Response response  = await http.get(Uri.parse("$uri/all"));
    http.Response res  = await http.get(Uri.parse("$uri/countEntries"));
    counttts = jsonDecode(res.body)["count"];
    if(counttts<=counttts){
      print("object");
    for (int i = 0;i<=counttts;i++){

     String  lit = jsonDecode(response.body)[i]["task"];
     print(lit);
     setState(() {
       data.add(lit);
     });
      
    }
    }
   
    print(data);

}
@override
  void initState() {

    super.initState();
  
    getbefore();   
    }

   Future< void> passdata()async{
      print(controller.text);
      final String sampleking = controller.text;
      var response ;
       response =  await http.post(Uri.parse("$uri/task"),headers: {"Content_Type":"application/json"},body: {'task':sampleking},);
     

    }
    // Future<void> getdata()async{

    //    final respons = await http.get(Uri.parse("http://192.168.149.184:3000/tasks"));
    //      print(respons);
      
    // }
    void deleteItemAt(int index) {
  data.removeAt(index);
}
  
  @override
  Widget build(BuildContext context) {
      // final  snakbar = SnackBar(content: Text());
   return Scaffold(
    backgroundColor: Color.fromARGB(244, 246, 196, 255),
    
   body: SafeArea(
     child: Column(children: [SizedBox(height: 30,),
    //  isloading?Entrance():Text("Found all"),
    //  Center(child: Entrances()),
    //  ElevatedButton(onPressed: (){
    //   showModalBottomSheet(context: context, builder: (context) => GestureDetector(onDoubleTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Entrances(),)),child: Icon(Icons.abc)),);
    //  }, child:Text("data") ),
   
     
     Align(alignment: Alignment.bottomCenter,child: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
      showModalBottomSheet(context: context, builder: (context) => Column(children: [ SizedBox(height: 20,),
      ElevatedButton(onPressed: (){
          
          if(controller.text.isEmpty){
           
          }
          else{
          setState(() {
            asa = asa+1;
            data.add(controller.text);
            isloading = false;
            passdata();
            
            
          });
          
          Navigator.pop(context);
      }}, child: Icon(Icons.save)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(autofocus: true,maxLines: 10,controller: controller,decoration: InputDecoration(hintText: "my New Task ",border: OutlineInputBorder())),
      
      ),
      
      
      ],),);
      
      
     
       setState(() {
         if(controller.text.isNotEmpty){
            controller.text=isnull;
         }
       });
     
       
       
      //  ScaffoldMessenger.of(context).showSnackBar(snakbar);
     },)),
     Expanded(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ListView.builder(itemBuilder: (BuildContext context,int index){
          return Dismissible(onDismissed:(direction) {
            print(direction);
              // Remove the item from the data source
              if(direction ==DismissDirection.startToEnd){
         
                 setState(() {
                data.removeAt(index);
                // print(index);
                if(index==0){
                  index=1;
                }
         
              });
              // ScaffoldMessenger.of(context).showSnackBar(snakbar);
              }else if(direction==DismissDirection.endToStart){
         
              }
             
              
              } ,secondaryBackground:Container(color: const Color.fromARGB(255, 50, 3, 0),child: Icon(Icons.delete,color: Colors.white,size: 20,),) ,background: Container(color: Colors.red,),key: UniqueKey(),child: Listt(title: data[index]));
         },itemCount: data.length,shrinkWrap: true,),
       )
     ),
     
     ],),
   )
   );
  }
}
