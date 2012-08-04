instance Mod_1493_BUD_Buddler_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_om_buddler;
	guild =							GIL_OUT;      
	level =							4;
	
	
	voice =							3;
	id =							1493;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Psionic", 0,  2, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------   																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);                                 
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1493;
	};

FUNC VOID Rtn_start_1493 ()
{
	TA_Pick_Ore		(23,00,06,00,"OM_CAVE3_04B");
	TA_Pick_Ore 		(06,00,23,00,"OM_CAVE3_04B");
};

FUNC VOID Rtn_Pause_1493 ()
{
	TA_Stand_Eating		(23,00,06,00,"OM_CAVE3_04B");
	TA_Stand_Eating		(06,00,23,00,"OM_CAVE3_04B");
};
