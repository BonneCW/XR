instance Mod_1568_SFB_Schuerfer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Schuerfer;                            
	npctype =				NPCTYPE_mt_schuerfer;                            
	guild =					GIL_mil;      
	level =					3;
	voice		= 0;
	id =					1568;


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
	//				body mesh,				head mesh,				44hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3, 1,"Hum_Head_Fighter",95 ,  1, SFB_ARMOR_L);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    

	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1568;

};

FUNC VOID Rtn_start_1568 ()
{
	TA_Stand_ArmsCrossed 	(10,00,03,00,"NC_TAVERN_ROOM06");
	TA_Stand_ArmsCrossed	(03,00,10,00,"NC_TAVERN_ROOM06");
};