instance Mod_1497_BUD_Aleph_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Aleph";
	npctype =						npctype_main;
	guild =							GIL_KDF;      
	level =							5;
	
	
	voice =							5;
	id =							1497;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Thief", 71,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                  																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1497;
	};

FUNC VOID Rtn_start_1497 ()
{   
	TA_Pick_Ore	(16,00,04,00,"OM_PICKORE_05");
	TA_Pick_Ore	(04,00,16,00,"OM_PICKORE_05");
};

FUNC VOID Rtn_Pause_1497 ()
{   
	TA_Stand_Eating	(16,00,04,00,"OM_PICKORE_05");
	TA_Stand_Eating	(04,00,16,00,"OM_PICKORE_05");
};