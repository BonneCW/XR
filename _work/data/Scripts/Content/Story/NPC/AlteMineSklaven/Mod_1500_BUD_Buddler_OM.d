instance Mod_1500_BUD_Buddler_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_om_buddler;
	guild =							GIL_OUT;      
	level =							5;
	
	
	voice =							0;
	id =							1500;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 67,  1, vlk_armor_l);
        
        Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
  	//-------- Talents --------     																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);                               

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1500;
};

FUNC VOID Rtn_start_1500 ()
{
	TA_Pick_Ore (00,00,12,00,"OM_PICKORE_03");
	TA_Pick_Ore (12,00,24,00,"OM_PICKORE_03");
};

FUNC VOID Rtn_Pause_1500 ()
{
	TA_Stand_Eating (00,00,12,00,"OM_PICKORE_03");
	TA_Stand_Eating (12,00,24,00,"OM_PICKORE_03");
};
