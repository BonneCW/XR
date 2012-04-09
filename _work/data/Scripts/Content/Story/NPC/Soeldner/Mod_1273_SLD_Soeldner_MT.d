instance Mod_1273_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Soeldner;
	Npctype =				NPCTYPE_mt_soeldner;
	guild =					GIL_mil;      
	level =					8;
	
	voice =					11;
	id =					1273;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 1, ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1273;
};

FUNC VOID Rtn_start_1273 ()
{
	TA_Sleep		    (00,00,08,00,"NC_HUT07_IN");
	TA_Sit_Bench		(08,00,00,00,"NC_PLACE03");
};













