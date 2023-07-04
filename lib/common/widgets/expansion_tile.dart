import 'package:flutter/material.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/titles.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({super.key, required this.text, required this.text2, this.onExpansionChanged, this.trailing, required this.children});

  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kBkLight,
        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
      ),
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: BottomTitles(
              text: text,
              text2: text2,
            ),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            onExpansionChanged: onExpansionChanged,
            trailing: trailing,
            controlAffinity: ListTileControlAffinity.trailing,
            children: children,
          )),
    );
  }
}
