var int Mod_Smalltalk_Fremdgang;

FUNC VOID B_Say_Smalltalk_Fremdgang ()
{
	if (Mod_Smalltalk_Fremdgang == 0)
	{
		AI_Output(Mod_7343_OUT_Buergerin_REL, NULL, "Info_Mod_Smalltalk_Fremdgang_16_00"); //Liebster, ich hab jedesmal Angst, man könnte uns hier erwischen.

		Mod_Smalltalk_Fremdgang = 1;
	}
	else if (Mod_Smalltalk_Fremdgang == 1)
	{
		AI_Output(Mod_7385_OUT_August_REL, NULL, "Info_Mod_Smalltalk_Fremdgang_29_01"); //Jetzt hab dich nicht so, Schatzi. Nachts lässt sich hier schon keiner blicken.

		Mod_Smalltalk_Fremdgang = 2;
	}
	else if (Mod_Smalltalk_Fremdgang == 2)
	{
		AI_Output(Mod_7385_OUT_August_REL, NULL, "Info_Mod_Smalltalk_Fremdgang_29_02"); //Falls doch mal, war ich eben gerade pinkeln. Nun zier dich nicht so.

		Mod_Smalltalk_Fremdgang = 3;
	}
	else if (Mod_Smalltalk_Fremdgang == 3)
	{
		AI_Output(Mod_7343_OUT_Buergerin_REL, NULL, "Info_Mod_Smalltalk_Fremdgang_16_03"); //Ich weiß nicht. Mir ist nicht ganz wohl ...

		Mod_Smalltalk_Fremdgang = 4;
	}
	else if (Mod_Smalltalk_Fremdgang == 4)
	{
		AI_Output(Mod_7385_OUT_August_REL, NULL, "Info_Mod_Smalltalk_Fremdgang_29_04"); //Komm schon.

		Mod_Smalltalk_Fremdgang = 5;
	}
	else if (Mod_Smalltalk_Fremdgang == 5)
	{
		AI_Output(hero, NULL, "Info_Mod_Smalltalk_Fremdgang_15_05"); //(selbst) Ich denke, ich hab genug gehört. Mal sehen, was Felicita sagt.

		Mod_Smalltalk_Fremdgang = 6;

		B_LogEntry	(TOPIC_MOD_ASS_FELICITA, "Felicitas' Verdacht hat sich bestätigt. Ob sie das wohl freuen wird?");

		Mod_ASS_Felicita = 1;
	};
};