import 'package:firebase_database/firebase_database.dart';

class Item {
  String key;
  String subject;
  
  String titulo ;
  String descripcion; 
  String detalle;
  bool completed;
  
  String userId;

  Item(this.userId, this.titulo, this.descripcion, this.detalle,this.completed);
  
  Item.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    userId = snapshot.value["userId"],
    subject = snapshot.value["subject"],
    completed = snapshot.value["completed"];

  toJson() {
    return {
      "userId": userId,
      "subject": subject,
      "completed": completed,
    };
  }
}