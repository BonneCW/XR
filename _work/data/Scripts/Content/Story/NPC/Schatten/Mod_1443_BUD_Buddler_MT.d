instance Mod_1443_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
  	npctype =						npctype_mt_buddler;
	guild =							GIL_out;    
	level =							2;
	
	
	voice =							3;
	id =							1443;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony", 0,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 10);

	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1443;
};

FUNC VOID Rtn_start_1443 () //Arenaplatz
{
	TA_Sleep		(23,00,08,00,"OCR_HUT_17");
	TA_Smalltalk		(08,00,19,00,"OCR_OUTSIDE_HUT_17");
	TA_Stand_Drinking	(19,00,23,00,"OCR_ARENA_09");
};