import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:samrt_homepage/smartbox.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'asset_manifest.dart';
class homepage extends StatefulWidget {
  const homepage ({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List mySmartdevices =[
    ["Smart Light","assets/images/bulb.png",true],
    ["Smart AC","assets/images/ac.png",false],
    ["Smart TV","assets/images/tv.png",false],
    ["Smart Fan","assets/images/fan.png",false],
  ];
  void powerSwitchChanged(bool value,int index)
  {
    setState(() {
      mySmartdevices[index][2]=value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:SafeArea(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/menu.png',
                height: 45,
                color: Colors.grey[800],
              ),
              Icon(Icons.person,size: 45,color:Colors.grey[800] ,),
            ],
          ),
      ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),

           child: Column(
            children: [
              Text("Welcome Home",style: TextStyle(
                fontSize: 20,color: Colors.grey.shade800,
              ),),
              Text("Flutter TC", style: TextStyle(fontSize: 65),
              )
            ],
          )
      ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(
            thickness: 4,
            color: Color.fromARGB(255, 204, 204, 204),
          ),
    ),
          SizedBox(
            height: 20,
          ),
          Text("Smart Devices",style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 19,
          color: Colors.grey.shade800,
          ),),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.3,
            ),
            itemCount: mySmartdevices.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 30,),
         itemBuilder: (context,index){
              return smartbox(
                name:mySmartdevices[index][0],
                iconPath:mySmartdevices[index][1],
                powerOn:mySmartdevices[index][2],
                onChanged:(value)=>powerSwitchChanged(value, index),

              );
         }),
          )
        ],
      )),
    );
  }
}
