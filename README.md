# Love2D Boilerplate in ECS Architecture

**LÖVE** is an _awesome_ framework you can use to make 2D games in Lua.

**ECS (Entity-Component-System) architecture** is a design pattern primarily used in game development that separates data (**Components**), behavior (**Systems**), and identity (**Entities**). This approach promotes flexible, data-driven design, making your game code modular and easier to manage.

Combined, LÖVE and ECS give you a powerful recipe for pure creativity with maximum freedom.

---

## lumara Branch

This branch is for game engine features that I want in my personal projects.

---

## 🧩 ECS Library

This project uses **[ecs-lua](https://github.com/nidorx/ecs-lua)** by **[nidorx](https://github.com/nidorx)**, which is included in the `lib` directory.

---

## 🏗️ Architecture

This boilerplate uses a clean, separated structure that is standard for LÖVE projects:

- **`main.lua`:** Minimal file acting as the entry point.
- **`src/game.lua`:** Contains all LÖVE callbacks (`love.update`, `love.draw`, etc.) and manages the ECS World.
- **`src/components/`:** Defines all **data** structures (e.g., Position, Velocity).
- **`src/systems/`:** Defines all **logic** that operates on Component groups (e.g., MovementSystem, RenderSystem).
- **`lib/`:** Contains the third-party ECS library.

---

## ⚙️ Requirements

- [Lua](https://www.lua.org/)
- [LÖVE2D Game Engine](https://www.love2d.org)

---

## 🚀 How to Run

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/pwhb/love2D-ecs-boilerplate
    ```
2.  **Run with LÖVE:**

    ```bash
    love love2D-ecs-boilerplate
    ```

3.  **Edit `src/game.lua` to share your dream with others!**

---

## ✍️ Contributing

Contributions (bug fixes, system examples) are welcome.
