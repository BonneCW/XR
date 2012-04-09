INSTANCE Bloodfly_Albert	(Mst_Default_Bloodfly)
{
	name	=	"Albert";
	B_SetVisuals_Bloodfly();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLOODFLY;
	id = 7176;
	Npc_SetToFistMode(self);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	daily_routine = Rtn_Start_7176;
	
};

FUNC VOID Rtn_Start_7176()
{
	TA_Roam	(08,00,20,00,"WP_MINENTAL_START_ORCCITY");
	TA_Roam	(20,00,08,00,"WP_MINENTAL_START_ORCCITY");
};

FUNC VOID Rtn_Tot_7176()
{
	TA_Roam	(08,00,20,00,"TOT");
	TA_Roam	(20,00,08,00,"TOT");
};