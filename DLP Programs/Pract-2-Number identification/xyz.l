bin (0|1)*
oct  [0-7]
char [A-Za-z]*
dec  [0-9]*
digit [0-9]
float {digit}+("."{digit}+)?
expo {digit}+("."{digit}+)?("E"("+"|"-")?{digit}+)?
hex  [0-9a-fA-f]+
%%
{bin} printf("Enter no. is a binary number");
{oct} printf("Enter no. is a Octal number");
{char} printf("Enter input is Char");
{dec} printf("Enter input is decimal number");
{float} printf("Enter input is float number");
{expo}  printf("Enter input is expo. number");
{hex} printf("Enter input is hex number");
%%
int yywrap()
{
  return 1;
}
int main()
{
  printf("Enter the number=");
  yylex();
  return 0;
  }
