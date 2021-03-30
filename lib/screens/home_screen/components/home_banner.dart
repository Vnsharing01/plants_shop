import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// banner & Search widget
class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Plant shop",
            style: GoogleFonts.cormorantUpright(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.green[900],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green[900]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 190,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      hintText: "Sreach",
                      hintStyle: TextStyle(fontSize: 13),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_outlined),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
