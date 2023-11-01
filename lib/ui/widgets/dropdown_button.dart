  import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:session2/utils/constants.dart';

DropdownButton<String> dropdownButton() {
    return DropdownButton(
            items: <String>["ar", "en"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e == "en"?"English":"Arabic"),
                     
                    ))
                .toList(),
            onChanged: (v) {
              Hive.box(settings).put(language, v);
            });
  }