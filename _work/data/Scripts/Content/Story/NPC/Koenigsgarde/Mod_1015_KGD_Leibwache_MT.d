instance Mod_1015_KGD_Leibwache_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Leibwache";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice		= 0;
	id 			=	1015;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");


	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 1,"Hum_Head_Thief", 70,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 75); 
	B_SetAttributesToChapter (self, 5);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_Schwert1);
		        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1015;
};

FUNC VOID Rtn_start_1015 ()
{

	TA_Stand_WP	(00,00,20,00,"MC_THRON_G_1");	
	TA_Stand_WP	(20,00,00,00,"MC_THRON_G_1");	
};
