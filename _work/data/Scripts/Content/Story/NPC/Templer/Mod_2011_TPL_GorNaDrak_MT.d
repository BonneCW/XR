instance Mod_2011_TPL_GorNaDrak_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Drak";
	npctype =						npctype_Main;
	guild =							GIL_OUT;
	level =							21;
	
	voice		= 0;
	id =							2011;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	292;
	attribute[ATR_HITPOINTS] =		292;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 168,  1, TPL_ARMOR_H);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	
	//-------- inventory --------
	EquipItem (self, ItMw_Zweihaender2);
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2011;
};

FUNC VOID Rtn_start_2011 () //ST-OM-Pendler (MC-Jäger)
{
	TA_Smalltalk	(06,00,14,00,"PSI_WALK_05");
	TA_Smalltalk	(14,00,06,00,"PSI_WALK_05");
};