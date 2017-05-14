instance Mod_1281_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_mt_soeldner;
	guild =					GIL_mil;       
	level =					18;
	
	voice		= 0;
	id =					1281;


	//-------- abilities --------

	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 1,ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);	
	

	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1281;

};

FUNC VOID Rtn_start_1281 ()
{
	TA_Guard_Passage	(08,00,22,00,"NC_GUARD_MAGES_RIGHT");
	TA_Guard_Passage	(22,00,08,00,"NC_GUARD_MAGES_RIGHT");
};

FUNC VOID Rtn_Gardisten_1281 ()
{
	TA_Stand_ArmsCrossed	(20,50,07,10,"OW_PATH_07_21");
	TA_Stand_ArmsCrossed	(07,10,20,50,"OW_PATH_07_21");
};














