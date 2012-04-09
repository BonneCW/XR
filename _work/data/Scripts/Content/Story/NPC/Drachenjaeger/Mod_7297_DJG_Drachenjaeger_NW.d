instance Mod_7297_DJG_Drachenjaeger_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Drachenjaeger;
	Npctype =				Npctype_nw_soeldner;
	guild =					GIL_mil;      
	level =					11;
	
	voice =					11;
	id =					7297;

	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_Drachenschneide);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 35,  1, ITAR_DJG_L);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	//-------- inventory --------
	                                    
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7297;
};

FUNC VOID Rtn_start_7297 ()
{
	TA_Sit_Campfire	(00,00,08,00,"NW_BIGFARM_KITCHEN_OUT_02");	
	TA_Sit_Campfire	(08,00,00,00,"NW_BIGFARM_KITCHEN_OUT_02");
};

FUNC VOID Rtn_Tot_7297 ()
{
	TA_Stand_WP	(01,00,07,30,"TOT");
	TA_Stand_WP	(07,30,01,00,"TOT");
};

FUNC VOID Rtn_Hexen_7297()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Knucker_7297()
{
	TA_RunToWP		(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_RunToWP		(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};















