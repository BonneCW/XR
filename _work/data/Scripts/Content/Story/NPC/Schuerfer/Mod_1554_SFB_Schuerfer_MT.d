instance Mod_1554_SFB_Schuerfer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Schuerfer;                            
	npctype =				npctype_mt_schuerfer;                            
	guild =					GIL_mil;      
	level =					3;
	voice		= 0;
	id =					1554;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3, 1,"Hum_Head_Fighter", 44,  1, SFB_ARMOR_L);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    

	//-------- inventory --------                                    

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1554;

};

FUNC VOID Rtn_FMCstart_1554 ()
{
	TA_Pick_Ore	(01,00,13,00, "FMC_ORE_03");
	TA_Pick_Ore	(13,00,01,00, "FMC_ORE_03");
};













