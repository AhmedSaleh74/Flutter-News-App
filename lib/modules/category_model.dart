import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/modules/category_view.dart';
import '../models/cat_model_list.dart';
import '../models/category_model.dart';

class CatModel extends StatelessWidget {
  const CatModel({super.key});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context){
          return CategoryView();
        },),);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 140,
          child: ListView.builder(
            physics:const BouncingScrollPhysics(),
            itemCount: catcard.length,
            scrollDirection: Axis.horizontal ,
            itemBuilder: (context, i){
              return Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  width: 200,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${catcard[i].img}'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${catcard[i].txt}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Category extends ChangeNotifier{
  final CategoryModel category;
  Category(this.category);
}


