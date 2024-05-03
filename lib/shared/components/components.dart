
import 'package:flutter/material.dart';

Widget defaultbutton({
  double width = double.infinity,
  Color background = Colors.redAccent,
  double radius = 0.0,
  required Function() function,
  required String text,
}) => Container(
  height: 40.0,
  width:width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
        radius
    ),
    color:background,
  ),
  child: MaterialButton(
    onPressed:function,
    child: Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaulttextform({
  @required TextEditingController? control,
  @required TextInputType? type,
  Function(String)? submitted,
  Function(String)? change,
  Function()? tap,
  String? Function(String? val)? validate,
  @required String? label,
  @required IconData? prefix,
  IconData? sufex,
  Function()? sufexpress,
  bool obsecure = false,
}) => TextFormField(
  controller: control,
  keyboardType:type,
  onChanged:change,
  onFieldSubmitted: submitted,
  onTap: tap,
  obscureText: obsecure,
  decoration:InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon:Icon(
      prefix,
    ),
    suffixIcon: sufex != null ? IconButton(
      onPressed:sufexpress,
      icon:Icon(
        sufex,
      ),
    ) : null,
  ),
  validator:validate,
);



Widget defaultcontainer({
  @required EdgeInsetsGeometry? pad,
  @required AlignmentGeometry? align,
  @required double? height,
  @required double? width,
  @required Color? color,
  @required String? text,
  @required VoidCallback? ontap,
}) => GestureDetector(
  onTap: ontap,
  child: Container(

    padding: pad,

    alignment: align,

    height: height,

    width: width,

    color: color,

    child: Text(

      '$text',

      style: TextStyle(

        color: Colors.white,

        fontSize: 18.0,

      ),

    ),

  ),
);



Widget tunescontainer ({@required String? Sound, @required Color? color,}) => GestureDetector(
  onTap: () {
    // final player = AudioPlayer();
    // player.play(AssetSource('$Sound'));
  },
  child: Container(
    width: double.infinity,
    color: color,
  ),
);


Widget buildtask(Map model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        child: Text(
          '${model['time']}',
        ),
      ),
      SizedBox(
        width:25.0 ,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model['title']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            '${model['date']}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ],
  ),
);

