instance Mod_1267_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Soeldner;
	Npctype =				NPCTYPE_mt_soeldner;
	guild =					GIL_mil;       
	level =					18;
	
	voice		= 0;
	id =					1267;

	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Fighter", 46, 1,ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

		

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1267;
};

FUNC VOID Rtn_start_1267 ()
{
	TA_Stand_Guarding	(06,00,23,00,"NC_SMALL_CAVE_ENTRANCE_GUARD");
	TA_Stand_Guarding	(23,00,06,00,"NC_SMALL_CAVE_ENTRANCE_GUARD");
};

