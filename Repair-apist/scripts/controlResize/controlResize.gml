if window_get_fullscreen(){
    global.winWidth = display_get_width();
    global.winHeight = display_get_height();
	global.viewScale = 1;
	if global.winWidth > 1980{
		global.viewScale = 0.5;
	}
}else{
    global.winWidth = global.defWidth;
    global.winHeight = global.defHeight;
	global.viewScale = 0.75;
}


global.viewWidth = global.winWidth/global.viewScale;
global.viewHeight = global.winHeight/global.viewScale;

view_wport[0] = global.winWidth;
view_hport[0] = global.winHeight;
surface_resize(application_surface, global.winWidth, global.winHeight);
window_set_size(global.winWidth, global.winHeight);
window_set_position(display_get_width()/2-global.winWidth/2, display_get_height()/2-global.winHeight/2);
display_set_gui_maximize(1/global.viewScale,1/global.viewScale);


if instance_exists(obj_camera) with(obj_camera) event_user(0);
if instance_exists(obj_minigamewindow) with(obj_minigamewindow) alarm[0]=1;

var cam = obj_control.camera;
var cx = global.winWidth/2;
var cy = global.winHeight/2;
var vm = matrix_build_lookat(cx,cy,-1000,cx,cy,0,0,1,0);
camera_set_view_mat(cam.camera,vm);