instance Mod_7627_BUD_Costa_VM (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Costa";
	npctype =						npctype_MAIN;
	guild =							GIL_out;      
	level =							2;

	
	voice		= 0;
	id =							7627;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 72,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 20);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7627;
};

FUNC VOID Rtn_start_7627 () //Arenaplatz
{	
	TA_Pick_Ore	(08,00,23,00,"MINE_GO_14");
	TA_Pick_Ore	(23,00,08,00,"MINE_GO_14");	
};