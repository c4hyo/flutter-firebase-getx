import 'package:flutter/material.dart';

MaterialButton buttonAuth({String? judul,Function()? fungsi}){
  return MaterialButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(
      "${judul!}",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    ),
    minWidth: double.infinity,
    height: 60,
    color: Colors.indigo.shade900,
    onPressed: fungsi,
  );
}