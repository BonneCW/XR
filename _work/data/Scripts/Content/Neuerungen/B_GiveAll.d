FUNC VOID B_SetSchwierigkeit()
{
	if ((self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit))
	&& ((self.guild != GIL_SHEEP)
	&& (self.guild != GIL_MEATBuG))
	{
		if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};

		if (self.aivar[AIV_Schwierigkeitsgrad] == 1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] * 10 / 3;
			self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] * 10 / 3;

			if (self.attribute[ATR_HITPOINTS_MAX] <= 0)
			{
				self.attribute[ATR_HITPOINTS_MAX] = 10;
				self.attribute[ATR_HITPOINTS] = 10;
			};

			if (self.guild > GIL_SEPERATOR_HUM)
			&& (self.guild != GIL_ORC)
			&& (self.guild != GIL_UNDEADORC)
			&& (self.guild != GIL_FRIENDLY_ORC)
			&& (self.guild != GIL_SKELETON)
			&& (self.guild != GIL_SKELETON_MAGE)
			{
				self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] * 5 / 3;
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY]  * 5 / 3;
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA]  * 5 / 3;
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX]  * 5 / 3;
			};
	
			self.aivar[AIV_Schwierigkeitsgrad] = 0;
		}
		else if (self.aivar[AIV_Schwierigkeitsgrad] == 2)
		|| (self.aivar[AIV_Schwierigkeitsgrad] == 4)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] * 1;
			self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] * 1;

			if (self.attribute[ATR_HITPOINTS_MAX] <= 0)
			{
				self.attribute[ATR_HITPOINTS_MAX] = 10;
				self.attribute[ATR_HITPOINTS] = 10;
			};

			if (self.guild > GIL_SEPERATOR_HUM)
			&& (self.guild != GIL_ORC)
			&& (self.guild != GIL_UNDEADORC)
			&& (self.guild != GIL_FRIENDLY_ORC)
			&& (self.guild != GIL_SKELETON)
			&& (self.guild != GIL_SKELETON_MAGE)
			{
				self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] * 1;
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] * 1;
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] * 1;
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] * 1;
			};

			self.aivar[AIV_Schwierigkeitsgrad] = 0;
		}
		else if (self.aivar[AIV_Schwierigkeitsgrad] == 3)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
			self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] / 2;

			if (self.attribute[ATR_HITPOINTS_MAX] <= 0)
			{
				self.attribute[ATR_HITPOINTS_MAX] = 10;
				self.attribute[ATR_HITPOINTS] = 10;
			};
	
			if (self.guild > GIL_SEPERATOR_HUM)
			&& (self.guild != GIL_ORC)
			&& (self.guild != GIL_UNDEADORC)
			&& (self.guild != GIL_FRIENDLY_ORC)
			&& (self.guild != GIL_SKELETON)
			&& (self.guild != GIL_SKELETON_MAGE)
			{
				self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] / 2;
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] / 2;
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] / 2;
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] / 2;
			};

			self.aivar[AIV_Schwierigkeitsgrad] = 0;
		};

		if (Mod_Schwierigkeit == 1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] * 3 / 10;
			self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] * 3 / 10;

			if (self.attribute[ATR_HITPOINTS_MAX] <= 0)
			{
				self.attribute[ATR_HITPOINTS_MAX] = 10;
				self.attribute[ATR_HITPOINTS] = 10;
			};

			if (self.guild > GIL_SEPERATOR_HUM)
			&& (self.guild != GIL_ORC)
			&& (self.guild != GIL_UNDEADORC)
			&& (self.guild != GIL_FRIENDLY_ORC)
			&& (self.guild != GIL_SKELETON)
			&& (self.guild != GIL_SKELETON_MAGE)
			{
				self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] * 3 / 5;
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] * 3 / 5;
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] * 3 / 5;
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] * 3 / 5;
			};

			self.aivar[AIV_Schwierigkeitsgrad] = 1;
		}
		else if (Mod_Schwierigkeit == 2)
		|| (Mod_Schwierigkeit == 4)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] * 1;
			self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] * 1;

			if (self.attribute[ATR_HITPOINTS_MAX] <= 0)
			{
				self.attribute[ATR_HITPOINTS_MAX] = 10;
				self.attribute[ATR_HITPOINTS] = 10;
			};

			if (self.guild > GIL_SEPERATOR_HUM)
			&& (self.guild != GIL_ORC)
			&& (self.guild != GIL_UNDEADORC)
			&& (self.guild != GIL_FRIENDLY_ORC)
			&& (self.guild != GIL_SKELETON)
			&& (self.guild != GIL_SKELETON_MAGE)
			{
				self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] * 1;
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] * 1;
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] * 1;
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] * 1;
			};

			self.aivar[AIV_Schwierigkeitsgrad] = Mod_Schwierigkeit;
		}
		else if (Mod_Schwierigkeit == 3)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] * 2;
			self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] * 2;

			if (self.attribute[ATR_HITPOINTS_MAX] <= 0)
			{
				self.attribute[ATR_HITPOINTS_MAX] = 10;
				self.attribute[ATR_HITPOINTS] = 10;
			};

			if (self.guild > GIL_SEPERATOR_HUM)
			&& (self.guild != GIL_ORC)
			&& (self.guild != GIL_UNDEADORC)
			&& (self.guild != GIL_FRIENDLY_ORC)
			&& (self.guild != GIL_SKELETON)
			&& (self.guild != GIL_SKELETON_MAGE)
			{
				self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] * 2;
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] * 2;
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] * 2;
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] * 2;
			};

			self.aivar[AIV_Schwierigkeitsgrad] = 3;
		};

		if (self.protection[PROT_EDGE] < 1000)
		{
			self.protection[PROT_EDGE] = 1000;
		};

		if (self.protection[PROT_BLUNT] < 1000)
		{
			self.protection[PROT_BLUNT] = 1000;
		};

		if (self.protection[PROT_POINT] < 1000)
		{
			self.protection[PROT_POINT] = 1000;
		};

		if (self.aivar[AIV_MM_REAL_ID]	==	ID_SKELETON)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_SUMMONED_SKELETON)
		|| (Hlp_GetInstanceID(self)	==	Hlp_GetInstanceID(Mod_1552_SKE_Skelett_DI))
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL_HÖHLE)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Stoneguardian)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Dragon_Undead)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_FireGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Gobbo_Skeleton)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_Gobbo_Skeleton)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_IceGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Shadowbeast_Skeleton)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_StoneGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Skeleton_Mage)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL_BLACK)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL_Silber)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_WISP)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_Golem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_IceGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_GEISTERKRIEGER)
		|| ((self.aivar[AIV_MM_REAL_ID]	==	ID_SwampGolem)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wurzelzwerg)))
		{
			self.protection[PROT_Point] = -1;
		};

		if (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL_HÖHLE)
		|| ((self.aivar[AIV_MM_REAL_ID]	==	ID_SwampGolem)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wurzelzwerg)))
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_FireGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_IceGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_StoneGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_Golem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_IceGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL_BLACK)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_TROLL_Silber)
		{
			self.protection[PROT_Fly] = -1;
		};

		if (self.aivar[AIV_MM_REAL_ID]	==	ID_Gargoyle)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_FireWaran)
		|| ((self.aivar[AIV_MM_REAL_ID]	==	ID_SwampGolem)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wurzelzwerg)))
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_FireGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_StoneGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_Golem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_IceGolem)
		{
			self.protection[PROT_Fire] = -1;
		};

		if (self.aivar[AIV_MM_REAL_ID]	==	ID_IceGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_StoneGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_WISP)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_GEISTERKRIEGER)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_Golem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_IceGolem)
		{
			self.protection[PROT_Edge] = -1;
		};

		if (self.aivar[AIV_MM_REAL_ID]	==	ID_FireGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_IceGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_WISP)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_GEISTERKRIEGER)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_IceGolem)
		{
			self.protection[PROT_Blunt] = -1;
		};

		if ((self.aivar[AIV_MM_REAL_ID]	==	ID_SwampGolem)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wurzelzwerg)))
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_StoneGolem)
		|| (self.aivar[AIV_MM_REAL_ID]	==	ID_Summoned_Golem)
		{
			self.protection[PROT_Magic] = -1;
		};
	};

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
};