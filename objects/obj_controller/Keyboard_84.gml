// TODO refactor
var __b__;
__b__ = action_if_number(obj_saveload, 0, 0);
if __b__
{
__b__ = action_if_number(obj_fleet, 0, 0);
if __b__
{
__b__ = action_if_number(obj_ncombat, 0, 0);
if __b__
{
__b__ = action_if_variable(menu, 0, 0);
if __b__
{
__b__ = action_if_variable(managing, 0, 0);
if __b__
{

var ok=0;

if (cooldown<=0){
    if (!instance_exists(obj_turn_end)) then ok=1;
    if (instance_exists(obj_turn_end)){if (obj_turn_end.popups_end=1) then ok=1;}
    
    if (ok=1){
        with(obj_turn_end){instance_destroy();}
        with(obj_star_event){instance_destroy();}
        cooldown=8;audio_play_sound(snd_end_turn,-50,0);
        audio_sound_gain(snd_end_turn,master_volume*effect_volume,0);
        
        turn+=1;
        
        with(obj_star){
            present_fleet[1]=0;
            present_fleet[2]=0;
            present_fleet[3]=0;
            present_fleet[4]=0;
            present_fleet[5]=0;
            present_fleet[6]=0;
            present_fleet[7]=0;
            present_fleet[8]=0;
            present_fleet[9]=0;
            present_fleet[10]=0;
            present_fleet[13]=0;
            present_fleet[20]=0;
        }
        with(obj_p_fleet){
            if (action="move") and (obj_controller.faction_status[2]="War"){
                var him;him=instance_nearest(action_x,action_y,obj_star);
                if (point_distance(action_x,action_y,him.x,him.y)<10){
                    him.present_fleet[20]=1;
                }
            }
        }
        with(obj_en_fleet){
            if (action="move") and (owner>5){
                var him;him=instance_nearest(action_x,action_y,obj_star);
                if (point_distance(action_x,action_y,him.x,him.y)<10){
                    him.present_fleet[20]=1;
                }
            }
        }
        
        if (instance_exists(obj_p_fleet)){obj_p_fleet.alarm[1]=1;}
        if (instance_exists(obj_en_fleet)){obj_en_fleet.alarm[1]=1;}
        if (instance_exists(obj_crusade)){obj_crusade.alarm[0]=2;}
        
        requisition+=income;scr_income();
        gene_tithe-=1;
        
        // Do that after the combats and all of that crap
        
        with(obj_star){
            ai_a=2;ai_b=3;ai_c=4;ai_d=5;ai_e=5;
            /*if (p_type[1]="Craftworld"){
                // instance_create(x,y,obj_temp4);
                instance_deactivate_object(id);
                // x=-5000;
            }*/
        }
        alarm[5]=6;instance_create(0,0,obj_turn_end);scr_turn_first();
    }
}

/* */
}
}
}
}
}
/*  */
