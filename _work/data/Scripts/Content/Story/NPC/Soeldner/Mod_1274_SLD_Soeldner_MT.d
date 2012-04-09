instance Mod_1274_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_mt_soeldner;
	guild =							GIL_mil;       
	level =							16;
	
	voice =							8;
	id =							1274;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 3,"Hum_Head_FatBald", 9, 3,ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
		
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1274;
	
};

FUNC VOID Rtn_start_1274 ()
{
	TA_Sleep	    (22,55,07,35,"NC_HUT10_IN");
	TA_Smalltalk	(07,35,22,55,"NC_HUT10_OUT");
};










