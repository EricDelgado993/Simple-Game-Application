# Simple Game Application

## Overview
The **Simple Game Application** is a Lua-based game built with Solar2D, featuring **Esper**, a character controlled by player taps. The game includes sprite animations, sound effects, and a health system. Players tap on the screen to move Esper, who has a health system starting with 3 HP. Each tap on Esper reduces its health, triggering animations and sounds. Once Esper's HP reaches zero, a "game over" state is shown, and players can restart the game by tapping the "End" message. The game ensures smooth transitions, manages memory efficiently, and prevents animation interruptions.

## Project File
- [Simple Game Program](https://github.com/EricDelgado993/Simple-Game-Application/blob/main/Simple%20Game%20Application/main.lua)

## Features

### 1. Interactive Sprite Animations
- The main character, **Esper**, is displayed as a sprite with multiple animations (running, dying, dead).
- Animations are defined using sprite sheets and managed with `graphics.newImageSheet` and `display.newSprite`.

### 2. Tap-Based Movement
- Players can tap anywhere on the screen to move **Esper** to the tapped location.
- Movement is animated using the "run" sequence with smooth transitions to the new location.

### 3. Character Health (HP) System
- **Esper** starts with 3 health points (HP).
- Each tap on the character decreases its health, triggering different sound effects and animations.

### 4. Damage Response
- When the character is tapped, its HP decreases, triggering corresponding sound effects and animations.
- On the final tap, the "dead" animation is played, and the character fades out.

### 5. Sound Effects
- Different sound effects are played based on specific events, such as tapping the character or reaching the game over state.

### 6. End Game and Restart
- When **Esper's** HP reaches zero, an "End" message is displayed.
- Players can tap on the "End" message to restart the game.

### 7. Smooth Transitioning
- Movement and damage animations use transitions (`transition.to`) with easing functions to create smooth visual effects.

### 8. Automatic Object Deletion
- Once the character dies, it fades out over 2 seconds and is removed from memory to prevent further interactions.

### 9. Event Management
- Event listeners are used to handle screen taps and interactions with **Esper**.
- Animation interruptions are prevented using boolean flags (e.g., `isMoving`) to avoid event interference.

### 10. Dynamic Scaling and Positioning
- The **Esper** sprite is scaled and positioned at the screen's center, with dynamic adjustments to sprite bounds.

## Application Screenshot
![Screenshot](https://github.com/user-attachments/assets/1f3770c1-b54c-41f5-a82f-b42de38f68fc)
