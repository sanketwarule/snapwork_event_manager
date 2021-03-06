import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapwork_event_manager/add_event_screen.dart';
import 'package:snapwork_event_manager/date_util.dart';
import 'package:snapwork_event_manager/event.dart';
import 'package:snapwork_event_manager/event_card.dart';
import 'package:snapwork_event_manager/event_list.dart';


typedef OnItemClick(String value);

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  String selectedYear;
  String selectedMonth;


  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 2, 10): [
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 1',
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 2',
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 3',
        ),
      ],
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedYear = "Select Year";
    selectedMonth = "Select Month";



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Events")),),
      body: Column(
        children: [
          Container(
            height: 80,
            child: Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                      onPressed: (){
                        List<String> yearList = [];
                        for (int i = 2016; i <= 2025; i++){
                          yearList.add(i.toString());
                        }
                        _showBottomSheet(context,"Years", yearList, onTap: (item){
                          selectedYear = item;
                        });
                      },
                    color: Theme.of(context).primaryColor,child: Text(selectedYear,style: TextStyle(color: Colors.white),), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: (){

                    _showBottomSheet(context,"Months", monthsNames, onTap: (item){
                      selectedMonth = item.toString();
                    });

                    },
                    color: Theme.of(context).primaryColor,child: Text(selectedMonth,style: TextStyle(color: Colors.white),), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),),
                ))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: (selectedMonth != null && selectedYear != null && selectedMonth != "Select Month" && selectedYear != "Select Year") ? daysInMonth(monthsNames.indexOf(selectedMonth),int.parse(selectedYear)) : 0,
              itemBuilder: (context,index) {

                return RowItemForEvents(
                  onPressed: (){
                    print("date pressed : " + (index + 1).toString());

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddEventScreen(date: "${(index + 1)}-${selectedMonth}-${selectedYear}")));
                  },
                    events: Event(id:1, date: DateTime.now(),title: "", description: ""), month: monthsNames.elementAt(monthsNames.indexOf(selectedMonth),),day: (index + 1).toString());
              },
            ),
          )
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context,String title, List<String> item, {OnItemClick onTap}) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return  DecoratedBox(
              decoration: BoxDecoration(color: Colors.transparent),
              child: ClipRRect(
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0)),
          child:Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: Center(child: Text(title??"",style: TextStyle(fontSize: 18),)),
                          )
                        ],
                      ),
                      new Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            itemCount: item.length,
                            itemBuilder: (context,index) => ListTile(
                                onTap: (){
                                  setState(() {
                                    onTap(item[index]);
                                  });
                                },
                                title: Center(child: Text(item[index].toString(),style: TextStyle(color: Colors.blue),))),
                          ),
                        )
                      ),
                    ],
                  ))
          ));
        });

  }
}
