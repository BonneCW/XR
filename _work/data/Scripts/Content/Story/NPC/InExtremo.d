// Babe von VIVA

instance Charlotte (Npc_Default)
{
	//-------- primary data --------
	
	name 						=	"Charlotte";
	npctype						= 	npctype_main;
	guild 						=	GIL_OUT;
	level 						=	1;
	voice 						=	16;
	id 							=	1897;
	flags      					=   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 5;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 40;
	attribute[ATR_HITPOINTS] 	= 40;

	//-------- visuals --------
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_L_Charlotte2, BodyTexBabe_L, NO_ARMOR);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");
	
	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_1897;
};

FUNC VOID Rtn_concert_1897 () 
{
	TA_Dance	(08,00,20,00,"OCR_AUDIENCE_03");
	TA_Dance	(20,00,08,00,"OCR_AUDIENCE_03");
};



/////////////////////////////////////////
// Publikum		1	  ///////////////////
/////////////////////////////////////////

instance IEFan1 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_OUT;      
	level =							5;	
	voice =							2;
	id =							1898;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		1,			1,			"Hum_Head_FatBald", 	74,  		DEFAULT, 	-1);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	//-------- inventory --------   

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_1898;
};

FUNC VOID Rtn_concert_1898 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_01");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_01");
};


/////////////////////////////////////////
// Publikum		2	  ///////////////////
/////////////////////////////////////////

instance IEFan2 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_OUT;      
	level =							5;	
	voice =							2;
	id =							1899;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		2,			1,			"Hum_Head_FatBald", 	73,  		DEFAULT, 	-1);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    


	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_1899;
};

FUNC VOID Rtn_concert_1899 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_02");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_02");
};

/////////////////////////////////////////
// Publikum		3	  ///////////////////
/////////////////////////////////////////

instance IEFan3 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_OUT;      
	level =							5;	
	voice =							2;
	id =							1900;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		2,			0,			"Hum_Head_FatBald", 	10,  		DEFAULT, 	-1);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	//-------- inventory --------    

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_1900;
	};

FUNC VOID Rtn_concert_1900 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_03");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_03");
};

/////////////////////////////////////////
// Publikum		4	  ///////////////////
/////////////////////////////////////////

instance IEFan4 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_OUT;      
	level =							5;	
	voice =							2;
	id =							1901;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		4,			2,			"Hum_Head_FatBald", 	4,  		DEFAULT, 	-1);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	//-------- inventory --------     

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_1901;
	};

FUNC VOID Rtn_concert_1901 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_04");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_04");
};