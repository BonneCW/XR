instance Mod_1279_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_mt_soeldner;
	guild =					GIL_mil;       
	level =					18;
	
	voice		= 0;
	id =					1279;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 36, 1, ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1279;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_start_1279 ()
{
	TA_Sleep		(23,00,08,00,"NC_HUT10_IN");
	TA_Smalltalk	(08,00,23,00,"NC_HUT04_OUT");
};

FUNC VOID Rtn_Gardisten_1279 ()
{
	TA_Stand_ArmsCrossed	(20,50,07,10,"OW_PATH_07_21");
	TA_Stand_ArmsCrossed	(07,10,20,50,"OW_PATH_07_21");
};










