func int B_MM_DeSynchronize()
{

	B_Vergiftet (self);

	var int msec;
	msec = Hlp_Random (1000);
	AI_Waitms (self, msec);
};
