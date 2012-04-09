instance Mod_1475_BUD_Buddler_OM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_om_buddler;
	guild =							GIL_KDF;      
	level =							2;

	
	voice =							2;
	id =							1475;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic", 69,  1, vlk_armor_l);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents -------- 																
	B_SetFightSkills (self, 30); 
	B_SetAttributesToChapter (self, 2);                                   

	
	//-------- inventory --------                                    
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1475;
	};

FUNC VOID Rtn_start_1475 ()
{
	TA_Pick_Ore (00,00,12,00,"OM_PICKORE_13");
	TA_Pick_Ore (12,00,24,00,"OM_PICKORE_13");
};

FUNC VOID Rtn_Pause_1475 ()
{
	TA_Stand_Eating (00,00,12,00,"OM_PICKORE_13");
	TA_Stand_Eating (12,00,24,00,"OM_PICKORE_13");
};