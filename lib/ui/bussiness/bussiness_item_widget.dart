import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/model/bussiness.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class BussinessItemWidget extends StatelessWidget {
  final Bussiness bussiness;

  const BussinessItemWidget(this.bussiness);

  void showBussinessInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      builder: (_) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBussinessInfo(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: screenWidth(context) * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          bussiness.name,
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          maxFontSize: 30,
                          minFontSize: 25,
                          overflow: TextOverflow.fade,
                        ),
                        AutoSizeText(
                          bussiness.type,
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                          ),
                          maxLines: 1,
                          maxFontSize: 25,
                          minFontSize: 10,
                        ),
                        AutoSizeText(
                          bussiness.description,
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                          maxLines: 1,
                          maxFontSize: 20,
                          minFontSize: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/logoTest.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
