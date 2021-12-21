import 'package:flutter/material.dart';
import 'dart:ui';

class Doreme extends StatefulWidget {
  const Doreme({ Key? key }) : super(key: key);

  @override
  _DoremeState createState() => _DoremeState();
}

class _DoremeState extends State<Doreme> with SingleTickerProviderStateMixin{

       bool now = false;
  AnimationController? _controller;
  Animation? _animation;
  late Path _path1;
  late Path _path2;
  late Path _path3;
  late Path _path4;
  late Path _path5;
  late Path _path6;
  late Path _path7;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.reset();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    _path1 = drawPath1(width, heigth);
    _path2 = drawPath2(width, heigth);
    _path3 = drawPath3(width, heigth);
    _path4 = drawPath4(width, heigth);
    _path5 = drawPath5(width, heigth);
    _path6 = drawPath6(width, heigth);
    _path7 = drawPath7(width, heigth);

    void didUpdateWidget() {
      _controller!.forward();
    }

    void back() {
      _controller!.reverse();
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        back();
        now = false;
        print("ges");
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.red,
              ),
            ),
            now == true
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.3),
                  )
                : Container(),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: PathPainter(_path1),
              ),
            ),
            Positioned(
              top: calculate(_animation!.value, _path1).dy,
              left: calculate(_animation!.value, _path1).dx,
              child: InkWell(
                onTap: () {},
                child: Container(
                  child: Image.asset("assets/ic_black_hours.png"),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50)),
                  width: 65,
                  height: 65,
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: PathPainter(_path2),
              ),
            ),
            Positioned(
              top: calculate(_animation!.value, _path2).dy,
              left: calculate(_animation!.value, _path2).dx,
              child: Container(
                child: Image.asset("assets/ic_black_hours.png"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50)),
                width: 65,
                height: 65,
              ),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: PathPainter(_path3),
              ),
            ),
            Positioned(
              top: calculate(_animation!.value, _path3).dy,
              left: calculate(_animation!.value, _path3).dx,
              child: Container(
                child: Image.asset("assets/ic_black_hours.png"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50)),
                width: 65,
                height: 65,
              ),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: PathPainter(_path4),
              ),
            ),
            Positioned(
              top: calculate(_animation!.value, _path4).dy,
              left: calculate(_animation!.value, _path4).dx,
              child: Container(
                child: Image.asset("assets/ic_black_hours.png"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50)),
                width: 65,
                height: 65,
              ),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: PathPainter(_path5),
              ),
            ),
            Positioned(
              top: calculate(_animation!.value, _path5).dy,
              left: calculate(_animation!.value, _path5).dx,
              child: Container(
                child: Image.asset("assets/ic_black_hours.png"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50)),
                width: 65,
                height: 65,
              ),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: PathPainter(_path6),
              ),
            ),
            Positioned(
              top: calculate(_animation!.value, _path6).dy,
              left: calculate(_animation!.value, _path6).dx,
              child: Container(
                child: Image.asset("assets/ic_black_hours.png"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50)),
                width: 65,
                height: 65,
              ),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: PathPainter(_path7),
              ),
            ),
            Positioned(
              top: calculate(_animation!.value, _path7).dy,
              left: calculate(_animation!.value, _path7).dx,
              child: Container(
                child: Image.asset("assets/images/ic_black_hours.png"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50)),
                width: 65,
                height: 65,
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 55, right: 55),
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 65,
                    child: InkWell(
                      onTap: () {
                        now == false
                            ? {didUpdateWidget(), now = true}
                            : {back(), now = false};
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Path drawPath1(double width, double height) {
    Size size = Size(width, height);
    Path path = Path();
    path.moveTo(size.width - 120, size.height - 120);
    path.quadraticBezierTo(size.width * 2 / 3, size.height / 2,
        (size.width * 2 / 6) - 32.5, (size.height * 1 / 3) - 32.5);
    return path;
  }

  Path drawPath2(double width, double height) {
    Size size = Size(width, height);
    Path path = Path();
    path.moveTo(size.width - 120, size.height - 120);
    path.quadraticBezierTo(size.width * 1 / 6, size.height * 2 / 3,
        (size.width * 4 / 6) - 32.5, (size.height * 1 / 3) - 32.5);
    return path;
  }

  Path drawPath3(double width, double height) {
    Size size = Size(width, height);
    Path path = Path();
    path.moveTo(size.width - 120, size.height - 120);
    path.quadraticBezierTo(size.width * 3 / 4, size.height / 2,
        (size.width * 1 / 6) - 32.5, (size.height * 1 / 2) - 32.5);
    return path;
  }

  Path drawPath4(double width, double height) {
    Size size = Size(width, height);
    Path path = Path();
    path.moveTo(size.width - 120, size.height - 120);
    path.quadraticBezierTo(size.width * 3 / 4, size.height / 2,
        (size.width * 3 / 6) - 32.5, (size.height * 1 / 2) - 32.5);
    return path;
  }

  Path drawPath5(double width, double height) {
    Size size = Size(width, height);
    Path path = Path();
    path.moveTo(size.width - 120, size.height - 120);
    path.quadraticBezierTo(size.width * 9 / 10, size.height / 2,
        (size.width * 5 / 6) - 32.5, (size.height * 1 / 2) - 32.5);
    return path;
  }

  Path drawPath6(double width, double height) {
    Size size = Size(width, height);
    Path path = Path();
    path.moveTo(size.width - 120, size.height - 120);
    path.quadraticBezierTo(size.width * 3 / 4, size.height / 2,
        (size.width * 2 / 6) - 32.5, (size.height * 2 / 3) - 32.5);

    return path;
  }

  Path drawPath7(double width, double height) {
    Size size = Size(width, height);
    Path path = Path();
    path.moveTo(size.width - 120, size.height - 120);
    path.quadraticBezierTo(size.width * 1 / 10, size.height * 9 / 10,
        (size.width * 4 / 6) - 32.5, (size.height * 2 / 3) - 32.5);
    return path;
  }

  Offset calculate(value, Path _path) {
    PathMetrics? pathMetrics = _path.computeMetrics();
    PathMetric? pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }
}

class PathPainter extends CustomPainter {
  Path path;
  PathPainter(this.path);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent.withOpacity(0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
    
  }