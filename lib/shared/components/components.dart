
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   Function? onSubmit,
   Function? onChange,
  required Function validate,
   IconData? prefix,
   IconData? suffix,
  required String label,
}) =>   TextFormField(
   controller: controller,
   keyboardType: type,
   onFieldSubmitted: (value)
   {
     onSubmit!(value);
   },
   onChanged: (value)
   {
     onChange!(value);
   },
  validator: (value)
  {
    validate(value);
    return null;

  },
  decoration: InputDecoration(
  prefixIcon: Icon(prefix,),
  suffixIcon: Icon(suffix,),
  labelText: label,
  border: const OutlineInputBorder(),
 ),
 );

Widget myDivider() =>  Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[200],
  ),
);



void navigateTo(context, widget) =>  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>  widget,
    ),
);

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget),
            (route) => false);

 void showToast({
  required String text,
  required ToastState state,
  })=>    Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0);

 // ignore: constant_identifier_names
 enum ToastState{SUCCESS,ERROR,WARNING}
 Color chooseToastColor(ToastState state)
 {
   Color? color;
   switch(state)
       {
     case ToastState.SUCCESS:
       color = Colors.green;
       break;
     case ToastState.ERROR:
       color = Colors.red;
       break;
     case ToastState.WARNING:
       color = Colors.amber;
       break;
   }
   return color;
 }
