instance Mod_1628_VMG_Anor_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Anor";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							5;
	
	
	voice =							2;
	id =							1628;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_MAGE.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",BodyTex_P,0,"Hum_Head_FatBald", 238,  0, ITAR_DRUIDEWALDMAGIER);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talents  --------    																
	B_SetAttributesToChapter (self, 6);                                

	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1628;
	};

FUNC VOID Rtn_start_1628 ()
{
	TA_Practice_Magic	(21,00,04,00,"WP_VK_DRAGAN_PM");
    TA_Practice_Magic		(04,00,21,00,"WP_VK_DRAGAN_PM");
};

FUNC VOID Rtn_Ritual_1628 ()
{	
	TA_Ritual_VM		(08,00,23,00,"OW_PATH_176");
	TA_Ritual_VM		(23,00,08,00,"OW_PATH_176");
};