import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_app/screens/edit_transaction.dart';

import 'add_transaction.dart';

class Details extends StatefulWidget {
    Details({this.title , this.note,this.when, this.amout,this.tag , this.transaction});
  final title ;
    final amout ;
    final tag ;
    final when;
    final note;
    final  transaction;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  @override
  Widget build(BuildContext context) {
    DateTime currentDate = new DateTime.now();
    String _formattedate = new DateFormat.yMMMd().format(currentDate);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp , color: Colors.black,),onPressed: (){
          Navigator.of(context).pop();
        },),
        leadingWidth: 80,
        centerTitle: true,
        title: Text("Details" , style: TextStyle(color: Colors.black),),
        actions: [
          Icon(Icons.delete , color: Colors.black,),
          SizedBox(width: 25,),
          Icon(Icons.share , color: Colors.black,),
          SizedBox(width: 15, )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
           child: Column(
         children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title" , style: TextStyle(color: Color(0xffd1d1d1) ,fontWeight: FontWeight.w500),),
                Text(widget.title , style: TextStyle(color: Colors.black , fontSize: 18,),),
                SizedBox(height: 20,),
                Text("Amount" , style: TextStyle(color: Color(0xffd1d1d1) ,fontWeight: FontWeight.w500),),
                Text("\$${widget.amout}" , style: TextStyle(color: Colors.black ,fontSize: 18,),),
                SizedBox(height: 20,),
                Text("Transaction Type" , style: TextStyle(color: Color(0xffd1d1d1) ,fontWeight: FontWeight.w500),),
                Text("${widget.transaction}" , style: TextStyle(color: Colors.black ,fontSize: 18,),),
                SizedBox(height: 20,),
                Text("Tag" , style: TextStyle(color: Color(0xffd1d1d1) ,fontWeight: FontWeight.w500),),
                Text("${widget.tag}" , style: TextStyle(color: Colors.black ,fontSize: 18,),),
                SizedBox(height: 20,),
                Text("When" , style: TextStyle(color: Color(0xffd1d1d1) ,fontWeight: FontWeight.w500),),
                Text("${widget.when}" , style: TextStyle(color: Colors.black ,fontSize: 18,),),
                SizedBox(height: 20,),
                Text("Note" , style: TextStyle(color: Color(0xffd1d1d1) ,fontWeight: FontWeight.w500),),
                Text("${widget.note}" , style: TextStyle(color: Colors.black ,fontSize: 18,),),
                SizedBox(height: 20,),
                Text("Created At" , style: TextStyle(color: Color(0xffd1d1d1) ,fontWeight: FontWeight.w500),),
                Text(_formattedate , style: TextStyle(color: Colors.black ,fontSize: 18,),),
                SizedBox(height: 20,),

              ],),
            ),
           InkWell(
             onTap: ()
             {
               Navigator.push(context, MaterialPageRoute(builder: (_)=>EditTransaction(title: widget.title,
               note: widget.note, amount: widget.amout,)));
             },
             child: Container(
               height: 50,
               width: 100,

               margin:EdgeInsets.only(left: 230) , padding:EdgeInsets.only(left: 15) ,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.blue
               ),
               child: Row(
                 children: [
                   Icon(Icons.edit_outlined ,color: Colors.white,size: 20,),
                   SizedBox(width: 5,),
                   Text("EDIT",style: TextStyle(color: Colors.white ,fontSize: 12
                   ),)
                 ],
               ),
             ),
           )

   ])
      ),) );
  }
}
