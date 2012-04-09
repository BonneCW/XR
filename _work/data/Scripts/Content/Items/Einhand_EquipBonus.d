/*
	Equip Funktionen für Einhand Waffen 
	Talent Bonus 
*/
//const für Talentboni stehen in Tuning Melee Weaposn

//----------------------------1----------------------------------
FUNC VOID Equip_1H_01()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_01);
		B_MeleeWeaponChange(Waffenbonus_01, 0, 0);

		Bonus_1h += Waffenbonus_01;
	};
};
FUNC VOID UnEquip_1H_01()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_01);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_01;
	};
};
//-----------------------------2---------------------------------
FUNC VOID Equip_1H_02()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_02);
		B_MeleeWeaponChange(Waffenbonus_02, 0, 0);

		Bonus_1h += Waffenbonus_02;
	};
};
FUNC VOID UnEquip_1H_02()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_02);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_02;
	};
};
//-----------------------------3---------------------------------
FUNC VOID Equip_1H_03()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_03);
		B_MeleeWeaponChange(Waffenbonus_03, 0, 0);

		Bonus_1h += Waffenbonus_03;
	};
};
FUNC VOID UnEquip_1H_03()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_03);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_03;
	};
};
//------------------------------4--------------------------------
FUNC VOID Equip_1H_04()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_04);
		B_MeleeWeaponChange(Waffenbonus_04, 0, 0);

		Bonus_1h += Waffenbonus_04;
	};
};
FUNC VOID UnEquip_1H_04()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_04);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_04;
	};
};
//----------------------------5----------------------------------
FUNC VOID Equip_1H_05()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_05);
		B_MeleeWeaponChange(Waffenbonus_05, 0, 0);

		Bonus_1h += Waffenbonus_05;
	};
};
FUNC VOID UnEquip_1H_05()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_05);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_05;
	};
};
//--------------------------6------------------------------------
FUNC VOID Equip_1H_06()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_06);
		B_MeleeWeaponChange(Waffenbonus_06, 0, 0);

		Bonus_1h += Waffenbonus_06;
	};
};
FUNC VOID UnEquip_1H_06()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_06);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_06;
	};
};
//---------------------------7-----------------------------------
FUNC VOID Equip_1H_07()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_07);
		B_MeleeWeaponChange(Waffenbonus_07, 0, 0);

		Bonus_1h += Waffenbonus_07;
	};
};
FUNC VOID UnEquip_1H_07()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_07);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_07;
	};
};
//-----------------------------8---------------------------------
FUNC VOID Equip_1H_08()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_08);
		B_MeleeWeaponChange(Waffenbonus_08, 0, 0);

		Bonus_1h += Waffenbonus_08;
	};
};
FUNC VOID UnEquip_1H_08()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_08);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_08;
	};
};
//--------------------------9------------------------------------
FUNC VOID Equip_1H_09()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_09);
		B_MeleeWeaponChange(Waffenbonus_09, 0, 0);

		Bonus_1h += Waffenbonus_09;
	};
};
FUNC VOID UnEquip_1H_09()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_09);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_09;
	};
};
//----------------------------10----------------------------------
FUNC VOID Equip_1H_10()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_10);
		B_MeleeWeaponChange(Waffenbonus_10, 0, 0);

		Bonus_1h += Waffenbonus_10;
	};
};
FUNC VOID UnEquip_1H_10()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_10);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_10;
	};
};
//----------------------------11----------------------------------
FUNC VOID Equip_1H_11()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_11);
		B_MeleeWeaponChange(Waffenbonus_11, 0, 0);

		Bonus_1h += Waffenbonus_11;
	};
};
FUNC VOID UnEquip_1H_11()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_11);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_11;
	};
};
//----------------------------12----------------------------------
FUNC VOID Equip_1H_12()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_12);
		B_MeleeWeaponChange(Waffenbonus_12, 0, 0);

		Bonus_1h += Waffenbonus_12;
	};
};
FUNC VOID UnEquip_1H_12()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_12);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_12;
	};
};
//----------------------------13----------------------------------
FUNC VOID Equip_1H_13()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_13);
		B_MeleeWeaponChange(Waffenbonus_13, 0, 0);

		Bonus_1h += Waffenbonus_13;
	};
};
FUNC VOID UnEquip_1H_13()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_13);
		B_MeleeWeaponUndoChange();

		Bonus_1h -= Waffenbonus_13;
	};
};


