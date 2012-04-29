instance Mod_7803_TPL_GorNaKosh_OM (Npc_Default)
{
	//-------- primary data --------
	name =							"Na Kosh";
	npctype =						npctype_Main;
	guild =							GIL_OUT;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							7803;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,64headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 20 ,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																	
	B_SetFightSkills (self, 65); 
	
	//-------- inventory --------
	
	//EquipItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItems (self, ItMi_Joint, 10);	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7803;
};

FUNC VOID Rtn_Start_7803 ()
{
	TA_Sit_Chair		(00,00,12,00,"OM_207");	
	TA_Sit_Chair		(12,00,24,00,"OM_207");		
};

func void Rtn_Tot_7803 ()
{
	TA_Stand_Drinking	(00,00,12,00,"OCC_BARONS_DANCE2");
	TA_Stand_Drinking	(12,00,24,00,"OCC_BARONS_DANCE2");
};