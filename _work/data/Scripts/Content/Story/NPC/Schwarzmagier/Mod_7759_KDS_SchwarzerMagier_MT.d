instance Mod_7759_KDS_SchwarzerMagier_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerMagier;
	npctype =						npctype_MAIN;
	guild =							GIL_KDF;      
	level =							5;
	
	
	voice		= 0;
	id =							7759;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Fighter", 73,  1, SCHWARZMAGIERROBE);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------    																
	B_SetFightSkills (self, 40); 															
	EquipItem	(self, ItMW_BeliarStab);                          
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7759;
};

FUNC VOID Rtn_start_7759 ()
{
	TA_Read_Bookstand	(21,00,04,00,"LABYRINTH_129");
	TA_Read_Bookstand	(04,00,21,00,"LABYRINTH_129");	
};