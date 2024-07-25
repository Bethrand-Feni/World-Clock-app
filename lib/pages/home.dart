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
      if(data.isEmpty) {
        data = routeData;
      }
    }
    //set background
    String bgImage = data['isDayTime'] ? 'morning.jpeg'  : 'night.jpeg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];


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
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context,'/location');
                      setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag']
                          };
                      });
                      },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit locatoion'),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
