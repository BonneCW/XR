instance Mod_802_STT_Herek_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Herek";
	npctype =						npctype_main;
	guild =							GIL_OUT;      
	level =							2;	
	voice		= 0;
	id =							802;

	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				70hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Weak_Herek, BodyTex_N, VLK_ARMOR_M);	
	
		fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 25);

	B_CreateAmbientInv	(self);
		
	//-------- inventory --------                                    

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_802;
};

FUNC VOID Rtn_start_802 ()
{
	TA_Sleep		(22,00,07,00,"OCR_HUT_62");
	TA_Stand_Eating		(07,00,08,00,"OCR_OUTSIDE_HUT_62");
	TA_Smalltalk		(08,00,12,00,"OCR_OUTSIDE_HUT_63_SMALLTALK");	// mit ???
	TA_Rake_FP		(12,00,20,00,"OCC_CONVOY_01");
	TA_Sit_Bench   		(20,00,22,00,"OCR_OUTSIDE_HUT_62");  
};

FUNC VOID Rtn_Tot_802 ()
{
	TA_Sleep		(22,00,07,00,"TOT");
	TA_Stand_Eating		(07,00,22,00,"TOT");
};