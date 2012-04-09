instance Mod_1452_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							3;
	id =							1452;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 74,  1, vlk_armor_l);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1452;
};

FUNC VOID Rtn_start_1452 () //Bloodwyn-Platz
{
	TA_Sleep		(23,30,06,30,"OCR_HUT_67");
	TA_Stand_ArmsCrossed	(06,30,07,30,"OCR_OUTSIDE_HUT_67");
	TA_Pick_FP		(07,30,17,00,"OCC_OUTSIDE_KITCHEN");
	TA_Sit_Chair		(17,00,18,00,"OCR_HUT_67");
	TA_Sit_Campfire		(18,00,23,30,"OCR_CAMPFIRE_E_1_MOVEMENT");
};