instance Mod_1557_SFB_Schuerfer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_mt_schuerfer;
	guild =							GIL_mil;      
	level =							6;
	flags =							0;
	
	voice		= 0;
	id =							1557;


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
	//				body mesh,				head mesh,				40hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony",94 ,  1,SFB_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    

	//-------- inventory --------                                    

	
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1557;
	
};

FUNC VOID Rtn_FMCstart_1557 ()
{
	TA_Pick_Ore	(01,00,13,00, "FMC_ORE_06");
	TA_Pick_Ore	(13,00,01,00, "FMC_ORE_06");
};












