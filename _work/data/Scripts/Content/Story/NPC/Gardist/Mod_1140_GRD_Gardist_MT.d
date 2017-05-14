instance Mod_1140_GRD_Gardist_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_mt_gardist;
	flags		=	0;	// weil Windenwache !!! wird in Kapitel 4 gelöscht!
	guild 		=	GIL_OUT;
	level 		=	15;
	voice		= 0;
	id 			=	1140;
	
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_FatBald", 5,  2, GRD_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 60);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Prestart_1140;
};

FUNC VOID Rtn_Prestart_1140 ()
{
	TA_Stand_Guarding		(05,00,23,00, "OCR_NORTHGATE_VWHEEL");
	TA_Stand_Guarding		(23,00,05,00, "OCR_NORTHGATE_VWHEEL");
};