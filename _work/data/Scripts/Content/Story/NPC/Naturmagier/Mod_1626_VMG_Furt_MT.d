instance Mod_1626_VMG_Furt_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Furt";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							3;
	flags	= 2;
	
	voice		= 0;
	id =							1626;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_mage.mds");
	//				body mesh,				head mesh,				69hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 231,  0, itar_naturmagier2);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_master; 

	//-------- Talents --------  	
	B_SetAttributesToChapter (self, 4);    

	CreateInvItems	(self, ItMw_FurtsSchwert, 1);                              

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1626;
	
	//------------ //MISSIONs------------------
	
};

FUNC VOID Rtn_start_1626 ()
{
	TA_Smalltalk	    (08,00,18,00,"OW_PATH_SNAPPER04_SPAWN01");  
	TA_Smalltalk	    (18,00,08,00,"OW_PATH_SNAPPER04_SPAWN01");
};

FUNC VOID Rtn_Ritual_1626 ()
{	
	TA_Ritual_VM		(08,00,23,00,"VMG_06");
	TA_Ritual_VM		(23,00,08,00,"VMG_06");
};

FUNC VOID Rtn_Flucht_1626 ()
{	
	TA_RunToWP		(08,00,23,00,"TOT");
	TA_RunToWP		(23,00,08,00,"TOT");
};

FUNC VOID Rtn_Insel_1626 ()
{	
	TA_RunToWP		(08,00,23,00,"SPAWN_OW_BLOODFLY_E_3");
	TA_RunToWP		(23,00,08,00,"SPAWN_OW_BLOODFLY_E_3");
};