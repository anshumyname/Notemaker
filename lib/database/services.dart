import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> mainstream= Firestore.instance.collection('Categories').snapshots();