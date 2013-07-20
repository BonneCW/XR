FUNC VOID B_PrismaAdd(var int damage) {
	if (!Npc_IsInFightMode(hero, FMODE_MAGIC)) {
		return;
	};

	if (Mod_PrismaAngelegt == 0) {
		return;
	};

	damage = damage / 2;

	if (damage >= hero.attribute[ATR_HITPOINTS]) {
		Print	("Dazu reicht meine Kraft nicht aus.");

		return;
	};

	if (Mod_Prisma_Array[3] == 0) {
		if (Mod_Prisma_Array[0] == 0) {
			Mod_Prisma_Array[0] = damage;
		} else if (Mod_Prisma_Array[1] == 0) {
			Mod_Prisma_Array[1] = damage;
		} else if (Mod_Prisma_Array[2] == 0) {
			Mod_Prisma_Array[2] = damage;
		} else if (Mod_Prisma_Array[3] == 0) {
			Mod_Prisma_Array[3] = damage;
		};

		if (Mod_Prisma_Start == FALSE) {
			Mod_Prisma_Start = TRUE;

			Log_CreateTopic	(TOPIC_MOD_PRISMA, LOG_NOTE);
			B_LogEntry	(TOPIC_MOD_PRISMA, "Ich habe jetzt herausgefunden, was der Nachteil beim Prisma ist: Wenn ich es auflade, fühlt es sich an, als würde ein Teil meines Selbst entrissen, und ich werde schwächer.");
		};

		B_MagicHurtNpc	(hero, hero, damage);

		hero.attribute[ATR_HITPOINTS_MAX] -= damage;
	};
};

FUNC VOID B_KillWithPrisma(var C_NPC slf)
{
	if (Npc_IsDead(slf))
	{
		return;
	};

	if (Npc_GetDistToNpc(slf, hero) > 500)
	{
		return;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{
		return;
	};

	B_MagicHurtNpc (hero, slf, Mod_Prisma_Array[0] + Mod_Prisma_Array[1] + Mod_Prisma_Array[2] + Mod_Prisma_Array[3]);
};