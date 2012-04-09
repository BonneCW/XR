instance Mod_7699_KGD_Typ_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Königstreuer";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	level 		=	20;
	voice 		=	9;
	id 			=	7699;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	


	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 55,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_2h_Sld_Sword);
	
		        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7699;
};

FUNC VOID Rtn_start_7699 ()
{

	TA_Stand_Eating	(00,00,20,00,"NW_CITY_CITYHALL_WARROOM_02");	
	TA_Stand_Eating	(20,00,00,00,"NW_CITY_CITYHALL_WARROOM_02");	
};
