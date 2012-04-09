// Alle Buddler in der alten Mine machen ihren normalen TA

FUNC VOID B_FM_ARBEIT()
{
	B_StartOtherRoutine	(Mod_1583_SFB_Schuerfer_FM, "START");
	B_StartOtherRoutine	(Mod_1584_SFB_Schuerfer_FM, "START");
	B_StartOtherRoutine	(Mod_1585_SFB_Schuerfer_FM, "START");
	B_StartOtherRoutine	(Mod_1587_SFB_Schuerfer_FM, "START");
	B_StartOtherRoutine	(Mod_1588_SFB_Schuerfer_FM, "START");
};

// Alle Buddler in der alten Mine machen Pause

FUNC VOID B_FM_PAUSE()
{
	B_StartOtherRoutine	(Mod_1583_SFB_Schuerfer_FM, "PAUSE");
	B_StartOtherRoutine	(Mod_1584_SFB_Schuerfer_FM, "PAUSE");
	B_StartOtherRoutine	(Mod_1585_SFB_Schuerfer_FM, "PAUSE");
	B_StartOtherRoutine	(Mod_1587_SFB_Schuerfer_FM, "PAUSE");
	B_StartOtherRoutine	(Mod_1588_SFB_Schuerfer_FM, "PAUSE");

	Autosave_Counter = Mod_Autosave*600;
};