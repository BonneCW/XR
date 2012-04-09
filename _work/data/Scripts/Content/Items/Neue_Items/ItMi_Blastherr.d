INSTANCE ItMi_Blastherr (C_Item)
{
	name 				=	"Blastherr";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Shell_02.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"POTIONFAST";
	on_state[0]			= 	Use_Blastherr;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

func void Use_Blastherr()
{
	Snd_Play ("Inst_Alarm");

	if (Npc_GetDistToWP(hero, "REL_272") < 300)
	&& (Mod_SL_PartGeliebte == 1)
	{
		Mod_SL_PartGeliebte = 2;
	};
};