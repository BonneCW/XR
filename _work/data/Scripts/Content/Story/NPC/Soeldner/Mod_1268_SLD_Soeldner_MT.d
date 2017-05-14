instance Mod_1268_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Orkjaeger;
	Npctype =				NPCTYPE_mt_soeldner;
	guild =					GIL_mil;       
	level =					18;
	
	voice		= 0;
	id =					1268;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);

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

	B_SetFightSkills	(self, 70);	

	//-------- inventory --------                                    

		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1268;
};

FUNC VOID Rtn_start_1268 ()
{
	TA_Sit_Bench	(07,45,23,45,"NC_PLACE01");
	TA_Sleep		(23,45,07,45,"NC_HUT02_IN");
};

FUNC VOID Rtn_Orkjagd_1268 ()
{
	TA_RunToWP	(07,45,23,45,"OW_PATH_264");
	TA_RunToWP		(23,45,07,45,"OW_PATH_264");
};

FUNC VOID Rtn_AtOrks_1268 ()
{
	TA_Guide_Player		(07,45,23,45,"SPAWN_OW_SNAPPER_WOOD05_05");
	TA_Guide_Player		(23,45,07,45,"SPAWN_OW_SNAPPER_WOOD05_05");
};











