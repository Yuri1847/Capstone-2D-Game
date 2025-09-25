// Variables
walkSpeed = 4;
vx = 0;
vy = 0;
dir = 3;
moveRight = 0;
moveLeft = 0;
moveUp = 0;
moveDown = 0;

//splash screen thign
if (variable_global_exists("player_spawnX")) {
    x = global.player_spawnX;
    y = global.player_spawnY;

    variable_global_remove("player_spawnX");
    variable_global_remove("player_spawnY");
}
