instance Mod_2009_TPL_GorNaRan_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Ran";
	npctype =						npctype_Main;
	guild =							GIL_OUT;
	flags =							0;	
	voice =							13;
	id =							2009;
		
	

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			Body-Mesh	Body-Tex  Skin-Color	Head-MMS    Head-Tex	Teeth-Tex Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 168, 3, TPL_ARMOR_H);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	B_SetAttributesToChapter (self, 6);	
	B_SetFightSkills (self, 55);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	//-------- Talente -------- 

	//-------- inventory --------
	
	EquipItem (self, ItMw_Zweihaender2);
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_2009;
};

FUNC VOID Rtn_Start_2009 ()
{
	TA_Stand_Guarding	(00,00,12,00,"PSI_GUARD3");
	TA_Stand_Guarding	(12,00,24,00,"PSI_GUARD3");
};

FUNC VOID Rtn_Staude_2009 ()
{
	TA_Guide_Player		(00,00,12,00,"PATH_AROUND_PSI09");
	TA_Guide_Player		(12,00,24,00,"PATH_AROUND_PSI09");
};