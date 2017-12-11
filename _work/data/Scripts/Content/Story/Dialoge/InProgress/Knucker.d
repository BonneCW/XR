INSTANCE Info_Mod_Knucker_Hi (C_INFO)
{
	npc		= Knucker_11001_NW;
	nr		= 1;
	condition	= Info_Mod_Knucker_Hi_Condition;
	information	= Info_Mod_Knucker_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Knucker_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Knucker_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Knucker_Hi_22_00"); //He, Menschenwicht, was treibst du hier?

	Info_ClearChoices	(Info_Mod_Knucker_Hi);

	Info_AddChoice	(Info_Mod_Knucker_Hi, "Ich bin euer schlimmster Alptraum.", Info_Mod_Knucker_Hi_C);
	Info_AddChoice	(Info_Mod_Knucker_Hi, "Ich wollte Rüben ernten.", Info_Mod_Knucker_Hi_B);
	Info_AddChoice	(Info_Mod_Knucker_Hi, "Ich bin nur zufällig hier.", Info_Mod_Knucker_Hi_A);
};

FUNC VOID Info_Mod_Knucker_Hi_D()
{
	AI_Output(self, hero, "Info_Mod_Knucker_Hi_D_22_00"); //(desinteressiert) Jaja ... Menschenwicht, du kannst was für mich tun. Ich habe einen Pfeil in der Pfote stecken. Den sollst du mir herausziehen.

	Info_ClearChoices	(Info_Mod_Knucker_Hi);

	Info_AddChoice	(Info_Mod_Knucker_Hi, "Ne, du kannst mich mal.", Info_Mod_Knucker_Hi_F);
	Info_AddChoice	(Info_Mod_Knucker_Hi, "Klar, ich helfe gerne.", Info_Mod_Knucker_Hi_E);
};

FUNC VOID Info_Mod_Knucker_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Knucker_Hi_C_15_00"); //Ich bin euer schlimmster Alptraum.

	Info_Mod_Knucker_Hi_D();
};

FUNC VOID Info_Mod_Knucker_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Knucker_Hi_B_15_00"); //Ich wollte Rüben ernten.

	Info_Mod_Knucker_Hi_D();
};

FUNC VOID Info_Mod_Knucker_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Knucker_Hi_A_15_00"); //Ich bin nur zufällig hier.

	Info_Mod_Knucker_Hi_D();
};

FUNC VOID Info_Mod_Knucker_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Knucker_Hi_F_15_00"); //Nee, du kannst mich mal.
	AI_Output(self, hero, "Info_Mod_Knucker_Hi_F_22_01"); //(faucht) Dann werde ich dich eben rösten und verspeisen.

	Info_ClearChoices	(Info_Mod_Knucker_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
	B_Attack	(Feuerdrache_11002_NW, hero, AR_GuildEnemy, 0);
};

FUNC VOID Info_Mod_Knucker_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Knucker_Hi_E_15_00"); //Klar, ich helfe gerne.

	AI_PlayAni	(hero, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Knucker_Hi_E_22_01"); //Ahh, gleich viel besser. Das hast du gut gemacht, Menschenwicht. Du kannst jetzt gehen.

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Knucker_Hi);

	AI_StopProcessInfos	(self);
};