instance Mod_1314_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Drachenjaeger;
	Npctype =				Npctype_mt_soeldner;
	guild =					GIL_mil;      
	level =					11;
	
	voice		= 0;
	id =					1314;

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
	daily_routine = Rtn_start_1314;
};

FUNC VOID Rtn_start_1314 ()
{
	TA_Sleep		(00,05,08,05,"NC_HUT16_IN");	
	TA_Sit_Campfire	(08,05,00,05,"NC_HUT16_OUT");
};

FUNC VOID Rtn_Tot_1314 ()
{
	TA_Stand_WP	(01,00,07,30,"TOT");
	TA_Stand_WP	(07,30,01,00,"TOT");
};















