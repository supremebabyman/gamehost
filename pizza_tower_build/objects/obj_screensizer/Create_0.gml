window_set_size(960, 540)
surface_resize(application_surface, 960, 540)
camera_set_view_size(view_camera[0], 960, 540)
enum aspectratio
{
	normal
}
global.resolutions[aspectratio.normal] = [
	[480, 270], [960, 540], [1024, 576], [1280, 720], [1600, 900], [1920, 1080]
];
get_options();
aa_tex_size = shader_get_uniform(shd_aa, "texSize");
normal_size_fix_x = 0;
normal_size_fix_y = 0;
app_scale = 1;
display_width = 960;
display_height = 540;
aspect_ratio = aspectratio.normal;
camzoom = 1;
savedwidth = 960;
savedheight = 540;
saved_guiwidth = 960;
saved_guiheight = 540;
gui_surf = -4;
ideal_width = 960;
ideal_height = 540;
actual_width = ideal_width;
actual_height = ideal_height;
window_width_current = 0;
window_height_current = 0;