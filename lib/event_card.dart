
import 'package:flutter/material.dart';
import 'package:snapwork_event_manager/date_util.dart';
import 'package:snapwork_event_manager/event.dart';

class DateInfo extends StatelessWidget{

  DateInfo(this.day,this.month);
  final String day;
  final String month;

  @override
  Widget build(BuildContext context) {

    var dateWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(day??"NA", style: TextStyle(
            fontSize: 32.0,
            color: Colors.black)
        ),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(month??"NA", style: TextStyle(fontSize: 12.0,
              color: Colors.black  , fontWeight: FontWeight.bold          ),),
        )
      ],
    );


    return Column(
      children: [
        dateWidget,
        const SizedBox(height: 4.0),
      ],
    );
  }

}



class RowItemForEvents extends StatelessWidget{
  final Event events;
  final String day, month;
  final VoidCallback onPressed;
  BuildContext context;

  RowItemForEvents({this.events,this.day,this.month, this.onPressed});


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return InkWell(
      onTap: onPressed ?? () {},
      child: Card(
        elevation: 2.0,
        child: RowItemListTileForCalls(events,day,month),
      ),
    );
  }

}

class RowItemListTileForCalls extends StatelessWidget {
  RowItemListTileForCalls(
      this.events,this.day,this.month
      ) : key = Key('${events}');

  final Event events;
  final Key key;
  final String day, month;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Row(
        children: [
          DateInfo(day,month),
          _EventInfo(events),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Material(
        child: content,
      ),
    );
  }
}

class _EventInfo extends StatelessWidget {
  _EventInfo(this.event);
  final Event event;

  @override
  Widget build(BuildContext context) {

    final decoration = const BoxDecoration(
      border: Border(
        left: BorderSide(color: Colors.blueGrey),
      ),
    );

    final content = [
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              event.title ?? "NA",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 4.0),
      Row(
        children: <Widget>[

          Flexible(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  event.description.toString() ?? "NA",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 4.0),
    ];

    return Expanded(
      child: Container(
        decoration: decoration,
        margin: const EdgeInsets.only(left: 12.0),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: content,
        ),
      ),
    );
  }
}
