import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class BoundedFrictionDemo extends StatefulWidget {
  const BoundedFrictionDemo({super.key});

  @override
  _BoundedFrictionDemoState createState() => _BoundedFrictionDemoState();
}

class _BoundedFrictionDemoState extends State<BoundedFrictionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  double _dragPosition = 0.0;
  double _dragVelocity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void _runFrictionSimulation(double velocity) {
    final simulation = BoundedFrictionSimulation(
      0.4, // 摩擦系数
      _dragPosition, // 初始位置
      velocity, // 初始速度
      -200, // 最小边界
      200, // 最大边界
    );

    _controller?.animateWith(simulation);
    _controller?.addListener(() {
      setState(() {
        _dragPosition = _controller!.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoundedFrictionSimulation Demo'),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            _dragPosition += details.delta.dx;
            _dragVelocity = details.primaryDelta ?? 0.0;
          });
        },
        onHorizontalDragEnd: (details) {
          _runFrictionSimulation(_dragVelocity);
        },
        onVerticalDragDown: (e){
          print('onVerticalDragDown$e');
        },
        child: Center(
          child: Transform.translate(
            offset: Offset(_dragPosition, 0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Drag Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

// class BoundedFrictionDemoPage extends StatelessWidget {
//   BoundedFrictionDemoPage({super.key});
//
//   final logic = Get.find<BoundedFrictionDemoLogic>();
//   final state = Get.find<BoundedFrictionDemoLogic>().state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('BoundedFriction'),),
//       body: GestureDetector(
//         onHorizontalDragUpdate: (details) {
//           state.dragPosition += details.delta.dx;
//           state.dragVelocity = details.primaryDelta ?? 0.0;
//         },
//         onHorizontalDragEnd: (details) {
//           // logic.runFrictionSimulation(state.dragVelocity);
//         },
//         child: Center(
//           child: Transform.translate(
//             offset: Offset(state.dragPosition, 0),
//             child: Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//               child: Center(
//                 child: Text(
//                   'Drag Me',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//     );
//   }
// }

//
// class BoundedFrictionDemoPage extends StatefulWidget {
//   const BoundedFrictionDemoPage({Key? key}) : super(key: key);
//
//   @override
//   State<BoundedFrictionDemoPage> createState() =>
//       _BoundedFrictionDemoPageState();
// }
//
// class _BoundedFrictionDemoPageState extends State<BoundedFrictionDemoPage>
//     with SingleTickerProviderStateMixin {
//   final logic = Get.find<BoundedFrictionDemoLogic>();
//   final state = Get.find<BoundedFrictionDemoLogic>().state;
//
//   AnimationController? _controller;
//   Animation<double>? _animation;
//   double _dragPosition = 0.0;
//   double _dragVelocity = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }
//
//   void _runFrictionSimulation(double velocity) {
//     final simulation = BoundedFrictionSimulation(
//       0.1, // 摩擦系数
//       _dragPosition, // 初始位置
//       velocity, // 初始速度
//       -200, // 最小边界
//       200, // 最大边界
//     );
//
//     _controller?.animateWith(simulation);
//     _controller?.addListener(() {
//       setState(() {
//         _dragPosition = _controller!.value;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BoundedFrictionSimulation Demo'),
//       ),
//       body: GestureDetector(
//         onHorizontalDragUpdate: (details) {
//           setState(() {
//             _dragPosition += details.delta.dx;
//             _dragVelocity = details.primaryDelta ?? 0.0;
//           });
//         },
//         onHorizontalDragEnd: (details) {
//           _runFrictionSimulation(_dragVelocity);
//         },
//         child: Center(
//           child: Transform.translate(
//             offset: Offset(_dragPosition, 0),
//             child: Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//               child: Center(
//                 child: Text(
//                   'Drag Me',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }
