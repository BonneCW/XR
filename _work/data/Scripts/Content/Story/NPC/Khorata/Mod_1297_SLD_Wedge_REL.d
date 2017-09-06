instance Mod_1297_SLD_Wedge_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Wedge";
	Npctype =				Npctype_Main;
	guild =					GIL_OUT;      
	level =					11;
	
	voice =					5;
	id =					1297;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fatbald", 37, 1, ITAR_SLD_M);
	
	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	B_SetFightSkills	(self, 60);

	//-------- inventory --------
	                                    
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1297;
};

FUNC VOID Rtn_start_1297 ()
{
	TA_Sit_Chair	(00,00,08,00,"REL_MOOR_145");
	TA_Sit_Chair	(08,00,00,00,"REL_MOOR_145");
};
