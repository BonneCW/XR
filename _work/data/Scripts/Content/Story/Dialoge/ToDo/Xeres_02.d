INSTANCE Info_Mod_Xeres_XW_Hi (C_INFO)
{
	npc		= Xeres_02;
	nr		= 1;
	condition	= Info_Mod_Xeres_XW_Hi_Condition;
	information	= Info_Mod_Xeres_XW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xeres_XW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Xeres_XW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_00"); //Wie ich sehe, hast du nicht nur den Weg in mein bescheidenes Reich gefunden, sondern diesmal sogar deine Freunde mitgebracht.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_01"); //Hier sollt ihr also sterben und zu meinen Dienern werden.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_02"); //Du hast es auch geschafft die Macht der Götter zu verbinden, doch das wird dir gegen mich nichts nützen.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_03"); //Ich werde mich nicht zwei Mal durch dieses Schwert verbannen lassen.
	AI_Output(hero, self, "Info_Mod_Xeres_XW_Hi_15_04"); //(höhnt) Wie konnte es überhaupt ein Mal dazu kommen, wenn du so mächtig bist?
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_05"); //Plaudern wir also ein wenig, solange sich deine Kumpane dort oben abrackern.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_06"); //Alles begann vor vielen Jahren in Jharkendar. Dort wurde ich geboren. Man kann sagen, zu dieser Zeit herrschte eine Hochkultur.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_07"); //Es gab nur einen Gott, nicht drei, so wie jetzt. Er wurde Radanos genannt und vereinigte die drei jetzigen Götter in sich.
	AI_Output(hero, self, "Info_Mod_Xeres_XW_Hi_15_08"); //Das weiß ich alles schon.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_09"); //(genüsslich) Wieso plötzlich so hektisch?
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_10"); //Ich wuchs also in Jharkendar auf. Mein Vater war ein einfacher Schmied und meine Mutter eine Kräutersammlerin.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_11"); //Schon in meiner Jugend reifte der Wunsch in mir heran, meinem unbedeutenden Dasein zu entfliehen und Macht zu erringen.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_12"); //Ich experimentierte also viel mit Magie und mit Tränken.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_13"); //Damals gab es noch ganz andere Möglichkeiten als heute, Magie zu wirken.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_14"); //Die Anwendung neuer, stärkerer Zaubersprüche ist heute verpönt. Früher waren dem Forschergeist keine Grenzen gesetzt.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_15"); //So kam es, dass ich nach fünf Jahren eine Möglichkeit gefunden hatte, die es mir ermöglichte, unsterblich zu werden. Dazu musste ich mich jedoch teilen.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_16"); //Das größte Problem war, meine Teile beziehungsweise Machtträger zu schützen.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_17"); //Der erste war schwächlich, doch durch sein Aussehen konnte er unter den Menschen untertauchen und war so sicher davor, getötet zu werden.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_18"); //Ein Machtträger war natürlich zu wenig. Ich erschuf einen zweiten. Einen Drachen, zurückgeholt von den Toten. Er war sehr mächtig. Mein Meisterstück, sozusagen. Und du hast ihn vernichtet.
	AI_Output(hero, self, "Info_Mod_Xeres_XW_Hi_15_19"); //Woher weißt du das?
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_20"); //Der Drache war eines Teil meines Selbst. Nach seinem Tod ist seine Energie wieder auf mich übergegangen.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_21"); //Ich habe die Tode von dreien meiner Machtträger gespürt. Der Drache, der Gestaltwandler, und Urnol. Der Schläfer ist verbannt.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_22"); //Du hast mir also beinahe meine Unsterblichkeit genommen, mir aber dafür mehr Stärke verliehen.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_Hi_14_23"); //Ich kann mit einem Fingerschnippen töten, wen ich will.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Xeres_XW_LesterTot (C_INFO)
{
	npc		= Xeres_02;
	nr		= 1;
	condition	= Info_Mod_Xeres_XW_LesterTot_Condition;
	information	= Info_Mod_Xeres_XW_LesterTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xeres_XW_LesterTot_Condition()
{
	if (Mod_XW_Kap6 == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xeres_XW_LesterTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_00"); //(seelenruhig) Du siehst, ich mache keine Witze.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_01"); //Ich hatte also meine Unsterblichkeit und nahezu unendliche Macht erlangt.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_02"); //Weil sie sich mir nicht unterwerfen wollten, tötete ich die meisten Bewohner Jharkendars und suchte mir Diener.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_03"); //Als Untote waren die Menschen meines Volkes recht nützlich. Doch schon nach kurzer Zeit tauchte ein Fremder auf.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_04"); //Ich vermute, er war ein Gesandter Radanos'. Er trug Uriziel, die vermaledeite Götterklinge.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_05"); //Durch dieses Schwert gelang es ihm, mich schwer zu verwunden, und Radanos schaffte es, mich hier einsperren.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_06"); //Doch dank meiner Machtträger konnte ich nicht sterben. Ich versuchte lange Zeit zu entkommen.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_07"); //Ich erschuf einen weiteren Machtträger. Du kennst ihn. Du warst es, der ihn vernichtet hat. Dank dir ist er in Beliars Reich.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_08"); //Er war lange Zeit mein Haustier. Dann sandte ich ihn ins Minental aus, wo er durch Zufall dazu beitrug, die Barriere zu vergrößern. Mein Kontakt zu ihm brach ab.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_09"); //Doch dann kamst du. Den Teil der Geschichte kennst du ja. Du hattest den Schläfer auf dem Gewissen, meinen treuen Freund. Ich wollte Vergeltung.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_10"); //Urnol sollte dich nun auf meine Fährte bringen und das zu Ende bringen, was ich dem Schläfer nicht auftragen konnte. Und der Plan hat funktioniert.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_11"); //Die Neugier der Wassermagier hat sie dazu gebracht, den Zauber, der über mir lag, zu brechen und mich zu befreien.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_12"); //Und nun stehen wir uns gegenüber: der neue Auserwählte der Götter und ich, der mächtige und vor allem unsterbliche Xeres.
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LesterTot_14_13"); //Aber jetzt genug der Worte, kommen wir zur Sache. Dir wird es wie deinem Freund ergehen!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Xeres_XW_LetzteRunde (C_INFO)
{
	npc		= Xeres_02;
	nr		= 1;
	condition	= Info_Mod_Xeres_XW_LetzteRunde_Condition;
	information	= Info_Mod_Xeres_XW_LetzteRunde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xeres_XW_LetzteRunde_Condition()
{
	if (Mod_XW_Kap6 == 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xeres_XW_LetzteRunde_Info()
{
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LetzteRunde_14_00"); //(stark schnaufend) Gut gekämpft. Ich bin gewillt, über ein Unentschieden zu verhandeln.
	AI_Output(hero, self, "Info_Mod_Xeres_XW_LetzteRunde_15_01"); //Am Ende der Kräfte angelangt?
	AI_Output(self, hero, "Info_Mod_Xeres_XW_LetzteRunde_14_02"); //(schnaufend) Nie ... Niemals!

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);

	self.fight_tactic = FAI_HUMAN_COWARD;
};