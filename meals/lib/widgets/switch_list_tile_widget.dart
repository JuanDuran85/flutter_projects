// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SwitchListTileCustomWidget extends StatefulWidget {
  bool filterSetValue;
  String filterName;
  String filterSubName;
  SwitchListTileCustomWidget(
    this.filterSetValue,
    this.filterName,
    this.filterSubName, {
    super.key,
  });

  @override
  State<SwitchListTileCustomWidget> createState() =>
      _SwitchListTileCustomWidgetState();
}

class _SwitchListTileCustomWidgetState
    extends State<SwitchListTileCustomWidget> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.filterSetValue,
      onChanged: (newValue) {
        setState(() {
          widget.filterSetValue = newValue;
        });
      },
      title: Text(
        widget.filterName,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        widget.filterSubName,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
