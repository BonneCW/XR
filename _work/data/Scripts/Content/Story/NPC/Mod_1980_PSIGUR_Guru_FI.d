instance Mod_1980_PSIGUR_Guru_FI (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Fanatischer Guru";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_strf;
	level 		=		28;
	
	voice		= 0;
	id 			=		1980;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	60;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

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
	daily_routine = Rtn_start_1980;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_1980 ()
{
    TA_Stand_WP			(07,00,00,00,"FI_50");
    TA_Stand_WP		(00,00,07,00,"FI_50");
};