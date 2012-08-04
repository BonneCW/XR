instance Mod_7798_SMK_Drake_OM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Drake";
	npctype		=	npctype_main;
	guild 		=	GIL_OUT;
	level 		= 	50;		// wegen XP!
	voice 		=	11;
	id 			=	7798;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	aivar[AIV_IGNORE_Murder]		= TRUE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	   
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", 110, BodyTex_L, itar_smk_L);

    	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 80);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7798;
};

FUNC VOID Rtn_start_7798 () //MarktplatzPatrouille
{
	TA_Stand_Guarding     	(00,00,08,00,"OM_CAVE1_12");	
	TA_Stand_Guarding	(08,00,24,00,"OM_CAVE1_12");
};