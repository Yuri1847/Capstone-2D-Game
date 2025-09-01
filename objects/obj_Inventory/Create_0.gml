inventory_columns = 5;
inventory_rows = 3;

inventory = new sc_Inventory();

inventory.addItem("Wood", 3, spr_wood);
inventory.addItem("Wood", 2, spr_wood);
inventory.addItem("Stone", 10, spr_stone);
inventory.addItem("Fish", 10, spr_fish);
inventory.addItem("Stick", 4, spr_stick);
inventory.addItem("Wood", 3, spr_wood);
inventory.addItem("Pencil", 10, spr_stone);
inventory.addItem("Eraser", 10, spr_stone);
inventory.addItem("Apple", 10, spr_stone);
inventory.addItem("Coin", 5, spr_stone);

//add
inventory.addItem("Wood", 3, spr_wood);
inventory.addItem("Wood", 2, spr_wood);
inventory.addItem("Stone", 10, spr_stone);
inventory.addItem("Fish", 10, spr_fish);
inventory.addItem("Stick", 4, spr_stick);
inventory.addItem("Wood", 3, spr_wood);
inventory.addItem("Pencil", 10, spr_stone);
inventory.addItem("Eraser", 10, spr_stone);
inventory.addItem("Apple", 10, spr_stone);
inventory.addItem("Coin", 5, spr_stone);

isEnabled = false;

//Center inside Room
//ui_padding_x = (room_width/2) - (464/2);
//ui_padding_y = (room_height/2) - (272/2);

//Center inside Object
//ui_padding_x = (x - 464 / 2);
//ui_padding_y = (y - 272 / 2);

//Center inside Viewport
ui_padding_x = (display_get_gui_width() / 2 - 464/2);
ui_padding_y = (display_get_gui_height() / 2 - 304/2);


ui_inventory_slot = 80;
ui_inventory_slot_margin = 16;