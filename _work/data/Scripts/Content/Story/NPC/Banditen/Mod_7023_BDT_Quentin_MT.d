instance Mod_7023_BDT_Quentin_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Quentin";
	Npctype =				Npctype_MAIN;
	guild =					GIL_OUT;     
	level =					12;
	
	voice =					7;
	id =					7023;

	//-------- abilities --------

	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//	body mesh,	head mesh,	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, ITAR_BDT_M_01);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;		


	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	

	//-------- inventory --------
	                                    
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7023;
};

FUNC VOID Rtn_start_7023 ()
{
    TA_Stand_WP		(13,00,14,00,"LOCATION_11_13");	
    TA_Stand_WP		(14,00,13,00,"LOCATION_11_13");	
};

FUNC VOID Rtn_Hoehle_7023()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_11");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_11");
};

FUNC VOID Rtn_Tot_7023()
{
	TA_FleeToWP	(08,00,20,00,"TOT");
	TA_FleeToWP	(20,00,08,00,"TOT");
};