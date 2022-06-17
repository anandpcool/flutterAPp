
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowFullScreenDialod extends StatefulWidget {
  @override
  State<ShowFullScreenDialod> createState() => _ShowFullScreenDialodState();
}

class _ShowFullScreenDialodState extends State<ShowFullScreenDialod> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Dialog"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(this.context, false);
            },
            child: Text("Cancel")),
        TextButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.pop(this.context, false);
          },
        )
      ],
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                     // title: Text(0![index].displayValue.toString()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  }

