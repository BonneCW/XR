instance Mod_1878_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardistATBANDIT;
	guild 		=	GIL_out;
	level 		=	10;
	voice		= 0;
	id 			=	1878;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;
	B_SetAttributesToChapter (self, 2);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 16,  1, GRD_ARMOR_M);
        
       Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 55); 		
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1878;
};

FUNC VOID Rtn_start_1878 ()
{
	TA_Stand_Guarding	(08,00,20,00,"LOCATION_11_07");
	TA_Stand_Guarding	(20,00,08,00,"LOCATION_11_07");
};

FUNC VOID Rtn_Wache_1878 ()
{
	TA_Stand_Guarding	(08,00,20,00,"LOCATION_11_15");
	TA_Stand_Guarding	(20,00,08,00,"LOCATION_11_15");
};

FUNC VOID Rtn_Feuerregen_1878 ()
{
	TA_Stand_Guarding	(06,00,21,00,"LOCATION_11_08");
	TA_Stand_Guarding	(21,00,06,00,"LOCATION_11_08");	
};



