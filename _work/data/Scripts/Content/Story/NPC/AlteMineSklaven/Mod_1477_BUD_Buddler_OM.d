instance Mod_1477_BUD_Buddler_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_om_buddler;
	guild =							GIL_KDF;      
	level =							3;
	
	
	voice =							3;
	id =							1477;


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
	//				body mesh,				head mesh,				69hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 112,  1, vlk_armor_l);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------  																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);                                  

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1477;
	
	//------------ //MISSIONs------------------
	
};

FUNC VOID Rtn_start_1477 ()
{
	TA_Pick_Ore	    (08,00,18,00,"OM_PICKORE_11");  
	TA_Pick_Ore	    (18,00,08,00,"OM_PICKORE_11");
};

FUNC VOID Rtn_Pause_1477 ()
{
	TA_Stand_Eating	    (08,00,18,00,"OM_PICKORE_11");  
	TA_Stand_Eating	    (18,00,08,00,"OM_PICKORE_11");
};