// *********************
// Alle Transform Spells
// *********************

const int SPL_Cost_TrfMeatbug			= 10;
const int SPL_Cost_TrfOrk		= 10;
const int SPL_Cost_TrfShadowbeast		= 10;
const int SPL_Cost_TrfSnapper		= 10;
const int SPL_Cost_TrfWarg			= 10;
const int SPL_Cost_TrfBlackTroll			= 10;
const int SPL_Cost_TrfGolem		= 10;
const int SPL_Cost_TrfBloodfly			= 10;
const int SPL_Cost_TrfBloodhound		= 10;
const int SPL_Cost_TrfKeiler		= 10;
const int SPL_Cost_TrfSheep	= 10;
const int SPL_Cost_TrfSkeleton	= 10;
const int SPL_Cost_TrfWoman	= 10;

// ------ Instanz für alle Transform-Sprüche ------
INSTANCE Spell_Transform (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	canTurnDuringInvest		= 0;
};

// ------ Schaf ------
func int Spell_Logic_TrfMeatbug (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfMeatbug;

		Mod_IsFleischwanze = 1;
		
		if (C_NpcIsHero(self))
		{	
			Npc_SetActiveSpellInfo(self, MeatbugTransform);
		};

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_TrfMeatbug)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfMeatbug;
		
		Npc_SetActiveSpellInfo(self, WargTransform);

		Mod_WM_IsWarg = 1;

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};
func int Spell_Logic_TrfWoman (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWoman)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWoman;
		
		if (C_NpcIsHero(self))
		{	
			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (hero, "hum_body_babe0", 5,				0,			"Hum_Head_Babe1", 	FaceBabe_N_WhiteCloth,	0, 			NO_Armor);
			Mdl_ApplyOverlayMds	(hero, "Humans_Babe.mds"); 

			Mod_TrfWoman_Time = 7200;

			if (Mod_TrfWoman == 0)
			{
				hero.attribute[ATR_STRENGTH] -= 15;
				hero.attribute[ATR_DEXTERITY] += 20;
				hero.attribute[ATR_HITPOINTS] -= 40;
				hero.attribute[ATR_HITPOINTS_MAX] -= 40;

				Mod_TrfWoman = 1;
			};
		};

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};
func int Spell_Logic_TrfWomanBack (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWoman)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWoman;
		
		if (C_NpcIsHero(self))
		{	
			AI_UnequipArmor	(hero);

			Mdl_SetVisual (hero,"HUMANS.MDS");
			// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

			Mdl_RemoveOverlayMDS	(hero, "HUMANS_BABE.MDS");

			Mod_TrfWoman_Time = 0;

			if (Mod_TrfWoman == 1)
			{
				hero.attribute[ATR_STRENGTH] += 15;
				hero.attribute[ATR_DEXTERITY] -= 20;
				hero.attribute[ATR_HITPOINTS] += 40;
				hero.attribute[ATR_HITPOINTS_MAX] += 40;

				Mod_TrfWoman = 0;
			};
		};

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfSkeleton2 (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWoman)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWoman;
		
		if (C_NpcIsHero(self))
		{	
			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody		(hero,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

			Mod_TrfSkeleton2_Time = 7200;

			playerIsTransformed = 1;

			hero.guild = GIL_SKELETON;

			if (Mod_TrfSkeleton2 == 0)
			{
				Mod_TrfSkeleton2 = 1;
			};
		};

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Scavenger ------
func int Spell_Logic_TrfOrk (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfOrk)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfOrk;

		Npc_SetActiveSpellInfo(self, HarpieTransform);

		Mod_CountVerwandlungen += 1;
			
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Giant Rat ------
func int Spell_Logic_TrfShadowbeast (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfShadowbeast)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfShadowbeast;
			
		Npc_SetActiveSpellInfo(self, ShadowbeastTransform);

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};


// ------ Giant BUG ------
func int Spell_Logic_TrfSnapper (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfSnapper)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSnapper;
			
		Npc_SetActiveSpellInfo(self, SnapperTransform);

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Wolf ------
func int Spell_Logic_TrfWarg (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWarg)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWarg;

		Mod_WM_IsWarg = 1;
			
		Npc_SetActiveSpellInfo(self, WargTransform);

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Waran ------
func int Spell_Logic_TrfBlackTroll (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfBlackTroll)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfBlackTroll;
			
		Npc_SetActiveSpellInfo(self, BlackTrollTransform);

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Snapper ------
func int Spell_Logic_TrfGolem (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfGolem)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGolem;
			
		Npc_SetActiveSpellInfo(self, GolemTransform);

		Mod_IstGolem = 1;

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Warg ------
func int Spell_Logic_TrfBloodfly (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfBloodfly)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfBloodfly;
			
		Npc_SetActiveSpellInfo(self, BloodflyTransform);

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Feuerwaran ------
func int Spell_Logic_TrfBloodhound (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfBloodhound)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfBloodhound;
			
		Npc_SetActiveSpellInfo(self, BloodhoundTransform);

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Lurker ------
func int Spell_Logic_TrfKeiler (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfKeiler)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfKeiler;
			
		Npc_SetActiveSpellInfo(self, KeilerTransform);

		Mod_IstKeiler = 1;

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Shadowbeast ------
func int Spell_Logic_TrfSheep (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfSheep)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSheep;
			
		Npc_SetActiveSpellInfo(self, SheepTransform);

		Mod_CountVerwandlungen += 1;

		Mod_IstSchaf = 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Dragon Snapper ------
func int Spell_Logic_TrfSkeleton (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfSkeleton)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSkeleton;
			
		Npc_SetActiveSpellInfo(self, RabbitTransform);

		Mod_IsRabbit = 1;

		Mod_CountVerwandlungen += 1;

		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};