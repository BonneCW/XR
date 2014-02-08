instance Mod_1627_VMG_Ken_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Ken";
	npctype =						npctype_main;
	guild =							GIL_out;      
		
	voice =							3;
	id =							1627;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 230,  0, ITAR_Verwandlungskrieger);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talents  --------  																
	B_SetAttributesToChapter (self, 6);                                  
	
	//-------- inventory --------                                    
	EquipItem	(self, ItMw_Nagelkeule);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1627;
};

FUNC VOID Rtn_start_1627 ()
{
	TA_Stand_Guarding (00,00,12,00,"OW_PATH_175_GATE1");
	TA_Stand_Guarding (12,00,24,00,"OW_PATH_175_GATE1");
};













