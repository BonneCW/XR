instance Mod_1315_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_mt_soeldner;
	guild =						GIL_mil;      
	level =						8;

	
	voice =						8;
	id =						1315;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 37, 1, SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1315;
};

FUNC VOID Rtn_start_1315 ()
{
	TA_Sleep		(00,00,07,30,"NC_HUT21_IN");
	TA_Sit_Bench	(07,30,10,00,"NC_HUT21_OUT");
	TA_Cook_Cauldron			(10,00,10,00,"NC_HUT21_OUT");
	TA_Sit_Bench	(20,00,00,00,"NC_HUT21_OUT");
};












