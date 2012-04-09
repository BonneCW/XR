instance Mod_1563_SFB_Schuerfer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_mt_schuerfer;
	guild =							GIL_mil;      
	level =							6;
	flags =							0;
	
	voice =							5;
	id =							1563;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 43,  1,SFB_ARMOR_L);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1563;

};

FUNC VOID Rtn_FMCstart_1563 ()
{
	TA_Sit_Bench	(01,00,13,00,	"FMC_HUT01_OUT");
	TA_Sit_Bench	(13,00,01,00,	"FMC_HUT01_OUT");
};





