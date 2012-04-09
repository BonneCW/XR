instance Mod_1579_SLD_Soeldner_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Torwache";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_mil;       
	level =					18;
	
	voice =					11;
	id =					762;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 53,  1,ITAR_SLD_M);
	
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

		
	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1579;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_FMCstart_1579 ()
{
	TA_Stand_Guarding	(01,00,13,00,	"FMC_PATH28");
	TA_Stand_Guarding	(13,00,01,00,	"FMC_PATH28");
};