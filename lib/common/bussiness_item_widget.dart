import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BussinessItemWidget extends StatelessWidget {
  const BussinessItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  'Dante\'s Food',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  maxFontSize: 30,
                  minFontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AutoSizeText(
                      '1st Street New York',
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 2,
                      ),
                      maxLines: 1,
                      maxFontSize: 25,
                      minFontSize: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 35,
                      ),
                    )
                  ],
                ),
                const AutoSizeText(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/logoTest.png'),
            ),
          ],
        ),
      ),
    );
  }
}
