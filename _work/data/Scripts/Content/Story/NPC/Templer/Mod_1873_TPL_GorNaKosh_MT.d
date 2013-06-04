instance Mod_1873_TPL_GorNaKosh_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Kosh";
	npctype =						npctype_Main;
	guild =							GIL_OUT;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1873;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,64headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 20 ,  1, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																	
	B_SetFightSkills (self, 65); 
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1873;
};

FUNC VOID Rtn_start_1873 ()
{
	TA_Sit_Campfire		(00,00,12,00,"WP_MT_HECTA_UND_ACHIL");	
	TA_Sit_Campfire		(12,00,24,00,"WP_MT_HECTA_UND_ACHIL");		
};

FUNC VOID Rtn_Follow_1873 ()
{
	TA_Follow_Player		(00,00,12,00,"WP_MT_HECTA_UND_ACHIL");	
	TA_Follow_Player		(12,00,24,00,"WP_MT_HECTA_UND_ACHIL");		
};

func void Rtn_Templer_1873 ()
{
	TA_Smalltalk (00,00,12,00,"OCC_BARONS_DANCE2");
	TA_Smalltalk (12,00,24,00,"OCC_BARONS_DANCE2");
};