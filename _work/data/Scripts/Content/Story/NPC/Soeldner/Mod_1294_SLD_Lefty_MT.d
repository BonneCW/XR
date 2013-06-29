instance Mod_1294_SLD_Lefty_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =						"Lefty";
	Npctype =					NPCTYPE_MAIN;	
	guild =						GIL_mil;      
	level =						8;
	voice =						24;
	id =						1294;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", FACE_N_Lefty, BodyTex_N, SLD_ARMOR_L);

	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1294;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_1294 ()
{
	TA_Sit_Campfire 	(19,00,08,00,"NC_PATH86_MOVEMENT");
	TA_Smalltalk 	(08,00,19,00,"NC_PATH53");

};