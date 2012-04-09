instance Mod_7715_STT_Balam_REL (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Balam";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_out;
	level 		=		3;
	
	
	voice 		=		4;
	id 			=		7715;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							body mesh,				bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0", 	0, 		1,		"Hum_Head_Fighter", 15,			1,			ItAr_Barkeeper);
	
	Mdl_SetModelFatness(self,2);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 
	B_SetFightSkills	(self, 15);	
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7715;
};

FUNC VOID Rtn_start_7715 ()
{
	TA_Cook_Stove		(08,00,18,00,"REL_MOOR_146");
	TA_Cook_Stove		(18,00,08,00,"REL_MOOR_146");
};