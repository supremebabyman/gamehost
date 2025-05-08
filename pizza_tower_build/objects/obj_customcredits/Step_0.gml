if four
    scroll -= 0.52;
// If Z is Held, scroll faster until not held
if four && keyboard_check(ord("Z"))
	scroll -= 3;
	
if (scroll < -1960)
{
    fade += 0.0045;
    fade2 += 0.05;
}
if (fade >= 1)
    instance_destroy();
if (flash > 0)
    flash -= 0.01;
imindex += 0.05;
// for pig
ani_pig += 0.3;
// for ME
// i dont even want to explain this
if (scroll <= -600 && stop_pop == false) {
	ani_pop += 1.5;
	if (ani_pop >= 6) {
		stop_pop = true;
	}
}

if keyboard_check_pressed(vk_anykey) && !keyboard_check(ord("Z"))
{
    if (!popup)
    {
        popup = 1;
        alarm[4] = 100;
    }
    else
        instance_destroy();
}
