instance Mod_1302_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_mt_soeldner;
	guild =							GIL_mil;       
	level =							4;
	
	voice =							8;
	id =							1302;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 0,"Hum_Head_FatBald", 102 , 0, sld_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1302;

};

FUNC VOID Rtn_start_1302 ()
{
	TA_Sleep			(02,35,08,05,"NC_HUT31_IN");
	TA_Smalltalk_Witze		(08,05,18,05,"NC_HUT31_OUT");
	TA_Smalltalk_Witze		(18,05,02,35,"NC_TAVERN_TOP02");
};











