import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {

  final String date;

  AddEventScreen({this.date});

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextEditingController timeController, titleController, descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeController = TextEditingController(text: "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}");
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){Navigator.of(context).pop();},child: Center(child: Text("Back",style: TextStyle(color: Colors.white,fontSize: 14),))),
        title: Center(child: Text("Event Detail"),),
      ),
      body: Stack(
        children:[ Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Date & Time")),
                  Expanded(child: TextField(controller: timeController,)),
                  Expanded(child: Text(widget.date ?? "")),
                ],
              ),

              SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(child: Text("Title")),
                  Expanded(child: TextField(controller: titleController,)),
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(child: Text("Description")),
                  Expanded(child: TextField(controller: descriptionController,)),
                ],
              ),


            ],
          ),
        ),

          Positioned(
            bottom: 0.0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: (){
                    print("save");

                  },
                  color: Theme.of(context).primaryColor,child: Text("SAVE",style: TextStyle(color: Colors.white),), shape: RoundedRectangleBorder(
                ),),
              )
          )
      ]
      ),
    );
  }
}
