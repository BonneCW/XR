instance Mod_1269_SLD_Blade_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Blade";
	Npctype =				NPCTYPE_main;
	guild =					GIL_mil;       
	level =					18;
	
	voice =					11;
	id =					1269;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_Orkschlaechter);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Normal_Blade, BodyTex_N, ITAR_SLD_H);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1269;

};

FUNC VOID Rtn_start_1269 ()
{
	TA_Sleep	    (23,00,07,30,"NC_HUT10_IN");
	TA_Smalltalk	(07,30,23,00,"NC_HUT09_OUT");
};

FUNC VOID Rtn_Training_1269 ()
{	
	TA_Practice_Sword (06,00,20,00,"NC_WATERFALL_TOP03");
	TA_Practice_Sword (20,00,06,00,"NC_WATERFALL_TOP03");
};

FUNC VOID Rtn_FMC_1269 ()
{
	TA_Sit_Bench 	(08,00,22,00,"FMC_HUT08_IN");
	TA_Sit_Bench	(22,00,08,00,"FMC_HUT08_IN");		
};

FUNC VOID Rtn_Aufstellung_1269 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_1269 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};