import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/screens/settings.dart';

import 'dashboard.dart';
import 'dashboard.dart';
import 'dashboard.dart';
import 'dashboard.dart';
import 'income.dart';

class Expense extends StatefulWidget {
  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  List <String> city = ["Dashboard" ,"All Income"  , "All Expense"];
  String dropbox = "All Expense";
  List <IconData> icn = [Icons.tv ,Icons.local_pizza_outlined ,Icons.free_breakfast_outlined,Icons.directions_bike ,Icons.tv ,Icons.local_pizza_outlined ,Icons.free_breakfast_outlined,Icons.directions_bike ];
  List <String> title = [ "CashBack Offers " , "Cheesy Piza" ,"Freelancing", "Metro Railway" ,"CashBack Offers " , "Cheesy Piza" ,"Freelancing", "Metro Railway"];
  List <String> subtitle = [ "Entertainment" , "Transportation" ,"Transportation" ,"Transportation" ,"Entertainment" , "Transportation" ,"Transportation" ,"Transportation" ,];
  List <String> amount = [ "+\$30" , "-\$30" ,"+\$1300" ,"+\$30" ,"+\$30" , "-\$30" ,"+\$1300" ,"+\$30" , ];
  List <String> date = [ "oct 30,2021" , "oct 30,2021" , "oct 30,2021" , "oct 30,2021" ,"oct 30,2021" , "oct 30,2021" , "oct 30,2021" , "oct 30,2021" ,  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       toolbarHeight: 60,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        titleSpacing: 30,
        title: DropdownButton(  underline: SizedBox(), value: dropbox ,
            items: city.map((item) {

              return DropdownMenuItem(
                child: Text(item , style: TextStyle(color:Color(0xff3e3e3e) ,fontWeight: FontWeight.bold),),
                value : item,

              );

            }).toList() ,

            onChanged:(item){

              setState(() {
                dropbox = item;
                if (dropbox == "Dashboard"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      DashBoard()));
                }
                if(dropbox == "All Income"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      Income()));
                }
                if(dropbox == "All Expense"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      Expense()));
                }
              });
              return dropbox;
            }),
        actions: [
          Icon(Icons.lightbulb_outline , color: Color(0xff909090),),
          SizedBox(width: 25,),
          PopupMenuButton(
              icon: Icon(Icons.more_vert , color: Colors.black,),
              onSelected: (item) {

              },
              itemBuilder:( BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem(child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Settings()));
                    },
                    child: Text("settings")),   value: "settings",),
                PopupMenuItem(child:Text("About"), value: "share",),
              ])
          ,
          SizedBox(width: 15,),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),

              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("TOTAL INCOME" ,style: TextStyle(fontSize: 9, color: Color(0xffaaaaaa), fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text("\$23,000",style: TextStyle(fontSize: 18 ,color: Color(0xff565656), fontWeight: FontWeight.w800,)),

                    ],
                  )
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 18),
                child: Text("Recent Transaction" , style: TextStyle(color: Color(0xff3e3e3e) ,fontWeight: FontWeight.w800 , fontSize: 15),)),
            Expanded(
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    ListView.separated(
                        itemCount: amount.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      color: Color(0xfff9f9f9)
                                  ),
                                  child: Icon(icn[index] , color: Color(0xff2d2d2e),),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(title[index] , style: TextStyle(color: Color(0xff434343),fontWeight: FontWeight.w600 , fontSize: 14),),
                                      SizedBox(height: 10,),
                                      Text(subtitle[index],style: TextStyle(color: Color(0xff6f6f6f) , fontSize: 10),),

                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(amount[index] ,
                                      style: TextStyle(color: amount[index][0]== "+" ? Colors.green : Colors.red),),
                                    SizedBox(height: 10,),
                                    Text(date[index],style: TextStyle(color: Color(0xff6f6f6f) , fontSize: 10),),

                                  ],
                                ),


                              ],
                            ),
                          );

                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        }),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
