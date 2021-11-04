import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BussinessItemWidget extends StatelessWidget {
  const BussinessItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
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
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Dante\'s Food',
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      maxFontSize: 30,
                      minFontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      '1st Street New York',
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 2,
                      ),
                      maxLines: 1,
                      maxFontSize: 25,
                      minFontSize: 10,
                    ),
                    AutoSizeText(
                      'Comida tipica Italiana,',
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
                width: MediaQuery.of(context).size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/logoTest.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
