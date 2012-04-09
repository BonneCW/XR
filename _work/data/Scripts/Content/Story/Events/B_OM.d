// Alle Buddler in der alten Mine machen ihren normalen TA

FUNC VOID B_OM_ARBEIT()
{
	B_StartOtherRoutine	(Mod_1474_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1475_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1476_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1477_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1478_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1479_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1480_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1481_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1482_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1483_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1484_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1485_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1486_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1487_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1488_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1489_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1490_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1491_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1493_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1494_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1495_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1496_BUD_Glen_OM, "START");
	B_StartOtherRoutine	(Mod_1497_BUD_Aleph_OM, "START");
	B_StartOtherRoutine	(Mod_1498_BUD_Grimes_OM, "START");
	B_StartOtherRoutine	(Mod_1499_BUD_Garp_OM, "START");
	B_StartOtherRoutine	(Mod_1500_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1501_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1502_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1503_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1504_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1505_BUD_Buddler_OM, "START");
	B_StartOtherRoutine	(Mod_1507_BUD_Buddler_OM, "START");

	var C_NPC orkidorki;
	orkidorki = Hlp_GetNpc(Orc_Stomper);

	Npc_ClearAIQueue(orkidorki);
	B_ClearPerceptions(orkidorki);
	
	AI_StartState	(orkidorki, ZS_Orc_Stomper, 0, "");

	orkidorki = Hlp_GetNpc(Orc_Stonemill);

	Npc_ClearAIQueue(orkidorki);
	B_ClearPerceptions(orkidorki);
	
	AI_StartState	(orkidorki, ZS_Orc_Stonemill, 0, "");
};

// Alle Buddler in der alten Mine machen Pause

FUNC VOID B_OM_PAUSE()
{
	B_StartOtherRoutine	(Mod_1474_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1475_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1476_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1477_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1478_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1479_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1480_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1481_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1482_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1483_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1484_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1485_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1486_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1487_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1488_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1489_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1490_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1491_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1493_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1494_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1495_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1496_BUD_Glen_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1497_BUD_Aleph_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1498_BUD_Grimes_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1499_BUD_Garp_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1500_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1501_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1502_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1503_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1504_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1505_BUD_Buddler_OM, "PAUSE");
	B_StartOtherRoutine	(Mod_1507_BUD_Buddler_OM, "PAUSE");

	var C_NPC orkidorki;
	orkidorki = Hlp_GetNpc(Orc_Stomper);

	Npc_ClearAIQueue(orkidorki);
	B_ClearPerceptions(orkidorki);
	
	AI_StartState	(orkidorki, ZS_Orc_Eat, 0, "");

	orkidorki = Hlp_GetNpc(Orc_Stonemill);

	Npc_ClearAIQueue(orkidorki);
	B_ClearPerceptions(orkidorki);
	
	AI_StartState	(orkidorki, ZS_Orc_Eat, 0, "");

	Autosave_Counter = Mod_Autosave*600;
};