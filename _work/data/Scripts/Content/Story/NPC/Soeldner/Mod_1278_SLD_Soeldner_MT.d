instance Mod_1278_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Orkjaeger;
	Npctype =				NPCTYPE_mt_soeldner;
	guild =					GIL_mil;       
	level =					18;
	
	voice		= 0;
	id =					1278;


	//-------- abilities --------

	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_Orkschlaechter);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 53,  1,ITAR_SLD_H);
	
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------

	B_SetFightSkills	(self, 55);		

	//-------- inventory --------                                    

		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1278;
};

FUNC VOID Rtn_start_1278 () //Vor Erzhaufen
{
	TA_Guard_Passage		(23,00,07,00,"NC_PATH40_GUARD2");
	TA_Guard_Passage		(07,00,23,00,"NC_PATH40_GUARD2");
};

FUNC VOID Rtn_Orkjagd_1278 ()
{
	TA_RunToWP	(07,45,23,45,"OW_PATH_264");
	TA_RunToWP		(23,45,07,45,"OW_PATH_264");
};

FUNC VOID Rtn_AtOrks_1278 ()
{
	TA_Guide_Player		(07,45,23,45,"SPAWN_OW_SNAPPER_WOOD05_05");
	TA_Guide_Player		(23,45,07,45,"SPAWN_OW_SNAPPER_WOOD05_05");
};

FUNC VOID Rtn_Gardisten_1278 ()
{
	TA_Stand_ArmsCrossed	(20,50,07,10,"OW_PATH_07_21");
	TA_Stand_ArmsCrossed	(07,10,20,50,"OW_PATH_07_21");
};