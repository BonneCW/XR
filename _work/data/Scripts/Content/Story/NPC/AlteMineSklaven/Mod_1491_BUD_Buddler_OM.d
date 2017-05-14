instance Mod_1491_BUD_Buddler_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_om_buddler;
	guild =							GIL_OUT;      
	level =							4;
	
	
	voice =							0;
	id =							1491;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

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
	daily_routine = Rtn_start_1491;
};

FUNC VOID Rtn_start_1491 ()
{
	TA_Pick_Ore			(23,00,05,00,"OM_CAVE1_74B");
	TA_Pick_Ore 			(05,00,23,00,"OM_CAVE1_74B");
};

FUNC VOID Rtn_Pause_1491 ()
{
	TA_Stand_Eating			(23,00,05,00,"OM_CAVE1_74B");
	TA_Stand_Eating			(05,00,23,00,"OM_CAVE1_74B");
};
