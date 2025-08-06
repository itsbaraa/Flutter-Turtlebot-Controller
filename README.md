# ROS2 TurtleBot Controller

A Flutter application to control a turtlesim robot using a ROS2 websocket bridge.

## Prerequisites

- Flutter SDK
- ROS2 installed and configured
- A running turtlesim instance

## How to Use

1.  **Start the ROS2 WebSocket Bridge**:
    Open a terminal and run the following command to start the `rosbridge_server`:
    ```bash
    ros2 launch rosbridge_server rosbridge_websocket_launch.xml
    ```
2. **Start the turtlesim node:**
   ```bash
   ros2 run turtlesim turtlesim_node
   ```

4.  **Configure the IP Address**:
    Open the `lib/services/ros_service.dart` file and update the IP address to match the machine running the ROS2 websocket bridge.

    ```dart
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://<YOUR-ROS2-IP-ADDRESS>:9090'),
    );
    ```

5.  **Run the Flutter App**:
    Connect a device or start an emulator, and then run the following command in your terminal:
    ```bash
    flutter run
    ```

The application will launch, and you can use the on-screen buttons to control the turtlesim robot.

## Screenshot
<img width="1919" height="975" alt="image" src="https://github.com/user-attachments/assets/211ee488-c2c3-41e0-8071-80d9cabcb1d6"/>
