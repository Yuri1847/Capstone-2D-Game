if (!instance_exists(obj_talk_button)) {
    instance_create_layer(0, 0, "ins_gui", obj_talk_button);
}

//letter system
scr_register_letter("kap_tiago", "tiago_intro", "Tala ni Kapitan Tiago", [
    "Napakaraming salita ang dumaloy kapag may mahalagang bisita.",
    "Ang alaala ni Don Rafael ay buhay pa rin sa puso ng marami."
]);
