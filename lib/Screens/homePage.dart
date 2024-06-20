
import 'package:flutter/material.dart';
import 'package:my_contact_appz/Screens/constant.dart';
import 'package:my_contact_appz/Screens/detailesPage.dart';
import 'package:my_contact_appz/Screens/loginPage.dart';
import 'package:my_contact_appz/Screens/userList.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePAge extends StatelessWidget {
  const HomePAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts",style: TextStyle(fontSize: 25,fontFamily: "Roboto font",fontWeight: FontWeight.w700),),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        actions: [
          Text("Sing out"),
          IconButton(onPressed: (){
            exit(context);
          },
           icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder:(BuildContext context , int index){
          return Card(
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesPage(Name: users[index].name, Time: users[index].Time,)));
              },
              leading: Container(
                // margin: EdgeInsets.only(right: 20),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: (index%2==0)?BoxShape.circle:BoxShape.rectangle,
                  image: DecorationImage(image: AssetImage(users[index].avatar),fit: BoxFit.cover)
                ),
              ),
              title: Text(users[index].name,style: TextStyle(fontSize: 18,fontFamily: "Roboto font",fontWeight: FontWeight.w700),),
              subtitle: Text(users[index].number),
              trailing: Text(users[index].Time),
            ),
          );
        }
        
        )
    );

  }

  // sing Out Fuction
  singOut(context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context)=> LoginPage()), (route) => false);
  }
  // Exit Conformation

  exit(context){
    showDialog(context: context,
     builder: (context)=> AlertDialog(
      title:const Text("Do you want to Exit"),
      actions: [
        TextButton(
          onPressed: (){
            singOut(context);
          },
           child: const Text("Yes"),),
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
           child:const Text("No"),),

      ],
     ));
  }

}