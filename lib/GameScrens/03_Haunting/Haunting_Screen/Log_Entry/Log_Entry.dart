import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/ViewModels/Haunting/HauntingGame_ViewModel.dart';

class Log_entry{
  static getLogEntryWindow(double screenWidth, double screenHeight, HauntingGame_ViewModel viewModel) {
    return Container(
      height: screenHeight * 0.25, width: screenWidth * 0.8, color: Colors.red,
      child: ListView.builder(
          itemCount: viewModel.entries.length,
          itemBuilder: (context, index){
            List<String> entry = viewModel.entries[index];
            return Container(
              height: screenHeight * 0.15 / 3,
              color: Colors.amber,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    entry.length,
                        (i) => logEntry_getPart(
                      entry,
                      i,
                    ),
                  ),
                ),
              )
            );
      }),
    );
  }

  static logEntry_getPart(List<String> entry, int i) {

    var log_Update_Part = entry[i];
    var log_Update_Part_ExtractedData = "";

    if (log_Update_Part.contains("Name/")) {
      List<String> parts = log_Update_Part.split('/');
      String data = parts[1];
      return Row(
        children: [
          Text(data, style: TextStyle(
              color: Colors.lightBlueAccent
          ),),
          Padding(padding: EdgeInsets.only(left: 5))
        ],
      );
    }

    if (log_Update_Part.contains("Damage/")) {
      List<String> parts = log_Update_Part.split('/');
      String data = parts[1];
      return Row(
        children: [
          Text(data, style: TextStyle(
              color: Colors.lightBlueAccent
          ),),
          Padding(padding: EdgeInsets.only(left: 5))
        ],
      );
    }

    if (log_Update_Part.contains("Text/")) {
      List<String> parts = log_Update_Part.split('/');
      String data = parts[1];
      return Row(
        children: [
          Text(data, style: TextStyle(
              color: Colors.white
          ),),
          Padding(padding: EdgeInsets.only(left: 5))
        ],
      );
    }

    if (log_Update_Part.contains("Icon=")) {
      List<String> parts = log_Update_Part.split('=');
      String data = parts[1];
      return Row(
        children: [
          Image.asset(data),
          Padding(padding: EdgeInsets.only(left: 5))
        ],
      );
    }

    return Text("");

  }

}