INSTANCE RosaHase_7187	(Mst_Default_Rabbit)
{
	name	=	"Rosa Hase";
	
	guild							=	GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_MEATBUG;
	id = 7187;
	Npc_SetToFistMode(self);
	flags = 2;

	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	//B_GiveAll();

	Mdl_SetVisual			(self,"Zaic.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self, "Zaic2",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Mdl_SetModelScale(self, 5.0, 5.0, 5.0);

	daily_routine = Rtn_Start_7187;
	
};

FUNC VOID Rtn_Start_7187()
{
	TA_Roam	(08,00,20,00,"WW_01");
	TA_Roam	(20,00,08,00,"WW_01");
};