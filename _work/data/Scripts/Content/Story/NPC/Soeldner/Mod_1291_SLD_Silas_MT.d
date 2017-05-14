instance Mod_1291_SLD_Silas_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Silas";
	Npctype =				Npctype_Main;
	guild =					GIL_mil;      
	level =					15;
	
	voice		= 0;
	id =					1291;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", FACE_B_Tough_Silas, BodyTex_B, ITAR_SLD_M);	

	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);

	//------- Inventory ---------

	EquipItem (self, Silas_Axt);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1291;
};

FUNC VOID Rtn_start_1291 ()
{
    TA_Stand_ArmsCrossed			(10,00,03,00,"NC_TAVERN_ROOM04");
	TA_Sleep		(03,00,10,00,"NC_TAVERN_BACKROOM09");
};













