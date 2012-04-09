instance Mod_1877_GRD_Gardist_MT (Npc_Default)
{                
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardistATBANDIT;
	flags		=	0;	// weil Windenwache !!! wird in Kapitel 4 gelöscht!
	guild 		=	GIL_out;
	level 		=	20;
	voice 		=	6;
	id 			=	1877;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;
	B_SetAttributesToChapter (self, 2);	

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 55); 		
			
	//-------- inventory --------
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1877;
};

FUNC VOID Rtn_start_1877 ()
{
	TA_Stand_Guarding	(08,00,20,00,"LOCATION_11_07");
	TA_Stand_Guarding	(20,00,08,00,"LOCATION_11_07");
};

FUNC VOID Rtn_Wache_1877 ()
{
	TA_Stand_Guarding	(08,00,20,00,"LOCATION_11_16");
	TA_Stand_Guarding	(20,00,08,00,"LOCATION_11_16");
};

FUNC VOID Rtn_Feuerregen_1877 ()
{
	TA_Stand_Guarding	(06,00,21,00,"LOCATION_11_08");
	TA_Stand_Guarding	(21,00,06,00,"LOCATION_11_08");	
};




