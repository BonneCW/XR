instance Mod_1303_SLD_Organisator_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_mt_soeldner;
	guild =							GIL_mil;      
	level =							15;
	
	voice =							11;
	id =							1303;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fatbald", 35, 1,SLD_ARMOR_L);
	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);

	//------- Inventory ---------

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1303;

};

FUNC VOID Rtn_start_1303 ()
{
	TA_Sleep		(00,30,08,00,"NC_HUT26_IN");	
	TA_Sit_Campfire	(08,00,00,30,"NC_PATH17_MOVEMENT");	
};














