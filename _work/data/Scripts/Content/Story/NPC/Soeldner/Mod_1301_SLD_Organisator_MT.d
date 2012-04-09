instance Mod_1301_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_mt_soeldner;
	guild =							GIL_mil;       
	level =							4;
	
	voice =							11;
	id =							1301;



	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_FatBald", 101, 0,SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1301;

};

FUNC VOID Rtn_start_1301 ()
{
	TA_Sleep			(02,30,08,00,"NC_HUT31_IN");
	TA_Smalltalk_Witze		(08,00,18,00,"NC_HUT31_OUT");
	TA_Smalltalk_Witze		(18,00,02,30,"NC_TAVERN_TOP02");
};











