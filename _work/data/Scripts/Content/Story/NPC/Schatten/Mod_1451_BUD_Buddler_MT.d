instance Mod_1451_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =							npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							3;
	id =							1451;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony", 0,  1, vlk_armor_l);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1451;
};

FUNC VOID Rtn_start_1451 ()
{
	TA_Sleep			(23,00,08,00,"OCR_HUT_57");
	TA_Stand_Eating			(08,00,10,00,"OCR_OUTSIDE_HUT_57");
	TA_Pick_FP			(10,00,16,00,"OCC_LADDER_TOP");
	TA_Stand_Eating			(16,00,20,00,"OCR_OUTSIDE_HUT_57");
	TA_Sit_Campfire			(20,00,20,00,"OCR_OUTSIDE_HUT_48");
};