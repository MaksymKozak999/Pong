[README.md](https://github.com/user-attachments/files/29892623/README.md)
# Pong

A 2D Pong game built with **Lua** and the **LÖVE2D** framework, inspired by Harvard's CS50 Introduction to Game Development course, with custom features and improvements.

## About

This project recreates the classic Pong game, featuring smooth paddle movement, ball physics with increasing speed on each hit, sound effects, and a simple AI opponent.

## Features

- Player vs. AI gameplay
- Increasing ball speed after each paddle hit
- Randomized ball bounce angles for varied rallies
- Wall and paddle collision sound effects
- Pause functionality
- Win condition at 5 points
- Retro pixel-style fonts (Minecraft & pixel fonts)
- Resizable window with resolution scaling via `push.lua`
- On-screen FPS counter

## Controls

| Key | Action |
|---|---|
| `W` | Move left paddle (Player 1) up |
| `S` | Move left paddle (Player 1) down |
| `Space` / `Enter` | Start game / return to menu after a win |
| `P` | Pause / unpause the game |
| `Esc` | Quit the game |

Player 2's paddle is controlled by a simple AI that tracks the ball's vertical position.

## Requirements

- [LÖVE2D](https://love2d.org/) (version 11.x recommended)

## Installation & Running

1. Install LÖVE2D from [love2d.org](https://love2d.org/).
2. Clone this repository:
   ```bash
   git clone https://github.com/MaksymKozak999/Pong.git
   cd Pong
   ```
3. Run the game:
   - **Windows:** Drag the project folder onto `love.exe`, or run:
     ```bash
     "C:\Program Files\LOVE\love.exe" .
     ```
   - **macOS/Linux:**
     ```bash
     love .
     ```

## Project Structure

```
Pong/
├── main.lua        # Game loop, states, input handling, rendering
├── Ball.lua        # Ball class (movement, collision, reset)
├── Paddle.lua      # Paddle class (movement, rendering)
├── class.lua       # Lightweight OOP class implementation
├── push.lua        # Resolution/virtual screen scaling library
├── Minecraft.ttf   # Custom pixel font
├── pixel.ttf       # Custom pixel font
└── sounds/         # Sound effects (paddle hit, wall hit, score, win)
```

## Credits

- Built as part of learning from Harvard's [CS50 Introduction to Game Development](https://cs50.harvard.edu/games/) course.
- Uses the [push](https://github.com/Ulydev/push) library for resolution handling.

## License

No license has been specified for this project yet. Consider adding one (e.g., MIT) if you plan to share or accept contributions.
