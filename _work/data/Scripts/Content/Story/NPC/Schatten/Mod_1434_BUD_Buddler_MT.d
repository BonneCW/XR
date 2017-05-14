instance Mod_1434_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Buddler;
	npctype =						NPCTYPE_mt_buddler;
	guild =							GIL_out;      
	level =							2;

	voice		= 0;
	id =							1434;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Thief", 74,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
 	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1434;
};

FUNC VOID Rtn_start_1434 ()
{
	TA_Sleep	(22,00,06,30,"OCR_HUT_12");
	TA_Sit_Chair	(06,30,12,00,"OCR_HUT_12");
	TA_Pick_FP	(12,00,20,00,"OCC_CONVOY_01");
	TA_Sit_Chair	(20,30,22,00,"OCR_HUT_12");
};










