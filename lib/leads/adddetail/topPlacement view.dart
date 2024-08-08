import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:leadkart/helper/helper.dart';

import '../../helper/dimention.dart';


class TopPlacementView extends StatelessWidget {
  Map data;
  TopPlacementView({required this.data,super.key});

  @override
  Widget build(BuildContext context) {
    
    List? _d = data["data"];
    if(_d==null||_d.length==0)
      {
        return const  Center(child: Text("No Data"),);
      }

    String charddata ="";

    _d.forEach((i){
      charddata = charddata+"{value: ${i["impressions"]}, name: '${MyHelper.titleFormate(i["platform_position"])}', color: 'grey'},";
    });

    return Column(
      children: [

        SizedBox(
          child: Echarts(
            option: '''
      {
        title: {
          left: 'center',
        },
        tooltip: {
          trigger: 'item',
          formatter: function(params, ticket, callback) {
          
            if (params.name === 'Instagram video') {
              return 'Instagram Video: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Feed 1') {
              return 'Feed 1: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Feed 2') {
              return 'Feed 2: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Video feed') {
              return 'Video Feed: ' + params.value + ' (' + params.percent + '%)';
            } else if (params.name === 'Feed 3') {
              return 'Feed 3: ' + params.value + ' (' + params.percent + '%)';
            }
            
           return params.name + ' ' + params.value + ' (' + params.percent + '%)';
           
          }
        },
        series: [
          {
            name: 'Sales',
            type: 'pie',
            radius: '50%',
            data: [
            $charddata,
              // {value: 820, name: 'Instagram video', color: 'grey'},
              
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
           
          height:  SC.from_height(300),
        )

      ],
    );
  }
}
