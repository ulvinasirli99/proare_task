import 'package:flutter/material.dart';

import '../../domain/model/cat_fact_model.dart';

class CachedCatComponent extends StatelessWidget {
  final CatFactResponseModel catFactResponseModel;
  const CachedCatComponent({Key? key, required this.catFactResponseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        children: [
          Text(
            'Fact : ${catFactResponseModel.text}',
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Created Date : ${catFactResponseModel.createdAt}'),
        ],
      ),
    );
    ;
  }
}
