func void B_SetVisuals_Draconian01(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_01",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian02(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_02",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian03(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_03",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian04(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_04",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian05(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_05",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian06(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_06",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian07(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_07",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian08(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_08",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian09(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_09",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian10(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_10",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Draconian11(var C_NPC EchsiTexi)
{
	Mdl_SetVisual			(EchsiTexi,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(EchsiTexi,	"Draconian_Body_11",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

FUNC VOID B_EchsenBody (var C_NPC Echsi)
{
	if (Echsi.guild == GIL_DRACONIAN)
	{
		if (Echsi.exp >= 2000)
		{
			B_SetVisuals_Draconian10(Echsi);
		}
		else if (Echsi.exp >= 1200)
		{
			B_SetVisuals_Draconian09(Echsi);
		}
		else if (Echsi.exp >= 750)
		{
			B_SetVisuals_Draconian08(Echsi);
		}
		else if (Echsi.exp >= 400)
		{
			B_SetVisuals_Draconian07(Echsi);
		}
		else if (Echsi.exp >= 250)
		{
			B_SetVisuals_Draconian06(Echsi);
		}
		else if (Echsi.exp >= 100)
		{
			B_SetVisuals_Draconian05(Echsi);
		}
		else if (Echsi.exp >= 50)
		{
			B_SetVisuals_Draconian04(Echsi);
		}
		else if (Echsi.exp >= 10)
		{
			B_SetVisuals_Draconian03(Echsi);
		}
		else if (Echsi.exp >= 5)
		{
			B_SetVisuals_Draconian02(Echsi);
		}
		else if (Echsi.exp >= 0)
		{
			B_SetVisuals_Draconian01(Echsi);
		};
	};
};