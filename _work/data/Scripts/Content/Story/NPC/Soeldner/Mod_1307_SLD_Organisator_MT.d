instance Mod_1307_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_mt_soeldner;
	guild =					GIL_mil;      
	level =					15;

	
	voice		= 0;
	id =					1307;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 3,"Hum_Head_FatBald", 5, 3,SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);

	//------- Inventory ---------

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1307;
};

FUNC VOID Rtn_start_1307 ()
{
	TA_Sleep		(23,30,07,30,"NC_HUT12_IN");
	TA_Stand_WP	(07,30,23,30,"NC_PATH11");
};















