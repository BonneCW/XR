instance Mod_1556_SFB_Schuerfer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Schuerfer;
	npctype = 				Npctype_mt_schuerfer;
	guild =					GIL_mil;      
	level =					6;
	flags =					0;
	
	voice		= 0;
	id =					1556;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic", 40,  1, SFB_ARMOR_L);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_FMCstart_1556;

};

FUNC VOID Rtn_FMCstart_1556 ()
{
	TA_Pick_Ore	(01,00,13,00, "FMC_ORE_05");
	TA_Pick_Ore	(13,00,01,00, "FMC_ORE_05");
};











