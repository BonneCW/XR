instance Mod_1122_SLD_Mordrag_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Mordrag";
	Npctype =				Npctype_Main;
	guild =					GIL_OUT;      
	level =					10;
	
	voice =					11;
	id =					1122;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Mordrag, BodyTex_N, SLD_ARMOR_L);

	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	//-------- Talente ----------

	////Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_1122;
};

FUNC VOID Rtn_PreStart_1122 ()
{
	TA_Stand_WP (08,00,23,00,"NC_TAVERN_BAR");
	TA_Stand_WP (23,00,08,00,"NC_TAVERN_BAR");
};












