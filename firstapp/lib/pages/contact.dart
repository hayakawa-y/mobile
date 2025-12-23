import 'package:firstapp/pages/cal.dart';
import 'package:flutter/material.dart';
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

final items = List<String>.generate(1000, (i)=>"Item $i");
List mydata = ['apple','banana','papaya'];
  @override
  Widget build(BuildContext context) {
     return ListView.builder(itemBuilder:  (context, index){
     return ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute
          (builder: (context)=>const CalculatePage()));
        },
        leading: Icon(Icons.access_alarm_outlined),
        title: Text(items[index]),
      );
    },
    itemCount: mydata.length,
    );
  }
}