instance Mod_1455_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							2;
	id =							1455;

	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Psionic", 71,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 13);

	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1455;
};

FUNC VOID Rtn_start_1455 () //Kyle-Platz
{
	TA_Sleep		(22,00,06,00,"OCR_HUT_69");
	TA_Stand_ArmsCrossed	(06,00,06,30,"OCR_OUTSIDE_HUT_69");
	TA_Smalltalk		(06,30,12,00,"OCR_OUTSIDE_HUT_69"); //mit Kyle
	TA_Sit_Campfire		(12,00,13,00,"OCR_OUTSIDE_HUT_69"); 
	TA_Smalltalk		(13,00,16,00,"OCR_OUTSIDE_HUT_69"); //mit 554 von UNTEN
	TA_Sit_Campfire		(16,00,22,00,"OCR_OUTSIDE_HUT_69");
};