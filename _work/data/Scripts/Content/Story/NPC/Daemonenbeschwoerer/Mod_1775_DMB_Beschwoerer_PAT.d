instance Mod_1775_DMB_Beschwoerer_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Beschwoerer;
	npctype =						npctype_main;
	guild =							GIL_DMT;      
	level =							50;
	
	
	voice		= 0;
	id =							1775;
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_MAGE.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald",195 , BodyTex_B, ITAR_XARDAS);
	Mdl_SetModelFatness (self, 0);																		
	EquipItem	(self, ItMW_BeliarStab);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talents  --------    																
	B_SetAttributesToChapter (self, 6);  
	B_SetFightSkills	(self, 65);                              

	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1775;
	};

FUNC VOID Rtn_start_1775 ()
{
	TA_Stand_WP	(21,00,04,00,"WP_PAT_WEG_34");
    TA_Stand_WP		(04,00,21,00,"WP_PAT_WEG_34");
};