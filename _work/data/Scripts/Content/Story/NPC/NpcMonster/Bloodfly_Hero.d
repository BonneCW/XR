INSTANCE Bloodfly_Hero	(Mst_Default_Bloodfly)
{
	name	=	"Ich";
	B_SetVisuals_Bloodfly();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLOODFLY;
	id = 7177;
	Npc_SetToFistMode(self);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	daily_routine = Rtn_Start_7177;
	
};

FUNC VOID Rtn_Start_7177()
{
	TA_Roam	(08,00,20,00,"WP_SPAWN_HERO_BLOODFLY");
	TA_Roam	(20,00,08,00,"WP_SPAWN_HERO_BLOODFLY");
};

FUNC VOID Rtn_Tot_7177()
{
	TA_Roam	(08,00,20,00,"TOT");
	TA_Roam	(20,00,08,00,"TOT");
};