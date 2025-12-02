const fs = require('fs');
const path = require('path');

// The Full Curriculum from the Hackathon Video
const curriculum = [
  {
    folder: '01-Module-1-Intro',
    chapters: [
      '01-what-is-physical-ai',
      '02-the-rise-of-physical-ai',
      '03-agentic-workflows',
      '04-real-world-applications'
    ]
  },
  {
    folder: '02-Module-2-Hardware',
    chapters: [
      '01-anatomy-of-robot',
      '02-sensors-and-perception',
      '03-actuators-and-motors',
      '04-nvidia-jetson-setup'
    ]
  },
  {
    folder: '03-Module-3-ROS2',
    chapters: [
      '01-intro-to-ros2',
      '02-nodes-and-topics',
      '03-services-and-actions',
      '04-publishers-and-subscribers',
      '05-custom-interfaces'
    ]
  },
  {
    folder: '04-Module-4-Computer-Vision',
    chapters: [
      '01-intro-robot-vision',
      '02-opencv-fundamentals',
      '03-yolo-object-detection',
      '04-depth-estimation'
    ]
  },
  {
    folder: '05-Module-5-Simulation',
    chapters: [
      '01-intro-reinforcement-learning',
      '02-isaac-sim-setup',
      '03-urdf-robot-modeling',
      '04-sim-to-real-transfer'
    ]
  }
];

const docsDir = path.join(__dirname, 'physical-ai-book/docs'); // Adjust path if needed

// Ensure docs folder exists
if (!fs.existsSync(docsDir)) {
    console.log("Error: Could not find 'docs' folder. Make sure you run this in the root.");
    process.exit(1);
}

curriculum.forEach(module => {
    const modulePath = path.join(docsDir, module.folder);
    
    // Create Module Folder
    if (!fs.existsSync(modulePath)) {
        fs.mkdirSync(modulePath);
        console.log(`Created Folder: ${module.folder}`);
    }

    // Create Chapter Files
    module.chapters.forEach(chapter => {
        const fileName = `${chapter}.mdx`;
        const filePath = path.join(modulePath, fileName);
        
        // Only create if it doesn't exist (don't overwrite your work)
        if (!fs.existsSync(filePath)) {
            const title = chapter.split('-').slice(1).map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
            const content = `---
title: ${title}
sidebar_label: ${title}
---

# ${title}

:::info Status
This chapter is currently being written by the AI Agent.
:::

## Overview
Coming soon...

<Quiz 
  question="Is this chapter ready?" 
  options={["Yes", "No", "Generating..."]} 
  answerIndex={2} 
/>
`;
            fs.writeFileSync(filePath, content);
            console.log(`  -> Created File: ${fileName}`);
        }
    });
});

console.log("\n✅ Complete Book Structure Generated Successfully!");