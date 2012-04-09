instance Mod_1880_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardistATBANDIT;
	guild 		=	GIL_out;
	level 		=	10;
	voice 		=	13;
	id 			=	1880;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 2);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Thief", 4,  2, GRD_ARMOR_M);
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 														
	B_SetFightSkills (self, 55); 		
			
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1880;
};

FUNC VOID Rtn_start_1880 ()
{
	TA_Stand_Guarding	(08,00,20,00,"LOCATION_11_01");
	TA_Stand_Guarding	(20,00,08,00,"LOCATION_11_01");
};

FUNC VOID Rtn_Feuerregen_1880 ()
{
	TA_Stand_Guarding	(06,00,21,00,"LOCATION_11_08");
	TA_Stand_Guarding	(21,00,06,00,"LOCATION_11_08");	
};


