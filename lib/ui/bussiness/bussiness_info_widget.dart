import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/model/bussiness.dart';
import 'package:delivery_app/ui/common/maps.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class BussinessInfoWidget extends StatelessWidget {
  final Bussiness bussiness;

  BussinessInfoWidget({required this.bussiness});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            bussiness.name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            maxFontSize: 30,
            minFontSize: 25,
          ),
          AutoSizeText(
            bussiness.Address,
            style: TextStyle(fontSize: 20),
            maxFontSize: 20,
            minFontSize: 15,
            maxLines: 1,
          ),
          const SizedBox(
            height: 30,
          ),
          AutoSizeText(
            'Nuestros Productos',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            maxFontSize: 25,
            minFontSize: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: screenHeight(context) * 0.1,
            child: ListView.builder(
              itemCount: bussiness.Products.split(';').length,
              itemBuilder: (context, index) {
                return AutoSizeText(
                  '${bussiness.Products.split(';')[index].split('-')[1]} ${bussiness.Products.split(';')[index].split('-')[3]}',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 20,
                );
              },
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bussiness.Images.split(';').length,
                itemBuilder: (context, index) {
                  return Image.network(
                    bussiness.Images.split(';')[index],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Maps(bussiness),
            ),
          ),
        ],
      ),
    );
  }
}
