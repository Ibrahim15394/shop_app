
import 'package:flutter/material.dart';


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
     onSubmit;
   },
   onChanged: (value)
   {
     onChange;
   },
  validator: (value)
  {
    validate;
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