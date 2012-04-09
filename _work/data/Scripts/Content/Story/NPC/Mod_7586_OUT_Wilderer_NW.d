instance Mod_7586_OUT_Wilderer_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Wilderer";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_STRF;       
	level =					16;
	
	voice =					8;
	id =					7586;


	aivar[AIV_Partymember] = TRUE;
	//-------- abilities --------

	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_GrobesKurzschwert);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 1,ITAR_SLD_H);
	
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	B_SetFightSkills	(self, 75);
	

	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_7586;

};

FUNC VOID Rtn_start_7586 () //Vor Ezhaufen
{
	TA_Stand_ArmsCrossed		(23,00,07,00,"NW_TROLLAREA_PATH_13");
	TA_Stand_ArmsCrossed		(07,00,23,00,"NW_TROLLAREA_PATH_13");
};