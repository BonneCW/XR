instance Mod_1304_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				NPCTYPE_mt_soeldner;
	guild =					GIL_mil;      
	level =					15;

	
	voice		= 0;
	id =					1304;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_FatBald", 10, 0,SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);


	//------- Inventory ---------

	
	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_start_1304;
};

FUNC VOID Rtn_start_1304 () //Wache: Durchgang zu Lares
{
	TA_Guard_Passage	(20,00,08,00,"NC_HUT23_OUT_GUARD");
	TA_Guard_Passage	(08,00,20,00,"NC_HUT23_OUT_GUARD");
};














