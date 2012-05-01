INSTANCE Info_Mod_Mud_ShutUp (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_ShutUp_Condition;
	information	= Info_Mod_Mud_ShutUp_Info;
	permanent	= 1;
	description	= "Kannst du mal BITTE einen Moment die Klappe halten?";
};                       

FUNC INT Info_Mod_Mud_ShutUp_Condition()
{
	if (Mud_NerveRealized == TRUE)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_ShutUp_Info()
{
	AI_Output (hero, self,"Info_Mod_Mud_ShutUp_15_00"); //Kannst du mal BITTE einen Moment die Klappe halten?
	AI_Output (self, hero,"Info_Mod_Mud_ShutUp_03_01"); //Klar.
	Npc_SetRefuseTalk(self, 300);
};

INSTANCE Info_Mod_Mud_GetLost (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_GetLost_Condition;
	information	= Info_Mod_Mud_GetLost_Info;
	permanent	= 1;
	description	= "Verpiss dich!";
};                       

FUNC INT Info_Mod_Mud_GetLost_Condition()
{
	if ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_GetLost_Info()
{
	AI_Output (hero, self,"Info_Mod_Mud_GetLost_15_00"); //Verpiss dich!
	AI_Output (self, hero,"Info_Mod_Mud_GetLost_03_01"); //Willst 'nen Moment allein sein, hm? Kann ich verstehen ... Ich halt mich im Hintergrund ...
};

INSTANCE Info_Mod_Mud_Defeated (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Defeated_Condition;
	information	= Info_Mod_Mud_Defeated_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Defeated_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Defeated_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_GetLost_03_00"); //Hey, Mann, du hast mich geschlagen! Was sollte das?
	AI_Output (hero, self,"Info_Mod_Mud_GetLost_15_01"); //Ich schlag' dich gleich noch mal! Ich steh' auf Schlagen!
	AI_Output (self, hero,"Info_Mod_Mud_GetLost_03_02"); //Mann, was bist DU denn für'n Freak! Mit dir will ich nichts mehr zu tun haben!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
};

INSTANCE Info_Mod_Mud_Nerve_0 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve_0_Condition;
	information	= Info_Mod_Mud_Nerve_0_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve_0_Condition()
{
	if ((Mud_Nerve==0)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve_0_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve_0_03_00"); //Ach, schön mit dir wieder umherzuziehen. Wir werden sicher wieder so gute Freunde wie früher.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 1;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve_1 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve_1_Condition;
	information	= Info_Mod_Mud_Nerve_1_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve_1_Condition()
{
	if ((Mud_Nerve==1)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve_1_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve_1_03_00"); //Na, findest du es nicht anstrengend, die ganze Zeit rumzulaufen? Willst du dich etwas hinlegen? In meiner Hütte hätte ich noch Platz.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 2;
	Mud_NerveRealized = TRUE;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve_2 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve_2_Condition;
	information	= Info_Mod_Mud_Nerve_2_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve_2_Condition()
{
	if ((Mud_Nerve==2)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve_2_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve_2_03_00"); //Seit diese Kuppel nicht mehr da ist, dürfen wir Buddler das Lager nicht mehr verlassen. Aber jetzt, wo du wieder hier bist, wird es mir ja nicht langweilig.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 3;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve_3 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve_3_Condition;
	information	= Info_Mod_Mud_Nerve_3_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve_3_Condition()
{
	if ((Mud_Nerve==3)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve_3_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve_3_03_00"); //Findest du es nicht auch etwas gefährlich, dass diese Leute aus den anderen Lagern in der Arena kämpfen? Aber ich habe keine Angst, du bist ja bei mir.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 4;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve_4 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve_4_Condition;
	information	= Info_Mod_Mud_Nerve_4_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve_4_Condition()
{
	if ((Mud_Nerve==4)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve_4_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve_4_03_00"); //Jetzt, wo wieder mehr Leute in das Lager kommen, wollen sie sich immer noch nicht mit mir unterhalten. Aber macht ja nichts, du genügst mir als Freund.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 5;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve_5 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve_5_Condition;
	information	= Info_Mod_Mud_Nerve_5_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve_5_Condition()
{
	if ((Mud_Nerve==5)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve_5_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve_5_03_00"); //Weißt du was? Ich bin wirklich froh, mal wieder mit dir etwas zu unternehmen. Was willst du tun? Kennst du eine Schafherde in der Nähe, die sind so süß.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 6;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve_6 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve_6_Condition;
	information	= Info_Mod_Mud_Nerve_6_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve_6_Condition()
{
	if ((Mud_Nerve==6)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mud_OrksHunted)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve_6_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve_6_03_00"); //Sag mal, hast du eigentlich irgendwas außerhalb des Lagers vor? Das mögen die Gardisten nicht so gerne. Aber wenn ich bei dir bin passt das schon.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 0;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_FirstEXIT (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_FirstEXIT_Condition;
	information	= Info_Mod_Mud_FirstEXIT_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_FirstEXIT_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (Npc_GetDistToWp(self, "OCR_OUTSIDE_HUT_13") < 500)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustAmulett))
	|| (Npc_KnowsInfo(hero, Info_Mod_Dexter_Amulett2Gefunden)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_FirstEXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Mud_FirstEXIT_03_00"); //Hallo, schön dich wieder zu sehen. Seit dem die Barriere gefallen ist, bekam ich öfter Besuch, aber die wollten sich alle nicht mit mir abgeben.
	AI_Output(self, hero, "Info_Mod_Mud_FirstEXIT_03_01"); //Aber jetzt bist du ja wieder da, das wird schön mit uns, wie früher.

	Info_ClearChoices(Info_Mod_Mud_FirstEXIT);
	Info_AddChoice	 (Info_Mod_Mud_FirstEXIT, "Verpiss dich!"			,Info_Mod_Mud_FirstEXIT_Verpiss);
	Info_AddChoice	 (Info_Mod_Mud_FirstEXIT, "Warum nicht - komm mit!"	,Info_Mod_Mud_FirstEXIT_Komm);
};

func void Info_Mod_Mud_FirstEXIT_Verpiss()
{
	AI_Output (hero, self, "Info_Mod_Mud_FirstEXIT_Verpiss_15_00"); //Verpiss dich!
	AI_Output (self, hero, "Info_Mod_Mud_FirstEXIT_Verpiss_03_01"); //Bist heute nicht so gut drauf, was? Ich glaub', ich komm' mal besser mit ...

	Info_ClearChoices(Info_Mod_Mud_FirstEXIT);

	AI_StopProcessInfos	( self );

	Npc_ExchangeRoutine (self,"FOLLOW");
};

func void Info_Mod_Mud_FirstEXIT_Komm()
{
	AI_Output (hero, self, "Info_Mod_Mud_FirstEXIT_Komm_15_00"); //Warum nicht - komm mit!
	AI_Output (self, hero, "Info_Mod_Mud_FirstEXIT_Komm_03_01"); //Großartig! Wir können uns ja auf dem Weg etwas unterhalten.

	Info_ClearChoices(Info_Mod_Mud_FirstEXIT);

	AI_StopProcessInfos	( self );

	Npc_ExchangeRoutine (self,"FOLLOW");
};

INSTANCE Info_Mod_Mud_OrkJagd (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_OrkJagd_Condition;
	information	= Info_Mod_Mud_OrkJagd_Info;
	permanent	= 0;
	important 	= 0;
	description	= "Hallo Mud, wollen wir etwas zusammen unternehmen.";
};                       

FUNC INT Info_Mod_Mud_OrkJagd_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustAmulett))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dexter_Amulett2Gefunden))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_OrkJagd_Info()
{
	AI_Output(hero, self, "Info_Mod_Mud_OrkJagd_15_00"); //Hallo Mud, wollen wir etwas zusammen unternehmen.
	AI_Output(self, hero, "Info_Mod_Mud_OrkJagd_03_01"); //Au ja, du bist doch mein Freund und Freunde machen doch alles zusammen. Was wollen wir machen?

	Info_ClearChoices(Info_Mod_Mud_OrkJagd);
	Info_AddChoice	 (Info_Mod_Mud_OrkJagd, "Wir könnten zusammen einen Spaziergang in den Wald machen."			,Info_Mod_Mud_OrkJagd_Verpiss);
	Info_AddChoice	 (Info_Mod_Mud_OrkJagd, "Halt die Klappe und komm mit."	,Info_Mod_Mud_OrkJagd_Komm);
};

func void Info_Mod_Mud_OrkJagd_Verpiss()
{
	AI_Output (hero, self, "Info_Mod_Mud_OrkJagd_Verpiss_15_00"); //Wir könnten zusammen einen Spaziergang in den Wald machen. Da gibt es eine nette Höhle.
	AI_Output (self, hero, "Info_Mod_Mud_OrkJagd_Verpiss_03_01"); //Au ja, das wird bestimmt lustig, da können wir uns unterwegs noch über tolle Dinge unterhalten und näher kennen lernen.
	AI_Output (self, hero, "Info_Mod_Mud_OrkJagd_Verpiss_03_02"); //Obwohl ich etwas Angst im Wald habe, aber du bist ja bei mir.

	Info_ClearChoices(Info_Mod_Mud_OrkJagd);

	AI_StopProcessInfos	( self );

	Npc_ExchangeRoutine (self,"FOLLOW");
};

func void Info_Mod_Mud_OrkJagd_Komm()
{
	AI_Output (hero, self, "Info_Mod_Mud_OrkJagd_Komm_15_00"); //Halt die Klappe und komm mit.
	AI_Output (self, hero, "Info_Mod_Mud_OrkJagd_Komm_03_01"); //Ok, wie du meinst, das wird bestimmt toll.

	Info_ClearChoices(Info_Mod_Mud_OrkJagd);

	AI_StopProcessInfos	( self );

	Npc_ExchangeRoutine (self,"FOLLOW");

	Mud_Nerve2 = 0;
};

INSTANCE Info_Mod_Mud_Lagermusik (C_INFO)
{
	npc		= Mod_803_STT_Mud_MT;
	nr 		= 1;
	condition	= Info_Mod_Mud_Lagermusik_Condition;
	information	= Info_Mod_Mud_Lagermusik_Info;
	permanent	= 0;
	important 	= 0;
	description	= "Du hast nicht zufällig Lust, berühmt zu werden?";
};                       

FUNC INT Info_Mod_Mud_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Mud_Lagermusik_15_00"); //Du hast nicht zufällig Lust, berühmt zu werden?
	AI_Output(self, hero, "Info_Mod_Mud_Lagermusik_03_01"); //Kommt drauf an, was ich dafür tun muss. Dich würde ich dafür natürlich nicht verlassen.
	AI_Output(hero, self, "Info_Mod_Mud_Lagermusik_15_02"); //Du müsstest ein Instrument spielen. Gravo will eine Gruppe ins Leben rufen.
	AI_Output(self, hero, "Info_Mod_Mud_Lagermusik_03_03"); //Die Trommel hat mir schon immer gefallen. Solange ich den Schlägel in der Hand hatte, wurden mir nicht so viele böse Dinge zugerufen.
	AI_Output(hero, self, "Info_Mod_Mud_Lagermusik_15_04"); //Perfekt! Geh am besten gleich zu Gravo.
	AI_Output(self, hero, "Info_Mod_Mud_Lagermusik_03_05"); //Ich lasse dich ungern im Stich, aber ich muss meiner Karriere eine Chance geben. Man sieht sich bestimmt bald wieder!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATGRAVO");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Mud_Nerve2_0 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve2_0_Condition;
	information	= Info_Mod_Mud_Nerve2_0_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve2_0_Condition()
{
	if ((Mud_Nerve2==0)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve2_0_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve2_0_03_00"); //Sollen wir uns an ein flauschiges Plätzchen setzen und uns miteinander unterhalten und so? ...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve2 = 1;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve2_1 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve2_1_Condition;
	information	= Info_Mod_Mud_Nerve2_1_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve2_1_Condition()
{
	if ((Mud_Nerve2==1)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve2_1_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve2_1_03_00"); //... oder wir könnten Blumen auf einer Wiese pflücken. Ich mag Blumen so, die duften so schön und da gibt’s auch hoppelnde Kaninchen, die haben so ein flauschiges Fell ...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve2 = 2;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve2_2 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve2_2_Condition;
	information	= Info_Mod_Mud_Nerve2_2_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve2_2_Condition()
{
	if ((Mud_Nerve2==2)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve2_2_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve2_2_03_00"); //... oder wir könnten zusammen im Wasser plantschen, das mag ich auch voll und das macht so Spaß ...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve2 = 3;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve2_3 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve2_3_Condition;
	information	= Info_Mod_Mud_Nerve2_3_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve2_3_Condition()
{
	if ((Mud_Nerve2==3)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve2_3_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve2_3_03_00"); //... wir könnten auch zwischen die Büsche gehen und verstecken spielen, oder andere lustige Dinge machen. Au ja, das wird bestimmt toll und das Laub kitzelt immer so schön ...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve2 = 4;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve2_4 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve2_4_Condition;
	information	= Info_Mod_Mud_Nerve2_4_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve2_4_Condition()
{
	if ((Mud_Nerve2==4)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve2_4_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve2_4_03_00"); //... weißt du, du bist mein bester Freund, ich hab dich richtig gern. Ich habe das Gefühl das du mich auch voll magst ...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve2 = 5;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve2_5 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve2_5_Condition;
	information	= Info_Mod_Mud_Nerve2_5_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve2_5_Condition()
{
	if ((Mud_Nerve2 == 5)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve2_5_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve2_5_03_00"); //... in meiner Hütte ist immer noch ein Plätzchen für dich frei. Da wären wir die ganze Zeit zusammen und könnten reden und andere tolle Dinge machen ...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve2 = 6;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_Nerve2_6 (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_Nerve2_6_Condition;
	information	= Info_Mod_Mud_Nerve2_6_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_Nerve2_6_Condition()
{
	if ((Mud_Nerve2 == 6)
	&& (Npc_RefuseTalk(self)==FALSE)
	&& (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FALSE ))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_Nerve2_6_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_Nerve2_6_03_00"); //... oder wir könnten uns auch draußen vergnügen. Im Lager mag mich nämlich fast keiner ...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve2 = 0;
	AI_StopProcessInfos	( self );
};

INSTANCE Info_Mod_Mud_OrkHoehle (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_OrkHoehle_Condition;
	information	= Info_Mod_Mud_OrkHoehle_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_OrkHoehle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkJagd))
	&& (Npc_GetDistToWP(hero, "WP_ORKBEIAMULETT") < 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_OrkHoehle_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_OrkHoehle_03_00"); //Jetzt sind wir so lange zusammen herumgelaufen und haben uns toll miteinander unterhalten.
	AI_Output (self, hero,"Info_Mod_Mud_OrkHoehle_03_01"); //Wir sind jetzt allein im dunklen Wald. Was wollen wir als nächstes machen?
	AI_Output (hero, self,"Info_Mod_Mud_OrkHoehle_15_02"); //Öhh, geh mal in die Höhle dort.
	AI_Output (self, hero,"Info_Mod_Mud_OrkHoehle_03_03"); //Ja, was gibt’s da? Eine Überraschung? Ich mag Überraschungen ...

	Info_ClearChoices	(Info_Mod_Mud_OrkHoehle);

	Info_AddChoice	(Info_Mod_Mud_OrkHoehle, "Dort lauert eine Horde blutrünstiger Orks, die dich hoffentlich in Stücke reißen.", Info_Mod_Mud_OrkHoehle_C);
	Info_AddChoice	(Info_Mod_Mud_OrkHoehle, "Wenn ich es verraten würde, dann wäre es ja keine Überraschung mehr.", Info_Mod_Mud_OrkHoehle_B);
	Info_AddChoice	(Info_Mod_Mud_OrkHoehle, "Dort gibt es schöne Blumen, die kannst du für mich pflücken.", Info_Mod_Mud_OrkHoehle_A);
};

FUNC VOID Info_Mod_Mud_OrkHoehle_D()
{
	AI_Output(self, hero, "Info_Mod_Mud_OrkHoehle_D_03_00"); //Ohh, toll, da gehe ich gleich hinein.

	Info_ClearChoices	(Info_Mod_Mud_OrkHoehle);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ORKHOEHLE");
};

FUNC VOID Info_Mod_Mud_OrkHoehle_C()
{
	AI_Output(hero, self, "Info_Mod_Mud_OrkHoehle_C_15_00"); //Dort lauert eine ... ähh, Herde niedlicher Schafe.

	Info_Mod_Mud_OrkHoehle_D();
};

FUNC VOID Info_Mod_Mud_OrkHoehle_B()
{
	AI_Output(hero, self, "Info_Mod_Mud_OrkHoehle_B_15_00"); //Wenn ich es verraten würde, dann wäre es ja keine Überraschung mehr.

	Info_Mod_Mud_OrkHoehle_D();
};

FUNC VOID Info_Mod_Mud_OrkHoehle_A()
{
	AI_Output(hero, self, "Info_Mod_Mud_OrkHoehle_A_15_00"); //Dort gibt es schöne Blumen, die kannst du für mich pflücken.

	Info_Mod_Mud_OrkHoehle_D();
};

INSTANCE Info_Mod_Mud_OrksHunted (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_OrksHunted_Condition;
	information	= Info_Mod_Mud_OrksHunted_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_OrksHunted_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mud_OrkHoehle))
	&& (Npc_GetDistToWP(hero, "OCR_HUT_13") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_OrksHunted_Info()
{
	AI_Output (self, hero,"Info_Mod_Mud_OrksHunted_03_00"); //Hallo, das wirst du mir nicht glauben. Da waren plötzlich ganz viele böse, gemeine Orks.
	AI_Output (self, hero,"Info_Mod_Mud_OrksHunted_03_01"); //Leider konnte ich deshalb nicht in die Höhle gehen. Aber wir können ja noch andere tolle Dinge unternehmen.

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Mud_VMG (C_INFO)
{
	npc		= Mod_803_STT_Mud_MT;
	nr 		= 1;
	condition	= Info_Mod_Mud_VMG_Condition;
	information	= Info_Mod_Mud_VMG_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Mod_Mud_VMG_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Aufnahmequest))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mud_VMG_Info()
{
	AI_Output(self, hero, "Info_Mod_Mud_VMG_03_00"); //Hey du, ich kenne dich doch. Du hast mich vor den fiesen Typen im Neuen Lager beschützt und uns alle gerettet.
	AI_Output(self, hero, "Info_Mod_Mud_VMG_03_01"); //Ich wusste genau, dass ...

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja? Erzähl weiter.", Info_Mod_Mud_VMG_A);
};

func void Info_Mod_Mud_VMG_C()
{
	AI_Output (self, hero, "Info_Mod_Mud_VMG_C_03_00"); //... dass du es schaffst. Du musst wissen, die Anderen haben mich immer herumgeschubst, aber als ich ihnen gesagt habe, dass du auf mich aufpasst, da haben sie ganz schnell die Klappen gehalten.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_C_03_01"); //Sie ...
};

func void Info_Mod_Mud_VMG_F()
{
	AI_Output (self, hero, "Info_Mod_Mud_VMG_F_03_00"); //Sie fürchten sich vor dir, glaube ich. Aber ich wollte nicht mehr abhängig sein, deshalb habe ich beschlossen, Magier zu werden. Ist doch klug, oder?
};

func void Info_Mod_Mud_VMG_I()
{
	AI_Output (self, hero, "Info_Mod_Mud_VMG_I_03_00"); //Und so stehe ich jetzt hier vor dir. Du kannst doch sicherlich ein gutes Wort für mich einlegen, oder?
	AI_Output (self, hero, "Info_Mod_Mud_VMG_I_03_01"); //Es wäre nämlich super, wenn wir hier zusammen als Magier die Gegend unsicher machen, oder etwa nicht?
};

func void Info_Mod_Mud_VMG_B()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_B_15_00"); //Halt mal die Luft an.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_B_03_01"); //Ich wusste es. Keiner mag mich.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Das stimmt doch gar nicht.", Info_Mod_Mud_VMG_M);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Stimmt genau.", Info_Mod_Mud_VMG_L);
};

func void Info_Mod_Mud_VMG_B2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_B_15_00"); //Halt mal die Luft an.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_B_03_01"); //Ich wusste es. Keiner mag mich.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Das stimmt doch gar nicht.", Info_Mod_Mud_VMG_M2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Stimmt genau.", Info_Mod_Mud_VMG_L2);
};

func void Info_Mod_Mud_VMG_B3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_B_15_00"); //Halt mal die Luft an.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_B_03_01"); //Ich wusste es. Keiner mag mich.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Das stimmt doch gar nicht.", Info_Mod_Mud_VMG_M3);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Stimmt genau.", Info_Mod_Mud_VMG_L3);
};

func void Info_Mod_Mud_VMG_M()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_M_15_00"); //Das stimmt doch gar nicht.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_C();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja?", Info_Mod_Mud_VMG_E);
};

func void Info_Mod_Mud_VMG_L()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_L_15_00"); //Stimmt genau.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_L_03_01"); //Magst du mich etwa nicht mehr?

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Doch, doch.", Info_Mod_Mud_VMG_O);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ich mochte dich noch nie.", Info_Mod_Mud_VMG_N);
};

func void Info_Mod_Mud_VMG_M2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_M_15_00"); //Das stimmt doch gar nicht.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_F();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Hätte ich genauso gemacht.", Info_Mod_Mud_VMG_G);
};

func void Info_Mod_Mud_VMG_L2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_L_15_00"); //Stimmt genau.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_L_03_01"); //Magst du mich etwa nicht mehr?

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Doch, doch.", Info_Mod_Mud_VMG_O2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ich mochte dich noch nie.", Info_Mod_Mud_VMG_N2);
};

func void Info_Mod_Mud_VMG_M3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_M_15_00"); //Das stimmt doch gar nicht.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_I();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B3);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja, das wäre super.", Info_Mod_Mud_VMG_J);
};

func void Info_Mod_Mud_VMG_L3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_L_15_00"); //Stimmt genau.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_L_03_01"); //Magst du mich etwa nicht mehr?

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Doch, doch.", Info_Mod_Mud_VMG_O);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ich mochte dich noch nie.", Info_Mod_Mud_VMG_N);
};

func void Info_Mod_Mud_VMG_N()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_N_15_00"); //Ich mochte dich noch nie.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_N_03_01"); //Boah, das sage ich aber dem ganz Obersten hier. Dem ganz Obersten!

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Okay, beruhige dich.", Info_Mod_Mud_VMG_Q);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Dann sieh mal zu, wie du zu ihm kommst.", Info_Mod_Mud_VMG_P);
};

func void Info_Mod_Mud_VMG_N2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_N_15_00"); //Ich mochte dich noch nie.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_N_03_01"); //Boah, das sage ich aber dem ganz Obersten hier. Dem ganz Obersten!

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Okay, beruhige dich.", Info_Mod_Mud_VMG_Q);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Dann sieh mal zu, wie du zu ihm kommst.", Info_Mod_Mud_VMG_P);
};

func void Info_Mod_Mud_VMG_N3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_N_15_00"); //Ich mochte dich noch nie.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_N_03_01"); //Boah, das sage ich aber dem ganz Obersten hier. Dem ganz Obersten!

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Okay, beruhige dich.", Info_Mod_Mud_VMG_Q);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Dann sieh mal zu, wie du zu ihm kommst.", Info_Mod_Mud_VMG_P);
};

func void Info_Mod_Mud_VMG_Q()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Q_15_00"); //Okay, beruhige dich.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_C();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja?", Info_Mod_Mud_VMG_E);
};

func void Info_Mod_Mud_VMG_O()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_O_15_00"); //Doch, doch.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_C();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja?", Info_Mod_Mud_VMG_E);
};

func void Info_Mod_Mud_VMG_P()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_P_15_00"); //Dann sieh mal zu, wie du zu ihm kommst.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_P_03_01"); //Werde ich. (beleidigt) Und ich dachte, du wärst mein Freund.

	Info_ClearChoices(Info_Mod_Mud_VMG);
};

func void Info_Mod_Mud_VMG_Q2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Q_15_00"); //Okay, beruhige dich.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_F();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Hätte ich genauso gemacht.", Info_Mod_Mud_VMG_G);
};

func void Info_Mod_Mud_VMG_O2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_O_15_00"); //Doch, doch.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_F();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Hätte ich genauso gemacht.", Info_Mod_Mud_VMG_G);
};

func void Info_Mod_Mud_VMG_P2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_P_15_00"); //Dann sieh mal zu, wie du zu ihm kommst.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_P_03_01"); //Werde ich. (beleidigt) Und ich dachte, du wärst mein Freund.

	Info_ClearChoices(Info_Mod_Mud_VMG);
};

func void Info_Mod_Mud_VMG_Q3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Q_15_00"); //Okay, beruhige dich.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_I();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B3);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja, das wäre super.", Info_Mod_Mud_VMG_J);
};

func void Info_Mod_Mud_VMG_O3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_O_15_00"); //Doch, doch.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Q_03_01"); //Ich habe mich wohl verhört.

	Info_Mod_Mud_VMG_I();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B3);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja, das wäre super.", Info_Mod_Mud_VMG_J);
};

func void Info_Mod_Mud_VMG_P3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_P_15_00"); //Dann sieh mal zu, wie du zu ihm kommst.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_P_03_01"); //Werde ich. (beleidigt) Und ich dachte, du wärst mein Freund.

	Info_ClearChoices(Info_Mod_Mud_VMG);
};

func void Info_Mod_Mud_VMG_A()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_A_15_00"); //Ja? Erzähl weiter.

	Info_Mod_Mud_VMG_C();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja?", Info_Mod_Mud_VMG_E);
};

func void Info_Mod_Mud_VMG_E()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_E_15_00"); //Ja?

	Info_Mod_Mud_VMG_F();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Hätte ich genauso gemacht.", Info_Mod_Mud_VMG_G);
};

func void Info_Mod_Mud_VMG_G()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_G_15_00"); //Hätte ich genauso gemacht.

	Info_Mod_Mud_VMG_I();

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Halt mal die Luft an.", Info_Mod_Mud_VMG_B3);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Ja, das wäre super.", Info_Mod_Mud_VMG_J);
};

func void Info_Mod_Mud_VMG_J()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_J_15_00"); //Ja, das wäre super.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_J_03_01"); //Also, was machst du hier? Sollst du mir die Aufgaben stellen?
	AI_Output (hero, self, "Info_Mod_Mud_VMG_J_15_02"); //Ja. Bist du bereit?
	AI_Output (self, hero, "Info_Mod_Mud_VMG_J_03_03"); //Okay, schieß los, Kumpel.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Bring mir eine Spruchrolle 'Verwandlung Blutfliege'.", Info_Mod_Mud_VMG_V);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Außerhalb der Barriere hat einer der Magier etwas verloren. Such das bitte.", Info_Mod_Mud_VMG_U);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Bring mir ein paar Scavengerkeulen. Fünf dürften genügen.", Info_Mod_Mud_VMG_T);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Dort hinten in dem Wald haust ein Schattenläufer.", Info_Mod_Mud_VMG_S);
	if (Npc_HasItems(hero, ItSc_TrfSheep) > 0)
	{
		//Info_AddChoice	 (Info_Mod_Mud_VMG, "Nimm diese Spruchrolle und führe den Zauber durch.", Info_Mod_Mud_VMG_R);
	};
};

func void Info_Mod_Mud_VMG_V()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_V_15_00"); //Bring mir eine Spruchrolle 'Verwandlung Blutfliege'.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_V_03_01"); //Das ist ja lustig. Zufällig habe ich ein dabei. Hier.

	B_GiveInvItems	(self, hero, ItSc_TrfBloodfly, 1);

	AI_Output (hero, self, "Info_Mod_Mud_VMG_V_15_02"); //Gut, äh, dann bist du dabei.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_V_03_02"); //Toll, du bist ein echter Freund.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Mod_Mud_Unterwegs = 5;
};

func void Info_Mod_Mud_VMG_U()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_U_15_00"); //Außerhalb der Barriere hat einer der Magier etwas verloren. Such das bitte.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_U_03_01"); //Willst du mich verarschen, Mann? Wie soll ich denn da hinkommen?

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Du willst doch Magier werden, oder nicht?", Info_Mod_Mud_VMG_X2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Du hast Recht. Ich stelle dir eine andere Aufgabe.", Info_Mod_Mud_VMG_W2);
};

func void Info_Mod_Mud_VMG_X2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_X2_15_00"); //Du willst doch Magier werden, oder nicht?
	AI_Output (self, hero, "Info_Mod_Mud_VMG_X2_03_01"); //Okay, ich mach’s. Wo soll ich anfangen?
	AI_Output (hero, self, "Info_Mod_Mud_VMG_X2_15_02"); //Am besten am Austauschplatz.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_X2_03_03"); //Was soll ich eigentlich suchen?

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Mod_Mud_Unterwegs = 4;

	B_StartOtherRoutine	(self, "TRADE");

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Eine Schriftrolle.", Info_Mod_Mud_VMG_Y3);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Einen magischen Ring.", Info_Mod_Mud_VMG_Y2);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Eine magische Robe.", Info_Mod_Mud_VMG_Y1);
};

func void Info_Mod_Mud_VMG_Y3()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Y3_15_00"); //Eine Schriftrolle.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Y3_03_01"); //(zuversichtlich) Ich denke, ich werde sie finde.
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Y_15_02"); //Viel Glück.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	AI_StopProcessInfos	(self);
};

func void Info_Mod_Mud_VMG_Y2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Y2_15_00"); //Einen magischen Ring.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Y2_03_01"); //(niedergeschlagen) Das wird dauern.
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Y_15_02"); //Viel Glück.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	AI_StopProcessInfos	(self);
};

func void Info_Mod_Mud_VMG_Y1()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Y1_15_00"); //Eine magische Robe.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_Y1_03_01"); //(fröhlich) Okay, die wird leicht zu finden sein.
	AI_Output (hero, self, "Info_Mod_Mud_VMG_Y_15_02"); //Viel Glück.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	AI_StopProcessInfos	(self);
};

func void Info_Mod_Mud_VMG_W2()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_W2_15_00"); //Du hast Recht. Ich stelle dir eine andere Aufgabe.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Bring mir eine Spruchrolle „Verwandlung Blutfliege“.", Info_Mod_Mud_VMG_V);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Bring mir ein paar Scavengerkeulen. Fünf dürften genügen.", Info_Mod_Mud_VMG_T);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Dort hinten in dem Wald haust ein Schattenläufer.", Info_Mod_Mud_VMG_S);
};

func void Info_Mod_Mud_VMG_T()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_T_15_00"); //Bring mir ein paar Scavengerkeulen. Fünf dürften genügen.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_T_03_01"); //Okay, das sollte nicht so schwierig sein. Ich seh’ mich mal ein wenig um.
	AI_Output (hero, self, "Info_Mod_Mud_VMG_T_15_02"); //(lacht) Viel Spaß.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_T_03_03"); //Ich mache mich dann auf den Weg. Oh, Die Wache da vorne winkt, gehe besser zu ihr.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_T_03_04"); //Naja, man sieht sich, mein Freund.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	AI_StopProcessInfos	(self);

	Mod_Mud_Unterwegs = 3;

	B_StartOtherRoutine	(self, "SCAV");
};

func void Info_Mod_Mud_VMG_S()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_S_15_00"); //Dort hinten in dem Wald haust ein Schattenläufer. Bring mir sein Fell, dann lass ich dich weiter.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_S_03_01"); //Meinst du das ernsthaft?

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Natürlich, und jetzt mach dich auf den Weg.", Info_Mod_Mud_VMG_X);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Nein, war nur Spaß.", Info_Mod_Mud_VMG_W);
};

func void Info_Mod_Mud_VMG_X()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_X_15_00"); //Natürlich, und jetzt mach dich auf den Weg.
	AI_Output (self, hero, "Info_Mod_Mud_VMG_X_03_01"); //Wenn du das sagst ...

	Info_ClearChoices(Info_Mod_Mud_VMG);

	AI_StopProcessInfos	(self);

	Mod_Mud_Unterwegs = 2;

	B_StartOtherRoutine	(self, "SHADOW");
};

func void Info_Mod_Mud_VMG_W()
{
	AI_Output (hero, self, "Info_Mod_Mud_VMG_W_15_00"); //Nein, war nur Spaß.

	Info_ClearChoices(Info_Mod_Mud_VMG);

	Info_AddChoice	 (Info_Mod_Mud_VMG, "Bring mir eine Spruchrolle „Verwandlung Blutfliege“.", Info_Mod_Mud_VMG_V);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Außerhalb der Barriere hat einer der Magier etwas verloren. Such das bitte.", Info_Mod_Mud_VMG_U);
	Info_AddChoice	 (Info_Mod_Mud_VMG, "Bring mir ein paar Scavengerkeulen. Fünf dürften genügen.", Info_Mod_Mud_VMG_T);
};

INSTANCE Info_Mod_Mud_Pickpocket (C_INFO)
{
	npc		= Mod_803_STT_Mud_MT;
	nr		= 1;
	condition	= Info_Mod_Mud_Pickpocket_Condition;
	information	= Info_Mod_Mud_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Mud_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 1);
};

FUNC VOID Info_Mod_Mud_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mud_Pickpocket);

	Info_AddChoice	(Info_Mod_Mud_Pickpocket, DIALOG_BACK, Info_Mod_Mud_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mud_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mud_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mud_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mud_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mud_EXIT (C_INFO)
{
	npc			= Mod_803_STT_Mud_MT;
	nr 			= 1;
	condition	= Info_Mod_Mud_EXIT_Condition;
	information	= Info_Mod_Mud_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Mod_Mud_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mud_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};