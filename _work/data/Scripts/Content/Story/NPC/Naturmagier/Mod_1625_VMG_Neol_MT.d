instance Mod_1625_VMG_Neol_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Neol";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							3;
								
	
	voice =							1;
	id =							1625;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_mage.mds");
	//				body mesh,				head mesh,			70	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald", 234,  0, itar_naturmagier2);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_master; 

	//-------- Talents --------       																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 4);                             

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1625;
	};

FUNC VOID Rtn_start_1625 ()
{
	TA_Smalltalk		(00,00,23,00,"OW_PATH_SNAPPER04_SPAWN01");
	TA_Smalltalk		(23,00,24,00,"OW_PATH_SNAPPER04_SPAWN01");
};

FUNC VOID Rtn_Ritual_1625 ()
{	
	TA_Ritual_VM		(08,00,23,00,"OW_PATH_176");
	TA_Ritual_VM		(23,00,08,00,"OW_PATH_176");
};