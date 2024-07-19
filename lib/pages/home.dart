import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments;
    if (routeData is Map<String, dynamic>){
      data = routeData;
    }
    print(data);

    //set background
    String bgImage = 'night.jpeg';
    Color? bgColor = Colors.indigo[700];

    if (data['isDayTime'] != null && data['isDayTime'] == false) {
      bgImage = 'morning.jpeg';
      bgColor = Colors.blue;
    }

    print(bgImage);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                FloatingActionButton.extended(
                    onPressed: (){
                      Navigator.pushNamed(context,'/location');
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit locatoion'),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'] ?? 'Unknown location',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0
                      ),
                    )
                  ],
                ),
              SizedBox(height: 20.0),
              Text(
                data['time']?? 'Unknown time',
                style: TextStyle(
                  fontSize: 66.0,
                ),
              )],
            ),
          ),
        ),
      )
    );
  }
}
