import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iboss_flutter/model/menu_items_list.dart';
import 'package:iboss_flutter/screens/credit_page/credit_review.dart';
import 'package:iboss_flutter/utils/custom_color.dart';

class MorePages extends StatefulWidget {
  @override
  State<MorePages> createState() => _MorePagesState();
}

class _MorePagesState extends State<MorePages> {
  // selected's value = 0. For default first item is open.
  int selected = 0; //attention
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Container(
              color: ColorConstants.dividerColor,
              height: 1.0,
            )),
        title: const Text(
          "Menu List",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menuListItems.length,
          itemBuilder: (context, index) =>
              menuList(menuListItems[index], index),
        ),
      ),
    );
  }

  Widget menuList(MenuListItems list, int index) {
    // if (list.submenuTitle.isEmpty) {
    //   return Builder(builder: (context) {
    //     return ListTile(
    //       onTap: () {
    //         // debugPrint("I was clicked");
    //         // setState(() {
    //         //   _isExpanded = !_isExpanded;
    //         // });
    //       },
    //     );
    //   });
    // }
    return Card(
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        // key: Key(index.toString()),
        // initiallyExpanded: index == selected, //attention
        title: Text(
          list.menuTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        childrenPadding: const EdgeInsets.only(left: 20, right: 5),

        trailing: AnimatedRotation(
            turns: _isExpanded ? .5 : 0,
            duration: Duration(seconds: 1),
            child: const Icon(Icons.arrow_drop_down_circle_rounded)),
        // leading: const Icon(Icons.arrow_right_rounded),

        children: [
          ListView.separated(
            itemCount: list.submenuTitle.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) =>
                const Divider(height: 1, color: ColorConstants.dividerColor),
            itemBuilder: (context, index1) {
              return Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      list.submenuTitle[index1].menuTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        color: ColorConstants.indigoBrand,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 18)),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      print("pressed");
                      print("HI---> $index ----> $index1");
                      _navigateToNextScreen(context, index, index1);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
        // onExpansionChanged: ((newState) {
        //   if (newState) {
        //     setState(() {
        //       Duration(seconds: 2);
        //       selected = index;
        //     });
        //   } else {
        //     setState(() {
        //       selected = -1;
        //     });
        //   }
        // }),
        //list.submenuTitle.map(menuList).toList(),
      ),
    );
  }
}

void _navigateToNextScreen(
    BuildContext context, int parentPosition, int childPosition) {
  switch (parentPosition) {
    case 0:
      switch (childPosition) {
        case 0:
          break;
      }
      break;

    case 1:
      switch (childPosition) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreditReview()));
          break;
      }
      break;
  }
}
