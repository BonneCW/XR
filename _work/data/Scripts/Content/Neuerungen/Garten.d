class GartenObject {
	var int inst;
	var int row;
	var int column;
	var int time;
};

const int MAX_GARTEN = 36; //Wir definieren diese Konstante, um unser System leicher anpassen zu können, z.B. bei vielen Monstern. Außerdem ist das schöner.
var int GartenArray[MAX_GARTEN];
var int nextGartenIndex;

instance GartenObject@(GartenObject);

FUNC INT GartenFeldIstFrei(var int m, var int n)
{
	if (m < 0)
	|| (m >= 6)
	|| (n < 0)
	|| (n >= 6)
	{
		return FALSE;
	};

	if (MEM_ReadStatArr(GartenArray, m*6+n) == 0)
	{
		return TRUE;
	};

	return FALSE;
};

func void AddToGartenArray(var int itm, var int m, var int n) {
	var int hndl; hndl = new(GartenObject@);
	MEM_WriteStatArr(GartenArray, m*6+n, hndl); // GartenArray[nextGartenIndex] = hndl;
	nextGartenIndex += 1; // Beim nächsten Mal in den nächsten Index schreiben
	 
	var GartenObject myGartenObject; myGartenObject = get(hndl);
	myGartenObject.inst = itm;
	myGartenObject.row = m;
	myGartenObject.column = n;
	myGartenObject.time = 0;
};

func void RemoveGartenObject(var int hndl) {
	if (nextGartenIndex == 0) { // Das Array ist leer.
		return;
	};

	delete(hndl); // Hier erledigen wir den PM-Teil unseres Destruktors, alles weitere macht PM dann selber. Unter anderem wird versucht, Garten_Object_Delete() aufzurufen, allerdings gibt es diese Funktion nicht (sie ist optional)
	
	var int i; i = 0; // Das mag verwirren, aber ich baue bloß eine Schleife in Daedalus. Mit dem neuen Ikarus-Release geht das auch wesentlich schöner. 
	var int pos; pos = MEM_StackPos.position; // Stellt euch einfach vor, das hier wäre eine While(1)-Schleife. Zur Übersicht habe ich eingerückt.

		var int h; h = MEM_ReadStatArr(GartenArray, i); // h = GartenArray;
		if (h == hndl) { // Wir haben unsere Referenz gefunden
			MEM_WriteStatArr(GartenArray, i, 0); // Alte Referenz mit der letzten Referenz überschreiben
			nextGartenIndex -= 1; // Unseren Zähler dekrementieren
			return; // Mehr wollen wir nicht machen.
		};

	i += 1;	
	if (i >= nextGartenIndex) { // Wenn i größer oder gleich dem nextGartenIndex ist, haben wir das Array komplett durchlaufen.
		return;
	};
	MEM_StackPos.position = pos;	
};

FUNC VOID FillGarten(var int inst, var int m, var int n)
{
	if (GartenFeldIstFrei(m-1, n-1))
	{
		AddToGartenArray(inst, m-1, n-1);
	};
	if (GartenFeldIstFrei(m-1, n))
	{
		AddToGartenArray(inst, m-1, n);
	};
	if (GartenFeldIstFrei(m-1, n+1))
	{
		AddToGartenArray(inst, m-1, n+1);
	};
	if (GartenFeldIstFrei(m+1, n-1))
	{
		AddToGartenArray(inst, m+1, n-1);
	};
	if (GartenFeldIstFrei(m+1, n))
	{
		AddToGartenArray(inst, m+1, n);
	};
	if (GartenFeldIstFrei(m+1, n+1))
	{
		AddToGartenArray(inst, m+1, n+1);
	};
	if (GartenFeldIstFrei(m-1, n-1))
	{
		AddToGartenArray(inst, m, n-1);
	};
	if (GartenFeldIstFrei(m-1, n-1))
	{
		AddToGartenArray(inst, m, n+1);
	};
};

FUNC INT GetGartenObjectTime(var int itm)
{
	return 0;
};

func void ActualizeGarten() {
	if (nextGartenIndex == 0) { // Das Array ist leer.
		return;
	};
	var int i; i = 0; // Das mag verwirren, aber ich baue bloß eine Schleife in Daedalus. Mit dem neuen Ikarus-Release geht das auch wesentlich schöner. 
	var int pos; pos = MEM_StackPos.position; // Stellt euch einfach vor, das hier wäre eine While(1)-Schleife. Zur Übersicht habe ich eingerückt.
	
		var int hndl; hndl = MEM_ReadStatArr(GartenArray, i); // hndl = GartenArray;
		var GartenObject myGartenObject; myGartenObject = get(hndl);
		
		//Jetzt haben wir unser Objekt!

		myGartenObject.time += 1;

		if (myGartenObject.time >= GetGartenObjectTime(myGartenObject.inst))
		{
			FillGarten(myGartenObject.inst, myGartenObject.row, myGartenObject.column);
			myGartenObject.time = 0;
		};
		
		i += 1; // Falls ich ein Objekt gelöscht habe, muss ich den selben Index nochmal lesen.
	if (i >= nextGartenIndex) { // Wenn i größer oder gleich dem nextGartenIndex ist, haben wir das Array komplett durchlaufen.
		return;
	};
	MEM_StackPos.position = pos;
	
};

const string GartenObject_Struct = "int int int int";