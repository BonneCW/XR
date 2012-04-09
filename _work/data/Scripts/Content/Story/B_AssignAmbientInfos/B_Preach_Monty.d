// ***************
// B_Preach_Monty
// ***************

func void B_Preach_Monty(var int satz)
{
	if (satz == 0) 	
	{	
		// Hier Applaus-Ende

		AI_PlayAni	(Mod_1049_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1059_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1055_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1065_VLK_Buergerin_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1073_VLK_Buergerin_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1072_VLK_Buergerin_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1044_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");

		AI_Output (self, self, "Info_Mod_Monty_Preach_08_00"); //Mitten in der Nacht schlich ich mich durch das Orklager.
	};
	if (satz == 1) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_01"); //Ich schlitzte den Orkwachen die Kehlen auf, sodass sie in ihrem Blut schwammen!

		// Hier kommt dann das applaudierende Publikum drunter (T_STAND_2_CLAPHANDS oder so)

		AI_PlayAni	(Mod_1049_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1059_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1055_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1065_VLK_Buergerin_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1073_VLK_Buergerin_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1072_VLK_Buergerin_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1044_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
	};
	if (satz == 2) 	
	{
		// Hier Applaus-Ende

		AI_PlayAni	(Mod_1049_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1059_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1055_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1065_VLK_Buergerin_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1073_VLK_Buergerin_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1072_VLK_Buergerin_NW, "T_CLAPHANDS_2_STAND");
		AI_PlayAni	(Mod_1044_VLK_Buerger_NW, "T_CLAPHANDS_2_STAND");

		AI_Output (self, self, "Info_Mod_Monty_Preach_08_02"); //Dann stieg ich die Höhle hinab wie in ein Grab.
	};
	if (satz == 3) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_03"); //Stockfinster und eng war es dort, und es wimmelte von Dämonen und Schlimmerem.
	};
	if (satz == 4) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_04"); //Endlich, ich wähnte mich seit Wochen dort unten, weitete sich die Höhle, und mittendrin, hässlich und riesenhaft, hockt der Schläfer.
	};
	if (satz == 5) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_05"); //Und nun - ich gegen ihn, 20 Meter und 14 Beine gegen zwei.
	};
	if (satz == 6) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_06"); //Kampf auf Leben und Tod.
	};
	if (satz == 7) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_07"); //Keine Chance, denke ich. Aber ich gebe nicht auf!
	};
	if (satz == 8) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_08"); //Ein Bein nach dem andern fällt, grüne Säure spritzt heraus und verätzt mir die Augen, bis ich kaum noch etwas sehe.
	};
	if (satz == 9) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_09"); //Ich hacke und steche, und irgendwann - rührt sich nichts mehr. Ich habe gesiegt!
	};
	if (satz == 10) 	
	{	
		AI_Output (self, self, "Info_Mod_Monty_Preach_08_10"); //Und hier ist alles, was noch von ihm übrig ist!

		// Hier kommt dann das applaudierende Publikum drunter (T_STAND_2_CLAPHANDS oder so)

		AI_PlayAni	(Mod_1049_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1059_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1055_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1065_VLK_Buergerin_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1073_VLK_Buergerin_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1072_VLK_Buergerin_NW, "T_STAND_2_CLAPHANDS");
		AI_PlayAni	(Mod_1044_VLK_Buerger_NW, "T_STAND_2_CLAPHANDS");
	};
};
