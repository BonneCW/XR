FUNC VOID B_SetEssPunkte (var int PlusEssen)
{
	Mod_EssPunkte += PlusEssen;

	if (Mod_EssPunkte > 100)
	{
		Mod_EssPunkte = 100;
	};

	Mod_NichtsGegessenCounter = 0;
};