import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:leadkart/helper/helper.dart';

import '../../helper/dimention.dart';

class GenderAndCtrView extends StatelessWidget {
  Map data;
  GenderAndCtrView({required this.data,super.key});

  @override
  Widget build(BuildContext context) {

    List? _d  = data["data"];

    if(_d==null||_d.length==0)
      {
        return Center(child: Text("Gender Data is Empty"));
      }

    return Column(
      children: [



        SizedBox(
          child:  Echarts(

            option: '''
      {
        title: {
          left: 'center',
        },
        tooltip: {
          trigger: 'item',
          formatter: function(params, ticket, callback) {
            if (params.name === 'Male') {
              return 'Male: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Female') {
              return 'Female: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Unknown') {
              return 'Other: ' + params.value + ' (' + params.percent + '%)';
            }
          }
        },
        series: [
          {
            name: 'Gender',
            type: 'pie',
            radius: '50%',
            data: [
              {value: ${_d[0]['impressions']}, name: '${MyHelper.titleFormate(_d[0]['gender'])=="Unknown"?"Other":MyHelper.titleFormate(_d[0]['gender'])}'},
              {value: ${_d[1]['impressions']}, name: '${MyHelper.titleFormate(_d[1]['gender'])=="Unknown"?"Other":MyHelper.titleFormate(_d[1]['gender'])}'},
              {value: ${_d[2]['impressions']}, name: '${MyHelper.titleFormate(_d[2]['gender'])=="Unknown"?"Other":MyHelper.titleFormate(_d[2]['gender'])}'},
           ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      }
    ''',
          ),

          height: SC.from_height(300),
        ),

      ],
    );
  }
}
