FILE *goodFile;
FILE *badFile;

int files[] = {0, 0};

void openFiles(char *fileName)
{
	char good[250] = { 0 };
	char bad[250] = { 0 };
	
	memcpy( good, fileName, strlen(fileName) - 2 );
	memcpy( bad, fileName, strlen(fileName) - 2 );
	
	if(fileName[strlen(fileName)-1] == 'c')
	{
		strcat(good, "_Good.c");
		strcat(bad, "_Bad.c");
	}
	else
	{
		strcat(good, "_Good.cpp");
		strcat(bad, "_Bad.cpp");
	}
	goodFile = fopen(good, "w");
	badFile = fopen(bad, "w");	
}

void closeFiles()
{
	fclose(goodFile);
	fclose(badFile);
}

void printFile(char* str)
{
	if (files[0] == 1)
		fprintf(goodFile, "%s", str);
	if (files[1] == 1)
		fprintf(badFile, "%s", str);
}

void addFile(int file)
{
	files[file] = 1;
}

void removeFile(int file)
{
	files[file] = 0;
}