import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/shared/styles/colors.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder:  (context,state)
      {

        return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null ,
            builder: (context) => productsBuilder( ShopCubit.get(context).homeModel) ,
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }

  Widget productsBuilder(HomeModel? model) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children:
      [
       CarouselSlider(items: model?.data?.banners.map((e) =>
           Image(
               image: NetworkImage('${e.image}'),
               width: double.infinity,
               fit:BoxFit.cover,
           ),
       ).toList(),
         options: CarouselOptions(
           height: 250.0,
           initialPage: 0,
           viewportFraction: 1.0,
           reverse: false,
           enableInfiniteScroll: true,
           autoPlay: true,
           autoPlayInterval: const Duration(seconds: 2,),
           autoPlayAnimationDuration: const Duration(seconds: 1,),
           autoPlayCurve: Curves.fastOutSlowIn,
           scrollDirection: Axis.horizontal,
         ),
       ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio:  1 / 1.63,
            children: List.generate(model!.data!.products.length, (index) =>
                buildGridProduct(model.data!.products[index]),),
          ),
        ),
      ],
    ),
  );
  Widget buildGridProduct(ProductModel model) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
             alignment : AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image!),
                    width: double.infinity,
                    height: 200.0,

                  ),
                  if(model.discount !=0)
                  Container(
                    padding: const EdgeInsets.only(top: 2.0,left: 7.0,right: 7.0,bottom: 2.0,),
                    color: Colors.red,
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      ),

                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                model.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                 height: 1.3,
                ),

              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: const TextStyle(
                      color: defaultColor,
                      fontSize: 14.0,
                    ),

                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  if(model.discount !=0)
                  Text(
                    '${model.oldPrice.round()}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      decoration: TextDecoration.lineThrough,
                    ),

                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 16.0,
                      ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ],

    ),
  );
}
