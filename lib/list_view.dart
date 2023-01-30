import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Adddialog extends StatefulWidget {
  const Adddialog({super.key});

  @override
  State<Adddialog> createState() => AdddialogState();
}

class AdddialogState extends State<Adddialog> {
  @override
  Widget build(BuildContext context) {

   Widget createText(String hint,TextEditingController controller){
   return Container(
    margin: EdgeInsets.all(4),
    child: TextField(
     decoration: InputDecoration(
      labelText: hint,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black))
      ),
      controller: controller,
    ),
    );

  
  }
var nameController=TextEditingController();
var addressController=TextEditingController();
ElevatedButton(onPressed: (){

     },child: Text("Add User"),
     );
createText('name',nameController);
createText('address',nameController);

    return Container(
      padding: EdgeInsets.all(8),
      height: 300,
      width: 300,
      child: Column(
        children: [
          Text("Add User",
          style: TextStyle(fontWeight: 
          FontWeight.bold,
          fontSize: 32,
          color: Colors.blue),
          )
      // createText("name",namecontroller)
      
        ],
      ),
      
    );
  }
}