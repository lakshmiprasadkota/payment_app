import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/screens/add_transaction.dart';
import 'package:payment_app/screens/dashboard.dart';
import 'dart:async';
import 'package:payment_app/screens/expense.dart';
import 'package:payment_app/screens/income.dart';
import 'package:payment_app/screens/settings.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(snapshot.data),
      debugShowCheckedModeBanner: false,),
    );
  }
}


class HomePage extends StatefulWidget {
  final bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <String> city = ["Dashboard" ,"All Income"  , "All Expense"];

  String dropbox = "Dashboard";

  List <IconData> icn = [Icons.tv ,Icons.local_pizza_outlined ,Icons.free_breakfast_outlined,Icons.directions_bike ,Icons.tv ,Icons.local_pizza_outlined ,Icons.free_breakfast_outlined,Icons.directions_bike ];

  List <String> title = [ "CashBack Offers " , "Cheesy Piza" ,"Freelancing", "Metro Railway" ,"CashBack Offers " , "Cheesy Piza" ,"Freelancing", "Metro Railway"];

  List <String> subtitle = [ "Entertainment" , "Transportation" ,"Transportation" ,"Transportation" ,"Entertainment" , "Transportation" ,"Transportation" ,"Transportation" ,];

  List <String> amount = [ "+\$30" , "-\$30" ,"+\$1300" ,"+\$30" ,"+\$30" , "-\$30" ,"+\$1300" ,"+\$30" , ];

  List <String> date = [ "oct 30,2021" , "oct 30,2021" , "oct 30,2021" , "oct 30,2021" ,"oct 30,2021" , "oct 30,2021" , "oct 30,2021" , "oct 30,2021" ,  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
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
                      Income()));
                }
              });
              return dropbox;
            }),

        actions: [
          InkWell(
            child:Switch(
              value: widget.darkThemeEnabled,

              onChanged: bloc.changeTheme,
            ) ,
          ),
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
        child:  Column(

          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),

              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("TOTAL BALANCE" ,style: TextStyle(fontSize: 9, color: Color(0xffaaaaaa), fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text("\$23,000",style: TextStyle(fontSize: 18 ,color: Color(0xff565656), fontWeight: FontWeight.w800,)),

                    ],
                  )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        Income()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 8 ,left: 13, right: 10),
                    height: 110,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xffebf8f1),
                                child: IconButton(icon: Icon(Icons.arrow_downward_sharp , size: 20,color: Color(0xffade3c4),), onPressed: null ,color: Colors.red, alignment: Alignment.topRight,  highlightColor: Colors.red,))),
                        Text("TOTAL INCOME" ,style: TextStyle(fontSize: 8 , color: Color(0xffaaaaaa), fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("+\$23,000",style: TextStyle(fontSize: 17 ,color: Color(0xff565656), fontWeight: FontWeight.w800,)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        Expense()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 8 ,left: 13, right: 10),
                    height: 110,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xfffdeeee),
                                child: IconButton(icon: Icon(Icons.arrow_upward_sharp , size: 20,color: Color(0xfff28e8e),), onPressed: null ,color: Colors.red, alignment: Alignment.topRight,  highlightColor: Colors.red,))),
                        Text("TOTAL EXPENSE" ,style: TextStyle(fontSize: 8 , color: Color(0xffaaaaaa), fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("-\$23,000",style: TextStyle(fontSize: 17 ,color: Color(0xff565656), fontWeight: FontWeight.w800,)),
                      ],
                    ),
                  ),
                ),
              ],
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
                                  height: 60,
                                  width: 60,
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


          ],),

      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add, size: 30,),
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> AddTransaction()));
        },
      ),
    );
  }
}
class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}
final bloc = Bloc();

