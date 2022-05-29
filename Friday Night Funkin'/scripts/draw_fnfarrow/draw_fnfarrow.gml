#macro ARROW_EMPTY 0
//Empty arrows, no issue! :p

#macro ARROW_NORMAL 1
#macro ARROW_PIXEL 2

#macro ARROWM_NORMAL 0
#macro ARROWM_TRAIL 1
#macro ARROWM_TRAILEND 2

#macro ARROWK_LEFT 0
#macro ARROWK_DOWN 1
#macro ARROWK_UP 2
#macro ARROWK_RIGHT 3

function draw_fnfarrow(x,y,img,xscale=undefined,yscale=undefined,ang=undefined,col=undefined,alpha=undefined,_id=undefined,mode=undefined,kind=undefined,pos=undefined){
	if _id= undefined {_id= ARROW_EMPTY;}
	if mode= undefined {mode= ARROWM_NORMAL;}
	if kind= undefined {kind= ARROWK_LEFT;}
	if xscale= undefined {xscale= 1;}
	if yscale= undefined {yscale= 1;}
	if ang= undefined {ang= 0;}
	if col= undefined {col= -1;}
	if alpha= undefined {alpha= 1;}
	if pos= undefined {pos= 0;}
	
	switch _id {
		case ARROW_NORMAL:
		switch mode {
			case ARROWM_NORMAL:
			var spr= sprarrow_normal_lefti;
			switch kind {
				case ARROWK_DOWN: spr= sprarrow_normal_downi; break;
				case ARROWK_UP: spr= sprarrow_normal_upi; break;
				case ARROWK_RIGHT: spr= sprarrow_normal_righti; break;
			}
			draw_sprite_ext(spr,img,x-(pos= 1? sprite_get_xoffset(spr): 0),y-(pos= 1? sprite_get_yoffset(spr): 0),xscale,yscale,ang,col,alpha);
			break;
			case ARROWM_TRAIL:
			var spr= sprarrow_normal_leftit;
			switch kind {
				case ARROWK_DOWN: spr= sprarrow_normal_downit; break;
				case ARROWK_UP: spr= sprarrow_normal_upit; break;
				case ARROWK_RIGHT: spr= sprarrow_normal_rightit; break;
			}
			draw_sprite_ext(spr,img,x-(pos= 1? sprite_get_xoffset(spr): 0),y-(pos= 1? sprite_get_yoffset(spr): 0),xscale,yscale,ang,col,alpha);
			break;
			case ARROWM_TRAILEND:
			var spr= sprarrow_normal_leftite;
			switch kind {
				case ARROWK_DOWN: spr= sprarrow_normal_downite; break;
				case ARROWK_UP: spr= sprarrow_normal_upite; break;
				case ARROWK_RIGHT: spr= sprarrow_normal_rightite; break;
			}
			draw_sprite_ext(spr,img,x-(pos= 1? sprite_get_xoffset(spr): 0),y-(pos= 1? sprite_get_yoffset(spr): 0),xscale,yscale,ang,col,alpha);
			break;
		}
		break;
		case ARROW_PIXEL:
		trace("Warning! ARROW_PIXEL Is not done yet!");
		break;
	}
}
