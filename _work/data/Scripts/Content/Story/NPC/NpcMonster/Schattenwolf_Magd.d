INSTANCE Schattenwolf_Magd	(Mst_Default_Warg)
{
	name	=	"Magd";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	id = 7202;
	Npc_SetToFistMode(self);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Warg_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	daily_routine = Rtn_Start_7202;
	
};

FUNC VOID Rtn_Start_7202()
{
	TA_Guide_Player	(08,00,20,00,"NW_BIGFARM_SHEEP2_02");
	TA_Guide_Player	(20,00,08,00,"NW_BIGFARM_SHEEP2_02");
};

FUNC VOID Rtn_Tot_7202()
{
	TA_Roam	(08,00,20,00,"TOT");
	TA_Roam	(20,00,08,00,"TOT");
};