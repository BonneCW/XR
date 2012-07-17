instance Mod_1498_BUD_Grimes_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Grimes";
	npctype =						npctype_main;
	guild =							GIL_OUT;      
	level =							5;
	
	
	voice =							4;
	id =							1498;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Thief", 110, 1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------                  																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1498;
};

FUNC VOID Rtn_Start_1498 ()
{
	TA_Pick_Ore  	 (08,00,18,00,"OM_PICKORE_02");
	TA_Pick_Ore  	 (18,00,08,00,"OM_PICKORE_02");
};

FUNC VOID Rtn_Pause_1498 ()
{
	TA_Stand_Eating  	 (08,00,18,00,"OM_PICKORE_02");
	TA_Stand_Eating  	 (18,00,08,00,"OM_PICKORE_02");
};
