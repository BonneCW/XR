// ************
// SPL_Fackel
// ************

const int SPL_Cost_Fackel		= 2;
const int SPL_Damage_Fackel		= 0;


INSTANCE Spell_Fackel (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Fackel;
	damageType			= DAM_MAGIC;
	targetCollectType		= TARGET_TYPE_ALL;
};

func int Spell_Logic_Fackel (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Fackel)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Fackel()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Fackel;
	};

	var oCNpc her;
	her = Hlp_GetNpc (hero);
		
	if (her.focus_vob)
	{
		if (Hlp_Is_oCMobFire(her.focus_vob))
		{
			var oCMobFire her_focusMob;
			MEM_AssignInst (her_focusMob, her.focus_vob);

			if (her_focusMob.fireVobtree == 0)
			{
				MEM_TriggerVob	(her.focus_vob); // Feuer anschalten
			}
			else
			{
				MEM_UnTriggerVob	(her.focus_vob); // Feuer anschalten
			};
			
			if (Hlp_StrCmp(her_focusMob._zCObject_objectName, "FIREPLACE_DIEBKELLER"))
			&& (Mod_Diebe_FackelAn == FALSE)
			{
				Mod_Diebe_FackelAn = TRUE;

				B_StartOtherRoutine	(Mod_7576_OUT_Metzger_REL, "FLUCHT");
				B_StartOtherRoutine	(Mod_7578_OUT_Brauer_REL, "FLUCHT");
			};
		};
	};

	self.aivar[AIV_SelectSpell] += 1;
};
