FUNC VOID B_PrismaAdd(var int damage)
{
	if (!Npc_IsInFightMode(hero, FMODE_MAGIC))
	{
		return;
	};

	if (Npc_HasItems(hero, ItMi_Magieprisma) == 0)
	{
		return;
	};

	if (Mod_Prisma_Array[3] == 0)
	{
		if (Mod_Prisma_Array[0] == 0)
		{
			Mod_Prisma_Array[0] = damage;
		}
		else if (Mod_Prisma_Array[1] == 0)
		{
			Mod_Prisma_Array[1] = damage;
		}
		else if (Mod_Prisma_Array[2] == 0)
		{
			Mod_Prisma_Array[2] = damage;
		}
		else if (Mod_Prisma_Array[3] == 0)
		{
			Mod_Prisma_Array[3] = damage;
		};

		if (Mod_Prisma_Start == FALSE)
		{
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
	if (Npc_GetDistToNpc(slf, hero) > 500)
	{
		return;
	};

	B_MagicHurtNpc (hero, slf, Mod_Prisma_Array[0]+Mod_Prisma_Array[1]+Mod_Prisma_Array[2]+Mod_Prisma_Array[3]);
};