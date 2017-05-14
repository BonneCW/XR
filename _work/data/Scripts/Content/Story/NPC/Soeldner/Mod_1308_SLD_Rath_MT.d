instance Mod_1308_SLD_Rath_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Rath";
	Npctype =				Npctype_main;
	guild =					GIL_mil;      
	level =					11;
	
	voice		= 0;
	id =					1308;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Pony", 8, 2, ITAR_SLD_H);
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	//-------- inventory --------
	                                    
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1308;
};

FUNC VOID Rtn_start_1308()
{
	TA_Sleep		(23,55,08,05,"NC_HUT17_IN");
	TA_Smalltalk	(08,05,23,55,"NC_HUT17_OUT");
};

FUNC VOID Rtn_Training_1308 ()
{	
	TA_Practice_Sword (06,00,20,00,"NC_WATERFALL_TOP04");
	TA_Practice_Sword (20,00,06,00,"NC_WATERFALL_TOP04");
};


