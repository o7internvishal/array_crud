import 'package:array_crud/data_model.dart';
import 'package:array_crud/list_view.dart';
import 'package:array_crud/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> userlist = [];
  
  void addUser(User user) {
    setState(() {
      userlist.add(user);
    });
  }

  void removeUser(User user) {
    setState(() {
      userlist.remove(user);
    });
  }
  // void updateUser(User user) {
  //   setState(() {
  //      updateUser(user);
  //   });
  // }



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//list
  void showuserDialog({ bool isUpdate = false, int position = -1}) {
       TextEditingController nameController = new TextEditingController();
   TextEditingController addressController = new TextEditingController();;
    if(isUpdate){
nameController.text = userlist[position].name??"";
addressController.text = userlist[position].address??"";

    }
      showDialog(
          context: context,
          builder: (__) {
            return AlertDialog(
              content: Wrap(children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "name",
                    labelText: "name",
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "address",
                    labelText: "address",
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if(isUpdate){
                        userlist[position].name = nameController.text;
                        userlist[position].address = addressController.text;
                      }else
                  {    final user =  User(nameController.text, addressController.text);
                     addUser(user);}
                    setState(() {
                        
                      });
                    Navigator.of(context).pop();
                    },
                    child: const Text("Add"))
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    }


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          
          onPressed: showuserDialog,
         
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Array_CRUD"),
          leading:Text("1") ,
          actions: [Text("123"), Text("f")],
        ),
        body: Container(
          child: ListView.builder(
          //  scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text(
                  userlist[index].name,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
                subtitle: Text(
                  userlist[index].address,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                     color: Colors.blue),
                ),
                trailing: Column(
                  children: [
                     GestureDetector(
                      child: const Icon(
                        Icons.edit,
                        color: Colors.red,
                      ),
                      onTap: ()  {
                        
                      
                       showuserDialog(position: index, isUpdate:  true);
                     
                        // updateUser:userlist(index,User(nameController, addressController));
                      // userlist.setAll(index,)
                        // userlist =index[nameController,addressController];
                        // userlist.setAll(User(nameController));
                        
          
                      },
                      // child:Text('save')
                      
                  // child: const Text("update")
                    
                    ),
                 
                    
                    GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {

                        removeUser(userlist[index]);
                      },
                    
                    ),
                 
                      
                    
                  ],
                ),
              
              ));
            },
            itemCount: userlist.length,
          ),
        ));
  }
}
