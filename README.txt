# Widget Whims
*A cozy virtual pet game starring Widget*

## What does it do?
Widget Whims is a virtual simulation where players can interact with Widget by talking to her, playing small activities, and exploring a cute, cozy environment. Keep her fed, clean, rested, and happy, earn coins from minigames, spend them in the shop, and dress her up. It's meant to be a lighthearted, relaxing experience that celebrates the WiC community.

Built for WiCHacks 2026.

**Please note:** [Tested on Windows and in the browser. Add anything else you tested.]

## Why did we make this?
We were inspired by the mascot of Rochester Institute of Technology's Women in Computing community and wanted to make something silly, cute, and whimsical centered around Widget.

## How to play

### Option 1: Run the Windows version
Download the files in `builds/windows/` and keep them in the same folder:
- `WidgetWhims.exe` (the game)
- `WidgetWhims.pck` (the game data, which must sit next to the exe)
- `WidgetWhims.console.exe` (optional, shows a debug console)

Double-click `WidgetWhims.exe` to start.

### Option 2: Run it from source
1. Install [Godot 4](https://godotengine.org/download).
2. Clone this repo.
3. Open Godot, click Import, and select `project.godot`.
4. Press Play.

When you first run it, you'll land on the title screen. 
[image here]

## Gameplay
- **Care for Widget:** feed her, give her water, let her sleep, and give her a bath. Her stats slowly decay, so keep an eye on them.
- **Play minigames:** earn coins by playing the minigames. [Describe each minigame briefly.]
- **Visit the shop:** spend coins on items and outfits.
- **Dress up:** customize Widget with what you buy.
- **Reach the ending:** [Describe what triggers the ending and game over screens.]

### Controls
- Click the buttons on screen to interact with Widget.
- Use WASD to move Widget in the Shopping minigame.
- Hover over items on screen with mouse in the Bug Catch minigame.


## Project structure
```
WicHACKS2026/
├── assets/              Art, fonts, and audio
│   ├── fonts/
│   └── textures/
├── source/              Scenes and scripts
│   ├── gameplay/
│   ├── levels/
│   ├── minigames/
│   └── ui/
├── builds/              Exported versions of the game
│   ├── web/
│   └── windows/
├── project.godot
└── README.md
```

## How did we build it?
We built the game using Godot 4 and programmed the game logic in GDScript. The art uses the Super Adorable and Super Shiny fonts. [Add credits for any other tools used for the art.]

## Challenges we ran into
Since this was everyone's first time using Godot, we had to learn the engine and its scripting language from scratch. One of our members was also new to game development in general, so there was a learning curve in understanding game architecture, scene management, and debugging. We also worked on connecting the project repository to GitHub for version control and collaboration. Later we reorganized the repo into separate assets, source, and build folders to keep it manageable.

## Accomplishments that we're proud of
The game actually works! We were able to implement playable interactions, and we're really happy with how cute and polished the UI looks.

## What we learned
We learned a lot about Godot's workflow, scene system, and GDScript programming. We also learned how to properly set up and upload a Godot project to GitHub for version control and collaboration.

## Team
[users]
