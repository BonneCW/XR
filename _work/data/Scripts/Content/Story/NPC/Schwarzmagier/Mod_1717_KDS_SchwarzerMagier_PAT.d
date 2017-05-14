instance Mod_1717_KDS_SchwarzerMagier_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_SchwarzerMagier;
	npctype =						npctype_PAT_SchwarzerMagier;
	guild =							GIL_KDF;      
	level =							5;
	
	
	voice		= 0;
	id =							1718;


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
	EquipItem	(self, ItMW_BeliarStab);
	
	//-------- Talents  --------    																
	B_SetFightSkills (self, 40);                             
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1718;
};

FUNC VOID Rtn_start_1718 ()
{
	TA_Circle		(21,00,04,00,"WP_PAT_LAGER_06_24");
    TA_Circle	    (04,00,21,00,"WP_PAT_LAGER_06_24");	
};

FUNC VOID Rtn_Patherion_1718 ()
{
	TA_Pick_FP		(21,00,04,00,"WP_PAT_UNTERGRUND_15");
    TA_Pick_FP	    (04,00,21,00,"WP_PAT_UNTERGRUND_15");	
};