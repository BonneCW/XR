instance Mod_1284_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_mt_soeldner;
	guild =							GIL_mil;       
	level =							11;
	
	voice		= 0;
	id =							1284;


	//-------- abilities --------

	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 48 , 1, ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1284;

};

FUNC VOID Rtn_start_1284 ()
{
	TA_Sleep		(20,50,07,10,"NC_HUT08_IN");
	TA_Practice_Sword(07,10,20,50,"NC_WATERFALL_TOP02");
};

FUNC VOID Rtn_Gardisten_1284 ()
{
	TA_Stand_ArmsCrossed	(20,50,07,10,"OW_PATH_07_21");
	TA_Stand_ArmsCrossed	(07,10,20,50,"OW_PATH_07_21");
};