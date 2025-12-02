#!/bin/bash
set -e

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install jq to run this script."
    echo "On Debian/Ubuntu: sudo apt-get install jq"
    echo "On macOS: brew install jq"
    echo "On Windows (with Git Bash): pacman -S jq"
    exit 1
fi

# Define base paths
BOOK_ROOT="physical-ai-book"
DOCS_DIR="$BOOK_ROOT/docs"
SPECS_DIR="specs"

echo "Setting up project structure..."

# Create initial directories
mkdir -p "$DOCS_DIR"
mkdir -p "$SPECS_DIR"

# JSON data from the curriculum
JSON_DATA='[
    {
      "module": 1,
      "title": "Introduction to Physical AI & Agentic Workflows",
      "chapters": [
        {
          "chapter_number": "1.1",
          "title": "What is Physical AI?",
          "topics": [
            "ELI5: Bridging AI and the Physical World",
            "Technical Definition and Core Concepts",
            "Historical Context and Evolution"
          ]
        },
        {
          "chapter_number": "1.2",
          "title": "The Rise of Physical AI",
          "topics": [
            "Confluence of AI, Robotics, and IoT",
            "Enabling Technologies (Sensors, Compute, Algorithms)",
            "Impact on Industries and Daily Life"
          ]
        },
        {
          "chapter_number": "1.3",
          "title": "Agentic Workflows: The Robot Mindset",
          "topics": [
            "Definition of Agentic Workflows in Robotics",
            "Perception-Planning-Action Loop",
            "Cognitive Architectures for Robots"
          ]
        },
        {
          "chapter_number": "1.4",
          "title": "Real-World Applications of Physical AI",
          "topics": [
            "Humanoid Robotics and Collaborative Robots",
            "Autonomous Vehicles and Drones",
            "Industrial Automation and Logistics",
            "Healthcare and Exploration"
          ]
        }
      ]
    },
    {
      "module": 2,
      "title": "The Hardware (Sensors, Actuators, Jetsons)",
      "chapters": [
        {
          "chapter_number": "2.1",
          "title": "Anatomy of a Robot: Hardware Fundamentals",
          "topics": [
            "Beyond the Abstract: Physical Components",
            "Introduction to Sensing, Actuation, and Computation",
            "Robot Kinematics and Dynamics (Overview)"
          ]
        },
        {
          "chapter_number": "2.2",
          "title": "Robot Sensors: Perceiving the World",
          "topics": [
            "Proprioceptive Sensors (Encoders, IMUs, Force Sensors)",
            "Exteroceptive Sensors (Cameras, LiDAR, Depth Sensors, Ultrasonic)",
            "Sensor Data Acquisition, Fusion, and Noise Reduction"
          ]
        },
        {
          "chapter_number": "2.3",
          "title": "Robot Actuators: Bringing Movement to Life",
          "topics": [
            "Electric Motors (DC, Servo, Stepper) and their Control",
            "Pneumatic and Hydraulic Actuators",
            "Grippers, End-Effectors, and Manipulators"
          ]
        },
        {
          "chapter_number": "2.4",
          "title": "Embedded Computing: NVIDIA Jetson Series",
          "topics": [
            "AI at the Edge: Why Embedded Systems?",
            "Jetson Architecture Overview (GPU, CPU, Memory)",
            "Setting Up the Jetson Development Environment",
            "Deploying Basic AI Models on Jetson"
          ]
        }
      ]
    },
    {
      "module": 3,
      "title": "ROS2 (Robot Operating System) Basics",
      "chapters": [
        {
          "chapter_number": "3.1",
          "title": "Introduction to ROS2",
          "topics": [
            "ELI5: The Operating System for Robots",
            "Why ROS2? Features and Benefits",
            "ROS1 vs. ROS2: Key Differences and Improvements"
          ]
        },
        {
          "chapter_number": "3.2",
          "title": "Core ROS2 Concepts",
          "topics": [
            "Nodes: The Fundamental Executables (Analogy: People in a Chat Room)",
            "Topics: Asynchronous Data Communication (Analogy: Chat Messages)",
            "Services: Synchronous Request-Response (Analogy: Asking a Question)",
            "Actions: Long-Running Tasks with Feedback (Analogy: Ordering Food)",
            "Parameters: Dynamic Configuration of Nodes"
          ]
        },
        {
          "chapter_number": "3.3",
          "title": "Setting Up Your ROS2 Workspace",
          "topics": [
            "Installing ROS2 (Humble Hawksbill or Rolling Ridge)",
            "Creating and Managing a Colcon Workspace",
            "Building and Sourcing ROS2 Packages"
          ]
        },
        {
          "chapter_number": "3.4",
          "title": "Developing with ROS2: Publishers and Subscribers",
          "topics": [
            "Creating Your First ROS2 Package (Python and C++)",
            "Writing a Simple Publisher Node",
            "Writing a Simple Subscriber Node",
            "Running and Introspecting ROS2 Nodes (RCLCLI Tools)"
          ]
        },
        {
          "chapter_number": "3.5",
          "title": "Advanced ROS2 Communication and Launching",
          "topics": [
            "ROS2 Interfaces: Messages, Services, Actions",
            "Working with Custom Interfaces",
            "Using Launch Files for Complex Systems",
            "ROS2 Networks and Distributed Systems"
          ]
        }
      ]
    },
    {
      "module": 4,
      "title": "Computer Vision for Robots",
      "chapters": [
        {
          "chapter_number": "4.1",
          "title": "Introduction to Robot Vision",
          "topics": [
            "How Robots 'See': Principles of Computer Vision",
            "Importance of Vision in Robotic Tasks",
            "Basic Image Representation (Pixels, Channels, Color Spaces)"
          ]
        },
        {
          "chapter_number": "4.2",
          "title": "Image Processing Fundamentals with OpenCV",
          "topics": [
            "Getting Started with OpenCV (Python)",
            "Basic Image Manipulations (Resize, Crop, Rotate)",
            "Filtering (Blurring, Edge Detection)",
            "Color Space Conversions and Thresholding"
          ]
        },
        {
          "chapter_number": "4.3",
          "title": "Object Detection for Robotics",
          "topics": [
            "Traditional Object Detection Methods (e.g., Feature Matching, Haar Cascades)",
            "Deep Learning-Based Object Detection (YOLO, SSD, Faster R-CNN)",
            "Training and Deploying Models on NVIDIA Jetson",
            "Real-Time Object Detection Challenges"
          ]
        },
        {
          "chapter_number": "4.4",
          "title": "Object Tracking and Recognition",
          "topics": [
            "Methods for Tracking Objects (e.g., Kalman Filters, MOSSE, CSRT)",
            "Multi-Object Tracking",
            "Facial and Gesture Recognition for HRI"
          ]
        },
        {
          "chapter_number": "4.5",
          "title": "3D Vision and Pose Estimation",
          "topics": [
            "Depth Sensors and Point Clouds",
            "3D Reconstruction Techniques",
            "Camera Calibration and Stereo Vision",
            "Estimating Object Pose in 3D Space (2D-to-3D, 3D-to-3D Alignment)"
          ]
        }
      ]
    },
    {
      "module": 5,
      "title": "Reinforcement Learning & Simulation (Isaac Sim)",
      "chapters": [
        {
          "chapter_number": "5.1",
          "title": "Introduction to Reinforcement Learning",
          "topics": [
            "Learning Through Trial and Error: Core Idea",
            "Components of RL: Agent, Environment, State, Action, Reward",
            "Markov Decision Processes (MDPs) and Bellman Equations"
          ]
        },
        {
          "chapter_number": "5.2",
          "title": "Fundamental RL Algorithms",
          "topics": [
            "Value-Based Methods: Q-Learning and SARSA",
            "Policy-Based Methods: Policy Gradients",
            "Actor-Critic Methods: Proximal Policy Optimization (PPO)",
            "Exploration vs. Exploitation Trade-off"
          ]
        },
        {
          "chapter_number": "5.3",
          "title": "Robot Simulation with NVIDIA Isaac Sim",
          "topics": [
            "Why Simulation for Robotics and RL?",
            "Overview of NVIDIA Isaac Sim: Features and Capabilities",
            "Setting Up and Navigating the Isaac Sim Environment",
            "Creating Custom Environments and Assets"
          ]
        },
        {
          "chapter_number": "5.4",
          "title": "Integrating ROS2 with Isaac Sim",
          "topics": [
            "ROS2 Bridge: Connecting Real-World and Simulation",
            "Controlling Robots in Isaac Sim via ROS2",
            "Sensor Data Streaming from Sim to ROS2",
            "Building Complex Robotic Systems in Simulation"
          ]
        },
        {
          "chapter_number": "5.5",
          "title": "Training RL Agents in Simulation & Sim-to-Real",
          "topics": [
            "Designing Reward Functions for Robotic Tasks",
            "Training RL Agents within Isaac Sim (OmniIsaacGymRL)",
            "Analyzing Training Performance and Debugging",
            "Sim-to-Real Transfer: Challenges, Strategies, and Domain Randomization"
          ]
        }
      ]
    }
  ]'

# Loop through modules
echo "$JSON_DATA" | jq -c '.[0][]' | while read -r module_json; do
    MODULE_NUM=$(echo "$module_json" | jq -r '.module')
    MODULE_TITLE=$(echo "$module_json" | jq -r '.title')

    # Format module number with leading zero
    FORMATTED_MODULE_NUM=$(printf "%02d" "$MODULE_NUM")

    # Create module directory in docs
    MODULE_DOCS_DIR="$DOCS_DIR/module-$FORMATTED_MODULE_NUM"
    mkdir -p "$MODULE_DOCS_DIR"
    echo "Created docs directory: $MODULE_DOCS_DIR"

    # Create module directory in specs
    MODULE_SPECS_DIR="$SPECS_DIR/module-$FORMATTED_MODULE_NUM"
    mkdir -p "$MODULE_SPECS_DIR"
    echo "Created specs directory: $MODULE_SPECS_DIR"

    # Loop through chapters
    echo "$module_json" | jq -c '.chapters[]' | while read -r chapter_json; do
        CHAPTER_NUMBER=$(echo "$chapter_json" | jq -r '.chapter_number')
        CHAPTER_TITLE=$(echo "$chapter_json" | jq -r '.title')

        # Slugify the chapter title for filenames
        SLUGIFIED_TITLE=$(echo "$CHAPTER_TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')

        # Create MDX file for the chapter
        MDX_FILE="$MODULE_DOCS_DIR/chapter-$CHAPTER_NUMBER-$SLUGIFIED_TITLE.mdx"
        touch "$MDX_FILE"
        echo "Created MDX file: $MDX_FILE"

        # Create Spec file for the chapter
        SPEC_FILE="$MODULE_SPECS_DIR/chapter-$CHAPTER_NUMBER-spec.md"
        touch "$SPEC_FILE"
        echo "Created Spec file: $SPEC_FILE"
    done
done

echo "Project scaffolding complete. You can now run ./setup_book.sh"