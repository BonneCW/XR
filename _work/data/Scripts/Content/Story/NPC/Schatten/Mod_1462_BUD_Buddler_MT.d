instance Mod_1462_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out; 
	level =							3;
	
	
	voice		= 0;
	id =							1462;


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
	daily_routine = Rtn_start_1462;
};

FUNC VOID Rtn_start_1462 () //Kyle-PLatz UNTEN
{
	TA_Sleep		(22,15,06,15,"OCR_HUT_72");
	TA_Stand_ArmsCrossed	(06,15,07,15,"OCR_OUTSIDE_HUT_72");
	TA_Wash_FP		(07,15,07,45,"OCR_WASH_2");
	TA_Pick_FP		(07,45,13,00,"OCC_CENTER_4_TRAIN2");
	TA_Smalltalk		(13,00,16,00,"OCR_OUTSIDE_HUT_68_BENCH"); //mit 529
	TA_Sit_Campfire		(16,00,22,15,"OCR_OUTSIDE_HUT_72");
};