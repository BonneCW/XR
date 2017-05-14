instance Mod_7800_SMK_Alberto_OM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Alberto";
	npctype		=	npctype_main;
	guild 		=	GIL_OUT;
	level 		= 	50;		// wegen XP!
	voice		= 0;
	id 			=	7800;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	aivar[AIV_IGNORE_Murder]		= TRUE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	   
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", 55, BodyTex_L, itar_smk_L);

    	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 80);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7800;
};

FUNC VOID Rtn_start_7800 () //MarktplatzPatrouille
{
	TA_Stand_Guarding	(00,00,12,00,"OM_203");
	TA_Stand_Guarding	(12,00,00,00,"OM_203");
};