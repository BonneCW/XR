instance Mod_1872_NONE_Unbekannt_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Unbekannter Kämpfer";
	npctype		= 	npctype_friend;
	guild 		=	GIL_OUT;
	level 		=	10;
	voice		=	5;
	id 			=	1872;

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
		
	//-------- abilities --------	
	B_SetAttributesToChapter (self, 2);
	attribute[ATR_STRENGTH] 	= 140;
	attribute[ATR_HITPOINTS_MAX]= 750;
	attribute[ATR_HITPOINTS] 	= 750;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 2,  1, ITAR_TARNUNG);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	B_SetFightSkillS	(self, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1872;
};

FUNC VOID Rtn_start_1872 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_21");
	TA_Stand_Eating  (07,45,10,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_Cook_Cauldron(10,00,14,05,"OCR_CAMPFIRE_I_1");
	TA_Smith_Sharp	(14,05,17,15,"OCR_ARENABATTLE_OUTSIDE");
	TA_Sit_Campfire	(17,15,23,45,"OCR_ARENABATTLE_OUTSIDE");
};

func VOID Rtn_ArenaFight_1872 ()
{
	TA_Stand_WP (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_Stand_WP (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};

func VOID Rtn_Fight_1872 ()
{
	TA_ArenaFight (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_ArenaFight (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};

func VOID Rtn_Flucht_1872 ()
{
	TA_FleeToWP (08,00,20,00,"TOT");
	TA_FleeToWP (20,00,08,00,"TOT");
};
