import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List <String> countryCode = ["EUR" ," USD" , "CAD", "AUD","CHF","MXN" ,"RUB" ,"INR" ,"BRL"];
  List <String> countryFlag =["Assest/Images/australia.png" ,"Assest/Images/mexico.png" ,"Assest/Images/pakistan.png","Assest/Images/australia.png","Assest/Images/australia.png","Assest/Images/united-states-of-america.png","Assest/Images/russia.png","Assest/Images/india.png","Assest/Images/russia.png",];
   List <String> countrynName = ["Euro" ," US Dollar" , "Canadian Dollar", "Australian Dollar","Swiss","Mexican" ,"Russian" ,"Indian" ,"Brazilian"];
   String    demo = "INR";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp ,size: 30, color: Colors.black,), onPressed: (){
          Navigator.pop(context);

        },),
      centerTitle: true,
      title: Text("Currency", style: TextStyle(color: Colors.black),),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            ListView.separated(
              itemCount: countrynName.length,
                shrinkWrap: true,
                itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  setState(() {
                    demo = countryCode[index];
                  });
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[50],
                    radius: 22,
                    child: Image.asset(countryFlag[index] ,height: 25,width: 25,),
                    // backgroundImage: AssetImage(countryFlag[index]),

                  ),
                  title: Row(
                    children: [
                      Text(countryCode[index], style: TextStyle(color: Colors.grey , fontSize: 13),),
                      SizedBox(width: 10,),
                      Text(countrynName[index],style: TextStyle(color: Colors.black , fontSize: 14), ),
                    ],
                  ),
                  trailing:  CircleAvatar(
                    radius: 18,
                    backgroundColor:   demo== countryCode[index] ?Color(0xffd8f2e3) : Colors.white,
                    child: Icon(Icons.circle, size: 18, color: demo== countryCode[index] ?Colors.green: Colors.white,),
                  )

                ),

              );
            },
            separatorBuilder: (context, index) {
      return SizedBox(
      height: 20,
      );
      })
          ],
        ),
      ),
    );
  }
}
