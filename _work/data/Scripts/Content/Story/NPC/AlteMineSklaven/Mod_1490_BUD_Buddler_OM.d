instance Mod_1490_BUD_Buddler_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_om_buddler;
	guild =							GIL_OUT;      
	level =							3;
	
	
	voice =							3;
	id =							1490;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 68,  1, vlk_armor_l);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------       																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);                             

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1490;
	
	
};

FUNC VOID Rtn_start_1490 ()
{
	TA_Pick_Ore		(21,00,07,00,"OM_CAVE3_01");
	TA_Pick_Ore		(07,00,21,00,"OM_CAVE3_01");	
};

FUNC VOID Rtn_Pause_1490 ()
{
	TA_Stand_Eating		(21,00,07,00,"OM_CAVE3_01");
	TA_Stand_Eating		(07,00,21,00,"OM_CAVE3_01");	
};
