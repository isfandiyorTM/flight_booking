import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationSettingSwitchWidget extends StatefulWidget {
  NotificationSettingSwitchWidget({
    super.key,
    required this.title,
  });

  String? title;
  bool light = true;

  @override
  State<NotificationSettingSwitchWidget> createState() =>
      _NotificationSettingSwitchWidgetState();
}

class _NotificationSettingSwitchWidgetState extends State<NotificationSettingSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:const EdgeInsets.all(0),
      title: Text(
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textBlack,
        ),
        widget.title!,
      ).tr(),
      trailing: Theme(
        data: ThemeData(
          useMaterial3: true,
        ).copyWith(
          colorScheme:
          Theme.of(context).colorScheme.copyWith(outline: Colors.white),
        ),
        child: Switch(
          value: widget.light,
          activeTrackColor: AppColors.blue,
          inactiveTrackColor: AppColors.lightGray,
          inactiveThumbColor: AppColors.white,
          onChanged: (value) => setState(() => widget.light = !value),
        ),
      ),
      shape: const Border(
          bottom: BorderSide(
            color: AppColors.lightGray,
          )),
    );
  }
}