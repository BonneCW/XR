var int playerIsTransformed;

var int HitChanceBackupOneH;
var int HitChanceBackupTwoH;
var int ManaMaxBackup;

var int meleeWeaponChangedHero;
var int changedManaHero;
var int changedOneHHero;
var int changedTwoHHero;

var int scriptPatchWeaponChange;


func void B_MeleeWeaponChange(var int OneH, var int TwoH, var int ManaMax)
{
	meleeWeaponChangedHero = TRUE;
	changedManaHero = ManaMax;
	changedOneHHero = OneH;	
	changedTwoHHero = TwoH;

	scriptPatchWeaponChange = TRUE;
};

func void B_MeleeWeaponUndoChange()
{
	meleeWeaponChangedHero = FALSE;
	changedManaHero = 0;
	changedOneHHero = 0;	
	changedTwoHHero = 0;

	scriptPatchWeaponChange = TRUE;
};

func void B_StartMagicTransform()
{
	if (!playerIsTransformed)
	{
		playerIsTransformed = TRUE;

		HitChanceBackupOneH = self.HitChance[NPC_TALENT_1H] - changedOneHHero;
		HitChanceBackupTwoH = self.HitChance[NPC_TALENT_2H] - changedTwoHHero;
		ManaMaxBackup = self.attribute[ATR_MANA_MAX] - changedManaHero;

		Mod_HasFleisch_Amount = Npc_HasItems(hero, ItFo_MuttonRaw);

		B_MeleeWeaponUndoChange();

		transformCooldown = 0;
	};
};

func void B_StopMagicTransform()
{
	if (playerIsTransformed)
	{
		playerIsTransformed = FALSE;

		if (HitChanceBackupOneH != self.HitChance[NPC_TALENT_1H])
		{
			B_AddFightSkill(self, NPC_TALENT_1H, HitChanceBackupOneH - self.HitChance[NPC_TALENT_1H]);
		};

		if (HitChanceBackupTwoH != self.HitChance[NPC_TALENT_2H])
		{
			B_AddFightSkill(self, NPC_TALENT_2H, HitChanceBackupTwoH - self.HitChance[NPC_TALENT_2H]);
		};

		if (ManaMaxBackup != self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA_MAX] = ManaMaxBackup + changedManaHero;
		};

		AI_UnequipWeapons(self);

		Mod_WM_IsWarg = 0;
		Mod_IstKeiler = 0;
		Mod_IsRabbit = 0;
		Mod_IsFleischwanze = 0;
		Mod_TrfSkeleton2 = 0;
		Mod_IstGolem = 0;
		Mod_IstSchaf = 0;
	};
};