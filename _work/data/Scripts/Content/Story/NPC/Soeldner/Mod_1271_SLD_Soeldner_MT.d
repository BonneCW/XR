instance Mod_1271_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Orkjaeger;
	Npctype =						NpcType_mt_soeldner;
	guild =							GIL_mil;       
	level =							18;
	
	voice		= 0;
	id =							1271;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_Orkschlaechter);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 49, 1,ITAR_SLD_H);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------

	B_SetFightSkills	(self, 65);		

	//-------- inventory --------                                    

		

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1271;

};

FUNC VOID Rtn_start_1271 ()
{
	TA_Stand_WP	(07,30,00,00,"NC_HUT02_OUT");
	TA_Sleep		(00,00,07,30,"NC_HUT02_IN");
};

FUNC VOID Rtn_Orkjagd_1271 ()
{
	TA_RunToWP	(07,45,23,45,"OW_PATH_264");
	TA_RunToWP		(23,45,07,45,"OW_PATH_264");
};

FUNC VOID Rtn_AtOrks_1271 ()
{
	TA_Guide_Player		(07,45,23,45,"SPAWN_OW_SNAPPER_WOOD05_05");
	TA_Guide_Player		(23,45,07,45,"SPAWN_OW_SNAPPER_WOOD05_05");
};










