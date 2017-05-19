instance Mod_2002_BAU_Ricelord_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Reislord";
	npctype 	=	NPCTYPE_MAIN;	
	guild 		=	GIL_MIL;      
	level 		=	10;
	voice		= 11;
	id 			=	2002; 

	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"Hum_Body_Naked0",1,1,"Hum_Head_Bald",163 ,  1,ITAR_SMITH);
	
	
	Mdl_SetModelFatness(self,2);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                                    
	
	

	//-------- inventory --------                                    
		
		
		EquipItem  (self, Heerscherstab); 		
		
		
					
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2002;
	
};

FUNC VOID Rtn_start_2002 ()
{
	TA_Stand_Guarding			(05,00,22,00,"NC_RICELORD");
	TA_Sleep		(22,00,05,00,"NC_RICEBUNKER_10");
};