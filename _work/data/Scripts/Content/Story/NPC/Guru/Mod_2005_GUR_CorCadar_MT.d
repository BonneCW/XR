instance Mod_2005_GUR_CorCadar_MT (Npc_Default)
{
	//-------- primary data --------
	name		=	"Cor Cadar";
	Npctype		=	NPCTYPE_Main;
	guild		=	GIL_OUT;
	level 		=	28;
	
	voice 		=	2;
	id 			=	2005;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	55;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 166,  1, GUR_ARMOR_H);

	
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	//-------- inventory --------

	B_SetAttributesToChapter (self, 6);
	fight_tactic		= FAI_HUMAN_STRONG;
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2005;
};

FUNC VOID Rtn_start_2005 ()
{
	TA_Preach_PSI	(05,00,22,00,"PSI_TEMPLE_COURT_GURU");
	TA_Sit_Chair		(22,00,23,00,"PSI_TEMPLE_SITTING_PRIEST");
	TA_Read_Bookstand	(23,00,05,00,"PSI_TEMPLE_ROOMS_IN_02");
};

FUNC VOID Rtn_Tempel_2005 ()
{
	TA_Stand_WP 	(08,00,20,00,"PSI_TEMPLE_STAIRS_02");
	TA_Stand_WP 	(20,00,08,00,"PSI_TEMPLE_STAIRS_02");
};

FUNC VOID Rtn_InPsicamp_2005 ()
{
	TA_Stand_WP			(02,10,07,40,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(07,40,21,05,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(21,05,02,10,"PSI_TEMPLE_IN_05");
};