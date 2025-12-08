local ZOMBIE_ASSET_KEY = {
    image_path = "assets/zombie/walk.png",
    frame_width = 32,
    frame_height = 32,
    clips = {
        ["front"] = {{0, 0}, {1, 0}, {2, 0}, {3, 0}, {4, 0}, {5, 0}, {6, 0}, {7, 0}, {8, 0}, {9, 0}},
        ["back"] = {{0, 1}, {1, 1}, {2, 1}, {3, 1}, {4, 1}, {5, 1}, {6, 1}, {7, 1}, {8, 1}, {9, 1}},
        ["right"] = {{0, 2}, {1, 2}, {2, 2}, {3, 2}, {4, 2}, {5, 2}, {6, 2}, {7, 2}, {8, 2}, {9, 2}},
        ["left"] = {{0, 3}, {1, 3}, {2, 3}, {3, 3}, {4, 3}, {5, 3}, {6, 3}, {7, 3}, {8, 3}, {9, 3}}
    },
    default_clip = "front"
}

return {
    ZOMBIE_ASSET_KEY = ZOMBIE_ASSET_KEY
}
