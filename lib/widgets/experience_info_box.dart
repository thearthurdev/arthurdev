import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class ExperienceInfoBox extends StatelessWidget {
  const ExperienceInfoBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 560.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Solving problems, building apps'
            ' and automating processes have'
            ' always been a hobby of mine.',
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: kSectionHeaderTextStyle,
          ),
          SizedBox(height: 24.0),
          Text(
            'Now it\'s my job. You know what they'
            '\nsay about doing what you love...',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: kSectionInfoTextStyle,
          ),
          SizedBox(height: 32.0),
          Container(
            constraints: BoxConstraints(maxWidth: 340.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                experienceCounter(
                  years: '2',
                  type: 'Years of Professional Experience',
                  flex1: 1,
                  flex2: 2,
                ),
                experienceCounter(
                  years: '5+',
                  type: 'Years Developing Solutions',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget experienceCounter({String years, String type, int flex1, int flex2}) {
    return Flexible(
      child: Row(
        children: [
          Flexible(
            flex: flex1 ?? 1,
            child: Text(
              years,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: kActionButtonTextStyle.copyWith(fontSize: 56.0),
            ),
          ),
          SizedBox(width: 4.0),
          Flexible(
            flex: flex2 ?? 1,
            child: Text(
              type,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Bree Serif',
                fontSize: 11.0,
                letterSpacing: 1.2,
                height: 1.3,
                color: kPrimaryTextColorLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
