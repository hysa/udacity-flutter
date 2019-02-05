// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// This [Category]'s name.
  final String name;

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  var _text;
  var _unit;

  // TODO: Determine whether you need to override anything, such as initState()
  @override
  void initState() {
    super.initState();
  }

  // TODO: Add other helper functions. We've given you one, _format()
  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that
    // includes the input value, and 'from' unit [Dropdown].
    final input = Padding(
        padding: _padding,
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.display1,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.display1,
                  labelText: '入力',
//            errorText:
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0))),
              keyboardType: TextInputType.number,
              onChanged: _updateInputValue,
            ),
//            _createDropdown(null, null)
          ],
        ));

    // Create a compare arrows icon.
    final arrow =
        RotatedBox(quarterTurns: 1, child: Icon(Icons.compare_arrows));

    // Create the 'output' group of widgets. This is a Column that
    // includes the output value, and 'to' unit [Dropdown].
    final output = Padding(
        padding: _padding,
        child: Column(
          children: <Widget>[
            InputDecorator(
              child: Text(
                "output",
                style: Theme.of(context).textTheme.display1,
              ),
              decoration: InputDecoration(
                  labelText: '出力',
                  labelStyle: Theme.of(context).textTheme.display1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0))),
            )
          ],
        ));

    // TODO: Return the input, arrows, and output widgets, wrapped in a Column.

    // TODO: Delete the below placeholder code.
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return Container(
      child: Column(
        children: <Widget>[input, arrow, output],
      ),
    );
  }

  void _updateInputValue(String value) {}

  Widget _createDropdown(param0, param1) {
    return DropdownButton(items: null, onChanged: null);
  }
}
