import 'package:flutter/material.dart';
import 'package:snokie_shoe/viewmodel/detail_view_model.dart';

import '../../../reusable_widget/circle_button.dart';

class CounterWidget extends StatelessWidget {

  final DetailViewModel viewModel;
  const CounterWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Text("Quantity",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),),
        Spacer(),

        CircleButton(icon: Icons.remove, size: 36, iconSize: 26,circleColor: Colors.white,onClick: (){
          viewModel.onCount();
        },),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text("${viewModel.totalCount}",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),),
        ),
         CircleButton(icon: Icons.add, size: 36, iconSize: 26,circleColor: Colors.white,onClick: () {
          viewModel.onCount(true);
        },),
      ],
    );
  }
}
