import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_app/screens/dashboard.dart';

class EditTransaction extends StatefulWidget {
  EditTransaction({this.title , this.note ,this.amount });
  final String title;
final String amount;
final String note;



  @override
  _EditTransactionState createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  String title = " ";
  String amount = " ";
  String note = " ";
  List <String> transactionList = ["Transaction Type" ,"Income"  , "CashBack offer" , "Donations" , "Freelancing" , "         .                                                    "];
  String transactionDropox = "Transaction Type";
  List <String> tagsList = ["Tags" ,"Entertainment" ,"Side Projects"  , "Transportation" ,"         .                                                    "];
  String tagsDropbox = "Tags";



  DateTime currentDate = new DateTime.now();
  Future<Null> _selectdate(BuildContext context) async{
    final DateTime _seldate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2027),
        builder: (context,child) {
          return SingleChildScrollView(child: child,);
        }
    );
    if(_seldate!=null) {
      setState(() {
        currentDate = _seldate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formattedate = new DateFormat.yMMMd().format(currentDate);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 50,
        actions: [
          Icon(Icons.delete , color: Colors.black,),
          SizedBox(width: 20,)
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp , color: Color(0xff2c2c2c)),onPressed: (){
          Navigator.pop(context);
        }),
        title:     Text("Edit Transaction",style: TextStyle( color: Color(0xff2c2c2c),fontWeight: FontWeight.w600,fontSize: 18),),
      ),
      body: SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Column(
            children: [
              Container(

                height: 55,
                decoration: BoxDecoration(

                  boxShadow: [BoxShadow(
                      color: Color(0xff90999a),
                      offset: Offset(0,3),
                      spreadRadius: 0.5,
                      blurRadius: 1
                  )],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),topLeft: Radius.circular(5.0)),
                  color: Color(0xffeaeaea),
                ),
                child: Center(
                  child: TextField(
                    onChanged: (val){
                      setState(() {
                        title = val ;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: widget.title,
                      hintStyle: TextStyle(color: Color(0xffb4b7b7, ),fontSize: 14),
                      border: InputBorder.none,
                      filled: true,
                      fillColor:Color(0xffeaeaea),
                      // border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(

                height: 55,
                decoration: BoxDecoration(

                  boxShadow: [BoxShadow(
                      color: Color(0xff90999a),
                      offset: Offset(0,3),
                      spreadRadius: 0.5,
                      blurRadius: 1
                  )],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),topLeft: Radius.circular(5.0)),
                  color: Color(0xffeaeaea),
                ),
                child: TextField(
                  onChanged: (val){
                    setState(() {
                      amount = val ;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: widget.amount,
                    hintStyle: TextStyle(color: Color(0xffb4b7b7, ),fontSize: 14),
                    border: InputBorder.none,
                    filled: true,
                    fillColor:Color(0xffeaeaea),

                  ),
                ),

              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.only(left: 7),
                width: MediaQuery.of(context).size.width * 1,
                height: 55,
                decoration: BoxDecoration(

                  boxShadow: [BoxShadow(
                      color: Color(0xff90999a),
                      offset: Offset(0,3),
                      spreadRadius: 0.5,
                      blurRadius: 1
                  )],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),topLeft: Radius.circular(5.0)),
                  color: Color(0xffeaeaea),
                ),
                child: DropdownButton(  underline: SizedBox(), value: transactionDropox ,
                    items: transactionList.map((item) {

                      return DropdownMenuItem(
                        child: Text(item , style: TextStyle(color:Color(0xffb4b7b7) ,),),
                        value : item,

                      );

                    }).toList() ,

                    onChanged:(item){

                      setState(() {
                        transactionDropox = item;

                      });
                      return transactionDropox;
                    }),

              ),
              SizedBox(height: 25,),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 55,
                padding: EdgeInsets.only(left: 7),
                decoration: BoxDecoration(

                  boxShadow: [BoxShadow(
                      color: Color(0xff90999a),
                      offset: Offset(0,3),
                      spreadRadius: 0.5,
                      blurRadius: 1
                  )],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),topLeft: Radius.circular(5.0)),
                  color: Color(0xffeaeaea),
                ),
                child: DropdownButton(  underline: SizedBox(), value: tagsDropbox ,
                    items: tagsList.map((item) {

                      return DropdownMenuItem(
                        child: Text(item , style: TextStyle(color:Color(0xffb4b7b7) ,fontSize: 16),),
                        value : item,

                      );

                    }).toList() ,

                    onChanged:(item){

                      setState(() {
                        tagsDropbox = item;

                      });
                      return tagsDropbox;
                    }),
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10 ),
                height: 55,
                decoration: BoxDecoration(

                  boxShadow: [BoxShadow(
                      color: Color(0xff90999a),
                      offset: Offset(0,3),
                      spreadRadius: 0.5,
                      blurRadius: 1
                  )],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),topLeft: Radius.circular(5.0)),
                  color: Color(0xffeaeaea),
                ),

                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentDate ==  Null ?
                    Text('When'  ,style: TextStyle(color: Color(0xffb4b7b7, ),fontSize: 14),) : Text("${_formattedate}"),


                    IconButton(onPressed: (){
                      _selectdate(context);
                    },icon: Icon(Icons.calendar_today),)
                  ],),

              ),
              SizedBox(height: 25,),
              Container(

                height: 55,
                decoration: BoxDecoration(

                  boxShadow: [BoxShadow(
                      color: Color(0xff90999a),
                      offset: Offset(0,3),
                      spreadRadius: 0.5,
                      blurRadius: 1
                  )],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),topLeft: Radius.circular(5.0)),
                  color: Color(0xffeaeaea),
                ),
                child: Center(
                  child: TextField( onChanged: (val){
                    setState(() {
                      note = val ;
                    });
                  },
                    decoration: InputDecoration(
                      hintText: widget.note,
                      hintStyle: TextStyle(color: Color(0xffb4b7b7, ),fontSize: 14),
                      border: InputBorder.none,
                      filled: true,
                      fillColor:Color(0xffeaeaea),

                      // border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),


              // ListView.builder(
              //   itemCount: hint.length,
              //     shrinkWrap: true,
              //     itemBuilder: (context, indesx){
              //   return  TextField(
              //     controller: control[indesx] ,
              //     decoration: InputDecoration(
              //       hintText: hint[indesx],
              //         isDense: true,
              //         filled: true,
              //         fillColor: Colors.grey,
              //         enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.grey, width: 2),
              //             borderRadius: BorderRadius.circular(10)
              //
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.green, width: 2),
              //             borderRadius: BorderRadius.circular(10)
              //
              //         )
              //     ),
              //   );
              // })
              SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashBoard()
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),

                  child: Center(child: Text("Add Transaction",style: TextStyle(color: Colors.white,fontSize: 16),)),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
