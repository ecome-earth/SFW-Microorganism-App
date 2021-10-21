import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CameraComponent extends StatefulWidget {
  const CameraComponent({
    Key? key,
    required this.link,
    required this.initialController,
    required this.p1,
    required this.p2,
  }) : super(key: key);
  final PhotoViewController initialController;
  final String link;
  final Offset p1, p2;

  @override
  _CameraComponentState createState() => _CameraComponentState();
}

class _CameraComponentState extends State<CameraComponent> {
  PhotoViewController controller = PhotoViewController();
bool focused = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: CustomPaint(
                child: PhotoView(
                  imageProvider: NetworkImage(widget.link),
                  controller: controller,
                ),
                foregroundPainter: focused?FocusPainter(startPoint: this.widget.p1, endPoint: this.widget.p2):null,

              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (!focused){
                  focused= true;
                  controller=this.widget.initialController;
                  }
                  else{
                    focused = false;
                  }
                });

              },
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
        ],
      ),
    );
  }
}


class FocusPainter extends CustomPainter {
  final Offset startPoint;
  final Offset endPoint;
  FocusPainter({required this.startPoint, required this.endPoint});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.red
      ..style = PaintingStyle.stroke;
    canvas.drawRect(Rect.fromPoints(startPoint, endPoint), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}