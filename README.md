<b>Simple Game Application</b>
<br>This Lua-based Solar2D game features "Esper," a character controlled by player taps. The game uses sprite animations, sound effects, and a health system. Tapping the screen moves Esper to the tap location with a "run" animation. Each tap on the character reduces its health (starting at 3 HP), triggering different animations and sounds. When Esper's HP reaches zero, a "game over" state is displayed, and the player can restart the game by tapping an end message. The program ensures smooth transitions, prevents animation interruptions, and manages memory efficiently.</br>
<br><b>Project File</b></br>
  - [Simple Game Program](https://github.com/EricDelgado993/Transition-Effect-Application/blob/main/Transition%20Effect%20Application/main.lua)

<br><b>Features</b></br>
  - <b>Interactive Sprite Animations:</b> The main character ("Esper") is displayed as a sprite with different animations (running, dying, dead). The animation sequences are defined using sprite sheets and managed by graphics.newImageSheet and display.newSprite.
  - <b>Tap-Based Movement:</b> Players can tap on the screen to move the "Esper" character to the tap location. The movement is animated using the "run" sequence with smooth transitions to the new location.
  - <b>Character Health (HP) System:</b> "Esper" has an HP system that starts with 3 health points. Each tap on the character reduces its health, triggering different sound effects and animations.
  - <b>Damage Response:</b> When the character is tapped, its HP decreases, and different sound effects and animations are triggered based on the HP level. On the final hit, the "dead" animation is played, and the character fades out.
  - <b>Sound Effects:</b> Different sound effects are played based on specific events.
  - <b>End Game and Restart:</b> After the character's HP reaches zero, an "End" message appears on the screen. Players can tap on the "End" message to restart the game.
  - <b>Smooth Transitioning:</b> Movement and damage animations use transitions (transition.to) and easing functions to create smooth visual effects.
  - <b>Automatic Object Deletion:</b> Once the character dies, it fades out over 2 seconds and is removed from memory to prevent further interactions.
  - <b>Event Management:</b> Event listeners are used to handle screen taps and interactions with the character. Prevents event interference while animations are in progress by using boolean flags (isMoving).
  - <b>Dynamic Scaling and Positioning:</b> The character sprite is scaled up and positioned at the screen's center, with dynamic adjustments to sprite bounds.

<br><b>Application Screenshot</b></br>
![Screenshot](https://github.com/user-attachments/assets/0a5a88d2-07eb-42a3-b11f-6ff6b0ad2f9c)
