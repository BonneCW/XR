instance Mod_1630_VMG_Ferco_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Ferco";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							2;

	
	voice		= 0;
	id =							1630;


	//-------- abilities --------
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald", 244,  0, ITAR_Verwandlungskrieger);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_master; 

	//-------- Talents -------- 	
	B_SetAttributesToChapter (self, 5);                                   

	
	//-------- inventory --------                                    
	EquipItem	(self, ItMw_ShortSword3);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1630;
};

FUNC VOID Rtn_start_1630 ()
{
	TA_Stand_Guarding (00,00,12,00,"OW_PATH_175_GATE1");
	TA_Stand_Guarding (12,00,24,00,"OW_PATH_175_GATE1");
};