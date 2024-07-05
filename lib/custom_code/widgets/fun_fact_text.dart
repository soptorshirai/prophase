// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

class FunFactText extends StatefulWidget {
  const FunFactText({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<FunFactText> createState() => _FunFactTextState();
}

class _FunFactTextState extends State<FunFactText> {
  FunFactsStruct doThis() {
    List<FunFactsStruct>? funfacts = allFunFacts();
    int rand = Random().nextInt(funfacts.length);
    FunFactsStruct fa = funfacts[rand];
    return fa;
  }

  @override
  Widget build(BuildContext context) {
    FunFactsStruct funFact = doThis();
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                funFact.fact,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFFFAF8F8),
                      letterSpacing: 0,
                    ),
                textAlign: TextAlign.left,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Row(children: [
                if (funFact.tag1 != null &&
                    funFact.tag1 != 'na' &&
                    funFact.tag1 != '')
                  Container(
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          funFact.tag1,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                        width: 87,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE5EF),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    ),
                    // alignment: Alignment.center,
                  ),
                if (funFact.tag2 != null &&
                    funFact.tag2 != 'na' &&
                    funFact.tag2 != '')
                  Container(
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          funFact.tag2,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                        width: 87,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE5EF),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    ),
                    // alignment: Alignment.center,
                  ),
                if (funFact.tag3 != null &&
                    funFact.tag3 != 'na' &&
                    funFact.tag3 != '')
                  Container(
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          funFact.tag3,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                        width: 87,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE5EF),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    ),
                    // alignment: Alignment.center,
                  )
              ]),
            ]));
  }
}
