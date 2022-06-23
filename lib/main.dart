
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/modules/shop_app/login/cubit/cubit.dart';
import 'package:shop_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:shop_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'layout/shop_app/cubit/cubit.dart';

void main()
{
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
       await CacheHelper.init();
     //  bool isDark = CacheHelper.getData(key:'isDark');

      Widget? widget;

      bool? onBoarding = CacheHelper.getData(key:'onBoarding');
      String? token = CacheHelper.getData(key:'token');

      if( onBoarding != null  )
        {
          if( token != null  ) {
            widget = ShopLayout();
          } else {
            widget = ShopLoginScreen();
          }
        }else
        {
        widget = OnBoardingScreen();
        }


      runApp( MyApp(
        startWidget: widget,
      ));
    },
    blocObserver : MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {

  // final bool isDark;
   final Widget startWidget;
     MyApp({
       // this.isDark,
       required this.startWidget,
     });

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => ShopLoginCubit()
        ),
        BlocProvider(
            create: (BuildContext context) => ShopCubit()..getHomeData(),
        ),

      ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: startWidget,
    ),
    );
  }
}
