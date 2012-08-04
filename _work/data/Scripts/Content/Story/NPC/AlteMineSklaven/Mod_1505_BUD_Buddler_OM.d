instance Mod_1505_BUD_Buddler_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_om_buddler;
	guild =							GIL_OUT;      
	level =							5;
	
	
	voice =							2;
	id =							1505;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 74,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------    																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);                                

	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1505;
	};

FUNC VOID Rtn_start_1505 ()
{
	TA_Pick_Ore		(21,00,04,00,"OM_CAVE3_14");
    TA_Pick_Ore	    (04,00,21,00,"OM_CAVE3_14");
};

FUNC VOID Rtn_Pause_1505 ()
{
	TA_Stand_Eating		(21,00,04,00,"OM_CAVE3_14");
	TA_Stand_Eating	    (04,00,21,00,"OM_CAVE3_14");
};
