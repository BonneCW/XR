instance Mod_1172_STT_Omid_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Omid";
	npctype 	=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		3;
	
	
	voice 		=		2;
	id 			=		1172;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							body mesh,				bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0", 	0, 		1,		"Hum_Head_Psionic", 16,			1,			ItAr_Barkeeper);

	Mdl_SetModelFatness(self,0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 10);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1172;
};

FUNC VOID Rtn_start_1172 ()
{
	TA_Cook_Cauldron		(08,05,18,05,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook_Cauldron		(18,05,08,05,"OCC_KITCHEN");
};

