extern void VIDEO__Prepare();
//extern void VIDEO__PrintString();

void OSPI_terminal(void)
{
    return;
}

//Здесь начинается AtomOS :)
// start - самая первая функция ядра
void start(void)
{
    //VIDEO__PrintString();
    //forw("Hello");
    //VIDEO__PrintString(msg);
    //const char* str = "Hello";
    //VIDEO__PrintString(str);

    VIDEO__Prepare();

    OSPI_terminal();

    return;
}