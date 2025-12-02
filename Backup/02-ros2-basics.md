<!-- ---
id: ros2-basics
title: ROS2 Basics
sidebar_label: ROS2 Basics
---

# ROS2 Basics

ROS 2 (Robot Operating System 2) is a flexible framework for writing robot software. It's a collection of tools, libraries, and conventions that aim to simplify the task of creating complex and robust robot behaviors across a wide variety of robotic platforms.

### Key Concepts in ROS 2:

*   **Nodes**: Executable processes that perform computation (e.g., a node to control a motor, a node to read sensor data).
*   **Topics**: A named bus over which nodes exchange messages. Nodes can publish messages to a topic or subscribe to messages from a topic.
*   **Messages**: Data structures used by nodes to communicate with each other over topics.
*   **Services**: A request/reply mechanism, where a client node sends a request to a service-server node, and the service-server node sends a response back.
*   **Actions**: For long-running tasks, similar to services but with continuous feedback during execution.
*   **Packages**: The primary unit for organizing ROS 2 software, containing nodes, libraries, configuration files, and other resources.

ROS 2 provides a standardized way for different software components to interact, making it easier to build and integrate complex robotic systems. -->