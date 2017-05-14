instance Mod_7692_BUD_Buddler_NW (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							7692;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,0,"Hum_Head_Thief", 16,  1, ItAr_Leather_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 10);
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7692;
};

FUNC VOID Rtn_start_7692 ()
{
	TA_Stand_Eating		(22,30,17,00,"NW_CITY_TO_FARM2_04");
	TA_Stand_Eating 	(17,00,22,30,"NW_CITY_TO_FARM2_04");
};