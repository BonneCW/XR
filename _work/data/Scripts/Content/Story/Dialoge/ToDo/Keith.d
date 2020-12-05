INSTANCE Info_Mod_Keith_Hi (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_Hi_Condition;
	information	= Info_Mod_Keith_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Keith_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_Hi))
	&& (Npc_IsDead(Mod_7570_OUT_Bandit_EIS))
	&& (Npc_IsDead(Mod_7571_OUT_Bandit_EIS))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keith_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_00"); //Prosze nie zabijaj mnie. Jestem tylko ubogim mysliwym, nie mam ani zlota, ani nic innego wartosciowego.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_01"); //Nie martw sie, nie jestem bandyta, a te dwa przed twoja kabina sa skonczone.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_02"); //Czy....? Znowu mialem szczescie.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_03"); //Kiedy chlopcy próbowali wlamac sie do mojego domu, ledwo udalo mi sie zamknac drzwi, ale kto wie, jak dlugo by ich zatrzymali.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_04"); //W kazdym razie dziekuje. Nie mam zbyt wiele, ale te skóre uwazam za nagrode.

	B_GiveInvItems	(self, hero, ItAt_ShadowFur, 2);

	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_05"); //Twój przyjaciel Randi nie mial tyle szczescia. Bili go na smierc przed wasza kabina.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_06"); //Ci bogini bandyci zagniezdzaja sie w naszym kraju. Zyczylabym sobie, aby stara wieza zakopala ja pod nia sama.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_07"); //Stara wieza? Czy nie znalazlbys tej wiezy nad jeziorem?
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_08"); //Tak, tak. Skad wiesz o wiezy?
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_09"); //Slyszalem od mysliwego Luisa Luisa, ze Randi chce wykorzystac te wieze jako nocny obóz do polowan i chcial odwiedzic Was.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_10"); //Co za ironia losu. Gdybym sie do mnie dotarl, móglbym mu powiedziec o bandytach.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_11"); //Ale co z Toba? Co robisz z ta wieza?
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_12"); //Wlasciwie chcialem pomóc Randi i wam wykorzystac wieze, a gdybysmy mogli wyprowadzic z niej bandytów, to bilibysmy dwie muchy z plotka.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_13"); //Jesli pomóglbys nam w rozwiazaniu problemu z bandytami, zapewne wszyscy bylibyscie wdzieczni.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_14"); //Nie mówiac juz o tym, ze znów mozna bylo korzystac z wiezy.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_15"); //Gdybyscie pokazali mi, gdzie znajduje sie stara wieza, móglbym uzyskac obraz sytuacji.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_16"); //Dobrze, pokaze ci droge. Nie bede jednak mógl cie wspierac w walce. Staje sie stary i nie chce umrzec wczesniej niz musze.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_17"); //Zabierz mnie na wieze, reszte zajme sie reszta!
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_18"); //Wszystko dobrze, idzcie dalej!

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Randi zostal pobity na smierc przez bandytów. Wedlug Keith' a ich obóz znajduje sie przy starej wiezy Randi. Zaprowadzi mnie tam mnie, wtedy ja moge sie nia zajac.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "EISSEE");
};

INSTANCE Info_Mod_Keith_AtEissee (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_AtEissee_Condition;
	information	= Info_Mod_Keith_AtEissee_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Keith_AtEissee_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Keith_Hi))
	&& (Npc_GetDistToWP(self, "EIS_358") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keith_AtEissee_Info()
{
	AI_Output(self, hero, "Info_Mod_Keith_AtEissee_08_00"); //Wszyscy slusznie, jestesmy tutaj. Zakladam, ze przywódca tego gangu jest w wiezy.
	AI_Output(self, hero, "Info_Mod_Keith_AtEissee_08_01"); //Kilka lat temu, kiedy wieza zostala opuszczona, znalazlem klucz.
	AI_Output(self, hero, "Info_Mod_Keith_AtEissee_08_02"); //Jesli wieza jest zablokowana, jestem pewien, ze mozesz sie do niej dostac. Zycze powodzenia, synu!

	B_GiveInvItems	(self, hero, ItKe_Eisturm01, 1);

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Keith zabral mnie do starej wiezy i dal mi klucz do niej. Zobaczmy, co mnie tam czeka.....");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Keith_Dalma (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_Dalma_Condition;
	information	= Info_Mod_Keith_Dalma_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bandyci zostaja wygnani.";
};

FUNC INT Info_Mod_Keith_Dalma_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vigonza_Dalma))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keith_Dalma_Info()
{
	AI_Output(hero, self, "Info_Mod_Keith_Dalma_15_00"); //Bandyci zostaja wygnani.
	AI_Output(self, hero, "Info_Mod_Keith_Dalma_08_01"); //Bardzo ladnie, tutaj masz 100 zlotych monet jako nagrode.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Keith_Dalma_08_02"); //Powinienes takze wrócic do Luisa i opowiedziec mu o smierci Randa. Prawdopodobnie bedzie zainteresowany wiedza, ze wieza jest teraz bezpieczna.

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Wieza lodowa jest zabezpieczona. Teraz powinienem wrócic do Luisa.");

	B_SetTopicStatus	(TOPIC_MOD_EIS_ALTERTURM, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	CurrentNQ += 1;

	B_RemoveNpc	(Mod_7572_OUT_Vigonza_EIS);

	B_StartOtherRoutine	(Mod_7566_OUT_Pilar_EIS, "FRIEDHOF");
};

INSTANCE Info_Mod_Keith_EXIT (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_EXIT_Condition;
	information	= Info_Mod_Keith_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Keith_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Keith_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
