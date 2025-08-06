import 'package:flutter/material.dart';
import 'package:ros2/services/ros_service.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  late final RosService _rosService;

  @override
  void initState() {
    super.initState();
    _rosService = RosService();
  }

  @override
  void dispose() {
    _rosService.dispose();
    super.dispose();
  }

  void _moveForward() {
    final command = {
      'op': 'publish',
      'topic': '/turtle1/cmd_vel',
      'msg': {
        'linear': {'x': 2.0, 'y': 0.0, 'z': 0.0},
        'angular': {'x': 0.0, 'y': 0.0, 'z': 0.0}
      }
    };
    _rosService.sendCommand(command);
  }

  void _moveBackward() {
    final command = {
      'op': 'publish',
      'topic': '/turtle1/cmd_vel',
      'msg': {
        'linear': {'x': -2.0, 'y': 0.0, 'z': 0.0},
        'angular': {'x': 0.0, 'y': 0.0, 'z': 0.0}
      }
    };
    _rosService.sendCommand(command);
  }

  void _turnLeft() {
    final command = {
      'op': 'publish',
      'topic': '/turtle1/cmd_vel',
      'msg': {
        'linear': {'x': 0.0, 'y': 0.0, 'z': 0.0},
        'angular': {'x': 0.0, 'y': 0.0, 'z': 2.0}
      }
    };
    _rosService.sendCommand(command);
  }

  void _turnRight() {
    final command = {
      'op': 'publish',
      'topic': '/turtle1/cmd_vel',
      'msg': {
        'linear': {'x': 0.0, 'y': 0.0, 'z': 0.0},
        'angular': {'x': 0.0, 'y': 0.0, 'z': -2.0}
      }
    };
    _rosService.sendCommand(command);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ROS2 TurtleBot Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildControlButton(Icons.arrow_upward, _moveForward),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildControlButton(Icons.arrow_back, _turnLeft),
                const SizedBox(width: 50),
                _buildControlButton(Icons.arrow_forward, _turnRight),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildControlButton(Icons.arrow_downward, _moveBackward),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}