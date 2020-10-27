// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/presentation/features/categories/categories.dart';
import 'package:openflutterecommerce/presentation/features/home/home_bloc.dart';
import 'package:openflutterecommerce/presentation/features/home/home_event.dart';
import 'package:openflutterecommerce/presentation/features/home/home_state.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/discounter_banner.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/headBottom.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/categories.dart';

class Main1View extends StatefulWidget {
  final Function changeView;
  final List<Product> products;

  const Main1View({Key key, this.products, this.changeView}) : super(key: key);

  @override
  _Main1ViewState createState() => _Main1ViewState();
}

class _Main1ViewState extends State<Main1View> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding*2 ;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return SingleChildScrollView(
        child: Column(
          children: <Widget>[

            //OpenFlutterHeadMenu(3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
              children: [

           

             Padding (
               padding: EdgeInsets.all(15),
               child:  Container(
         
                 width: width*0.7,
              
              decoration: BoxDecoration(
               color: Colors.blueGrey[50],
               borderRadius: BorderRadius.all(
               Radius.circular(5.0),
                ),
              ),
           child: TextField(
            style: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.white,),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white,),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Recherche",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blueGrey[300],
            ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey[300],
            ),
          ),
          maxLines: 1,
          ),
           ),
           ),
           Padding
           (padding: EdgeInsets.all(15),
           //favorite page
  
           child : IconBtnWithCounter(svgSrc:'assets/icons/bottom_menu/favorites.svg' ,press: ()=>  Navigator.pushNamed(
                    context, OpenFlutterEcommerceRoutes.favourites),),


           /*child: Container(
            // padding: EdgeInsets.all(15),
            
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
                ),
             child: ClipRRect(
               borderRadius: BorderRadius.only(
               topLeft: Radius.circular(15.0),
               topRight: Radius.circular(15.0),
                ),
               child: SvgPicture.asset('assets/icons/bottom_menu/favorites.svg')
                 
               //Image.asset('assets/icons/bottom_menu/favorites.svg'),
                 /*FontAwesomeIcons.solidHeart,
                color: AppColors.red,
                 size: 30.0,*/
                
                 
                ), 
             )*/
           ),
          
           
           ]
           ),

           DiscountBanner(),
           Categories(),


          OpenFlutterProductListView(
              width: widgetWidth, 
              
              products: widget.products,
              onFavoritesTap: ( (Product product) => {
                BlocProvider.of<HomeBloc>(context).add(
                  HomeAddToFavoriteEvent(
                    isFavorite: !product.isFavorite,
                    product: product
                  )
                )
              }),
            ),



          ]
          ),
      );
    });
  }
}
