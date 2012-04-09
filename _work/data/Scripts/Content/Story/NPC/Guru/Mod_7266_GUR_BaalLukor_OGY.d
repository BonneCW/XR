instance Mod_7266_GUR_BaalLukor_OGY (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Lukor";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_DMT;
	
	voice 		=		12;
	id 			=		7266;
		
	B_SetAttributesToChapter	(self, 4);
	level 		=		100;

	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0",	1,		1,		"Hum_Head_Psionic",	20,			1,			GUR_ARMOR_M);

	
	Mdl_SetModelFatness(self,0);

	//-------- Talente --------
	
	//-------- inventory --------
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7266;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_7266 ()
{
	TA_Circle		(00,00,08,00,"GRYD_082");
	TA_Circle		(08,00,24,00,"GRYD_082");	
};