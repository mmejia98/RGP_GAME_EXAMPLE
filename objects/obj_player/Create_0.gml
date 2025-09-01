winw = window_get_width();
winh = window_get_height();


move_speed = 1;

tilemap = layer_tilemap_get_id("Tiles_Col");

hp = 10;
hp_total = hp;
damage = 1;
charge = 0;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

function add_xp(_xp_to_add){
	xp += _xp_to_add;
	if(xp >= xp_require){
		level++;
		xp -= xp_require;
		xp_require *= 1.4;
		
		hp_total += 5;
		hp = hp_total;
		damage += 0.8;
		
		create_dialog([
			{
				name: "Congrats",
				msg: $"You leveled up! Your new stats are: \nLVL: {level}\nHP: {hp_total}\nDMG: {damage}"
			}
		])
	}
}