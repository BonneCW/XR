instance Mod_1266_SLD_Orik_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Orik";
	Npctype =				NPCTYPE_main;
	guild =					GIL_mil;
	level =					18;
	
	voice =					8;
	id =					1266;


	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);	

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");

	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", FACE_B_Normal_Orik, BodyTex_B, ITAR_SLD_H);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);


	//-------- inventory --------                                    
	
	EquipItem (self, Oriks_Axt);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1266;

};

FUNC VOID Rtn_start_1266 ()
{
	TA_Smalltalk   	(07,00,19,00,"NC_SMALL_CAVE_CENTER");
	TA_Stand_ArmsCrossed		(19,00,00,00,"NC_HUT05_OUT");
	TA_Sleep		(00,00,07,00,"NC_HUT05_IN");	
};

FUNC VOID Rtn_Arto_1266 ()
{
	TA_Stand_ArmsCrossed		(19,00,07,00,"NC_ENTRANCE_WP01");
	TA_Stand_ArmsCrossed		(07,00,19,00,"NC_ENTRANCE_WP01");	
};

FUNC VOID Rtn_FollowToAL_1266 ()
{
	TA_Follow_Player		(19,00,07,00,"OCC_BARONS_DANCE2");
	TA_Follow_Player		(07,00,19,00,"OCC_BARONS_DANCE2");	
};

FUNC VOID Rtn_Knast_1266 ()
{
	TA_Stand_ArmsCrossed		(19,00,07,00,"OCC_CELLAR_BACK_RIGHT_CELL");
	TA_Stand_ArmsCrossed		(07,00,19,00,"OCC_CELLAR_BACK_RIGHT_CELL");	
};









