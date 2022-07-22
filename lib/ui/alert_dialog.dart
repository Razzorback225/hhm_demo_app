import 'package:flutter/material.dart';
import 'dart:convert';

class ErrorDialog {
  String? header;
  String? message;
  BuildContext? context;
  String? details;

  ErrorDialog({required this.header, required this.message, required this.context, this.details});

  factory ErrorDialog.fromJson({required String? jsonRaw, required BuildContext context, String? details}) {
    Map? j = Map.from(json.decode(jsonRaw!));

    return ErrorDialog(
      header: "Error : ${j["status"]}",
      message: j["message"],
      context: context,
      details: details
    );
  }

  Future showErrorDialog({required BuildContext context, }) {
    return showDialog(
      context : context,
      builder : (BuildContext context){
        return AlertDialog(
          icon: const Icon(Icons.error, color: Colors.red,),
          title: Text(header?? "Error"),
          content : SizedBox(
            height: MediaQuery.of(context).size.height/5,
            child: Column(
              children: [
                Text(
                  message?? "An error occured",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Region during error : $details",
                  textAlign: TextAlign.center,
                )
              ],
            )
          )
        );
      }
    );
  }
}