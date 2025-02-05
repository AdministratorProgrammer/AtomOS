extern void VIDEO__Prepare();
extern void VIDEO__Fill_Screen();
//extern void VIDEO__PrintString();

void OSPI_terminal(void)
{
    return;
}

//Здесь начинается AtomOS :)
// start - самая первая функция ядра
void start(void)
{
    VIDEO__Prepare();
    VIDEO__Fill_Screen();

    OSPI_terminal();

    return;
}