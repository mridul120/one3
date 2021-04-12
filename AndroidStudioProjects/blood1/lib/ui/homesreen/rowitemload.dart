
import 'package:flutter/cupertino.dart';
import '../../media.dart';
import '../Textfile.dart';



class rowitem extends StatelessWidget {
  ///******Widget make rowlist item view
  String _imagename;
  String _textname;
  Color color;
  rowitem(@required this._imagename, @required this._textname,[this.color]);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuerypage.smallSizeWidth*2,
        height: MediaQuerypage.smallSizeHeight*2,),
        Image(
          image: AssetImage(_imagename),
          height: MediaQuerypage.smallSizeHeight * 5,
          width: MediaQuerypage.smallSizeWidth * 4,
        ),
        Textfile(_textname,18,FontWeight.w600,color),
      ],
    );
  }
}
