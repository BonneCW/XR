instance Mod_1164_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		1164;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 54,  1, STT_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);	
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1164;
};

FUNC VOID Rtn_start_1164 ()
{
	TA_Sleep		(22,45,07,45,"OCR_HUT_38");
	TA_Sit_Campfire		(07,45,15,30,"OCR_OUTSIDE_HUT_39");
	TA_Sit_Chair		(15,30,17,00,"OCR_HUT_38");
	TA_Sit_Campfire		(17,00,22,45,"OCR_OUTSIDE_HUT_39");	
};