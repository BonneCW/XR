instance Mod_1745_PSIGUR_Guru_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Fanatischer Guru";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_DMT;
	level 		=		28;
	flags = 2;
	
	voice		= 0;
	id 			=		1745;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 166,  1, ITAR_GURUFANATIKER);

	
	Mdl_SetModelFatness(self,0);

	//-------- Talente --------
	
	//-------- inventory --------
	
	EquipItem (self, Oruns_Keule);
	B_SetAttributesToChapter (self, 6);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1745;
	fight_tactic	=	FAI_HUMAN_MASTER;
};

FUNC VOID Rtn_start_1745 ()
{
    TA_Stand_WP			(07,00,00,00,"NW_LIGHTHOUSE_OUT_01");
    TA_Stand_WP		(00,00,07,00,"NW_LIGHTHOUSE_OUT_01");
};

FUNC VOID Rtn_Guru_1745 ()
{
    TA_Smalltalk_Plaudern			(07,00,00,00,"NW_LIGHTHOUSE_OUT_01");
    TA_Smalltalk_Plaudern		(00,00,07,00,"NW_LIGHTHOUSE_OUT_01");
};

FUNC VOID Rtn_Teleport_1745()
{
	TA_Stand_WP		(08,00,22,00,"NW_LIGHTHOUSE_IN_01A");
	TA_Stand_WP		(22,00,08,00,"NW_LIGHTHOUSE_IN_01A");
};

FUNC VOID Rtn_Tot_1745()
{
	TA_Stand_WP		(08,00,22,00,"TOT");
	TA_Stand_WP		(22,00,08,00,"TOT");
};