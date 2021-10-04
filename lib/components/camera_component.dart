import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CameraComponent extends StatelessWidget {
  const CameraComponent({Key? key, this.imgPath}) : super(key: key);

  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: ClipRect(clipBehavior: Clip.hardEdge,
              child: PhotoView(
                imageProvider: AssetImage(imgPath!),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => debugPrint('coming soon'),
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => debugPrint('coming soon'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/ruler.png',
                    height: 35,
                    width: 35,
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () => debugPrint('coming soon'),
              icon: Icon(
                Icons.fullscreen_exit,
                size: 32,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('5 um I', style: TextStyle(color: Colors.white)),
                  Text('130 um', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
