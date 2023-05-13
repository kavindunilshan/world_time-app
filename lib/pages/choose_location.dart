import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}



class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
  WorldTime(location: 'Colombo' , flag: 'srilanka.png' , url: 'Asia/Colombo'),
  WorldTime(location: 'Jakarta' , flag: 'indonesia.png' , url: 'Asia/Jakarta'),
  WorldTime(location: 'London' , flag: 'uk.png' , url: 'Europe/London'),
  WorldTime(location: 'Paris' , flag: 'france.gif' , url: 'Europe/Paris'),
  WorldTime(location: 'Berlin' , flag: 'germany.png' , url: 'Europe/Berlin'),
  WorldTime(location: 'New-york' , flag: 'usa.png' , url: 'America/New_york'),
  ];


  void UpdateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),

      body: ListView.builder(
          itemCount: locations.length,
        itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                color: Colors.grey[400],
                child: ListTile(
                  onTap: () {
                    UpdateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                      fontSize: 18.0,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'asserts/${locations[index].flag}'
                    ),
                  ),
                ),
              ),
            );
        },
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
