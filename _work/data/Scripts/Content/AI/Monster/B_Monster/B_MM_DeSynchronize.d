func int B_MM_DeSynchronize()
{
	B_Vergiftet (self);

	var int msec;
	msec = r_max(999);
	AI_Waitms (self, msec);
};
