import 'package:flutter/material.dart';

class Event implements EventInterface {
  final DateTime date;
  final String title;
  final int id;
  final String description;
  Event({
    this.id,
    this.date,
    this.title,
    this.description,
  }) : assert(date != null);

  @override
  bool operator ==(dynamic other) {
    return this.date == other.date &&
        this.title == other.title &&
        this.description == other.description &&
        this.id == other.id;
  }

  @override
  int get hashCode => hashValues(date, title, id, description);

  @override
  DateTime getDate() {
    return date;
  }

  @override
  int getId() {
    return id;
  }


  @override
  String getTitle() {
    return title;
  }

  @override
  String getDescription() {
    return description;
  }
}

abstract class EventInterface {
  DateTime getDate();
  String getTitle();
  int getId();
  String getDescription();
}
