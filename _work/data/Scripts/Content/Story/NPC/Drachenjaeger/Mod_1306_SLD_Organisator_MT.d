instance Mod_1306_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Drachenjaeger;
	Npctype =				Npctype_mt_soeldner;
	guild =					GIL_mil;      
	level =					11;
	
	voice		= 0;
	id =					1306;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_Drachentoeter);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fatbald", 37, 1, ITAR_DJG_L);
	
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	

	//-------- inventory --------
	                                    
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1306;
};

FUNC VOID Rtn_start_1306 ()
{
	TA_Sleep		(00,00,08,00,"NC_HUT14_IN");	
	TA_Sit_Campfire	(08,00,00,00,"NC_PLACE05");
};

FUNC VOID Rtn_Tot_1306 ()
{
	TA_Stand_WP	(01,00,07,30,"TOT");
	TA_Stand_WP	(07,30,01,00,"TOT");
};
