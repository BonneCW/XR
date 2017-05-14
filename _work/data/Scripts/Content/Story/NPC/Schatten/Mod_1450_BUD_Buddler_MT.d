instance Mod_1450_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;

	
	voice		= 0;
	id =							1450;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Psionic", 67,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1450;
};

FUNC VOID Rtn_start_1450 () //Roaster Marktplatz
{
	TA_Sleep		(23,00,08,00,"OCR_HUT_47");
	TA_Sit_Bench		(08,00,11,00,"OCR_MARKETPLACE_HANGAROUND");
	TA_Roast_Scavenger 	(11,00,17,00,"OCR_OUTSIDE_HUT_55");
	TA_Sit_Bench		(17,00,23,00,"OCR_MARKETPLACE_HANGAROUND");
};