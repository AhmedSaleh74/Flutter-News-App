
import 'package:flutter/cupertino.dart';

class ArticelModel with ChangeNotifier{
  final String? img;
  final String title;
  final String? subtitle;
  ArticelModel({
    required this.img,
    required this.title,
    required this.subtitle,
});
}