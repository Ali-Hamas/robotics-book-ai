<!--
Sync Impact Report:
Version change: 0.0.0 (template) -> 1.0.0
Modified principles:
  - [PRINCIPLE_1_NAME] -> Spec-Driven Development
  - [PRINCIPLE_2_NAME] -> Interactive Content
  - [PRINCIPLE_3_NAME] -> Practical Code Examples
  - [PRINCIPLE_4_NAME] -> Modern Tech Stack
  - [PRINCIPLE_5_NAME] -> Comprehensive Syllabus Coverage
Added sections:
  - Technology Stack
  - Course Content
Removed sections:
  - None explicit, but principles 6 and guidance file placeholder removed.
Templates requiring updates:
  - .specify/templates/plan-template.md: ✅ updated (Constitution Check section will align)
  - .specify/templates/spec-template.md: ✅ updated (scope/requirements align with new principles)
  - .specify/templates/tasks-template.md: ✅ updated (task categorization reflects new principles)
  - CLAUDE.md: ✅ updated (references to principles align)
  - .specify/templates/commands/sp.constitution.md: ✅ updated (this command file itself)
Follow-up TODOs:
  - TODO(RATIFICATION_DATE): Needs to be set by project leads.
-->
# Physical AI and Humanoid Robotics Textbook Constitution

## Core Principles

### I. Spec-Driven Development
All development MUST follow the Spec -> Plan -> Task -> Implement workflow to ensure structured and well-thought-out features.

### II. Interactive Content
The textbook MUST include interactive elements, implemented as React components embedded within Markdown files.

### III. Practical Code Examples
Code examples MUST be practical, functional, and written in Python or C++ for ROS 2. They MUST be directly runnable and demonstrate real-world robotics concepts.

### IV. Modern Tech Stack
The project MUST utilize Docusaurus for the frontend, OpenAI ChatKit for the chat UI, and Qdrant for RAG capabilities.

### V. Comprehensive Syllabus Coverage
The textbook MUST cover the specified syllabus topics: Introduction to Physical AI & Humanoid Robotics, ROS 2 for Robotic Control, Gazebo Robot Simulator, NVIDIA Isaac AI Platform, Simulations with Unity & Conversational AI, and Deployment Projects.

## Technology Stack

The technology stack comprises Docusaurus (frontend), OpenAI ChatKit (chat UI), and Qdrant (RAG). All new development MUST integrate seamlessly with these technologies.

## Course Content

The content MUST align with the course syllabus: Introduction to Physical AI & Humanoid Robotics (Real-world physics, perception), ROS 2 for Robotic Control (Control systems, nodes), Gazebo Robot Simulator (Simulating physics and environments), NVIDIA Isaac AI Platform (Digital twins, Isaac Sim), Simulations with Unity & Conversational AI, and Deployment Projects.

## Governance

All amendments to this constitution MUST be documented, approved by the project leads, and include a migration plan if principles are changed. Compliance with these principles MUST be verified during code reviews and quality gates.

**Version**: 1.0.0 | **Ratified**: TODO(RATIFICATION_DATE): Needs to be set by project leads. | **Last Amended**: 2025-11-30
