digraph G {

 source [shape="rectangle", label=" Исходный код"];
 headers [shape="rectangle", label="Заголовочные файлы"];
 prepsrc [shape="rectangle", label="Препроцессированный код"];
 lexemes [shape="rectangle", label="Поcледовательность лексем"];
 prech  [shape="rectangle", label="Прекомпилированные заголовки", color="grey"];
 tree [shape="rectangle", label="Дерево и вспомогательные таблицы"];
 asm [shape="rectangle", label="Код на ассемблере"];
 obj [shape="rectangle", label="Объектный код"];
 lib [shape="rectangle", label="Объектный код статических библиотек"];
 exe [shape="rectangle", label="Исполнимый код"];
 dll [shape="rectangle", label="Динамические библиотеки"];
 process [shape="rectangle", label="Образ прцесса в памяти"];


 prepro [shape="ellipse", label="Препроцессор"];
 lexer  [shape="ellipse", label="Лексический анализатор (сканер)"];
 parser [shape="ellipse", label="Синтаксический анализатор"];
 pretranslator [shape="ellipse", label="Претранслятор", color="grey"];
 optimizer [shape="ellipse", label="Оптимизатор"];
 generator [shape="ellipse", label="Генератор"];
 assembler [shape="ellipse", label="Ассемблер"];
 linker [shape="ellipse", label="Редактор связей"];
 loader [shape="ellipse", label="Загрузчик"];
 execution [shape="ellipse", label="Вычислитель"];


 subgraph G1 {
  rank = same;

  source;
  headers;
  asm;
 }

 subgraph G2 {
  rank = same;

  generator;
  execution;
 }


 source -> prepro;
 headers -> prepro;
 prepro -> prepsrc;

 prepsrc -> lexer -> lexemes;
 lexer -> prech -> lexer;

 lexemes -> parser -> tree -> pretranslator -> tree -> optimizer -> tree -> generator;

 generator -> asm [rankdir="TB"];

 asm -> assembler -> obj;

 obj -> linker; lib -> linker;
 linker -> exe; linker -> dll;

 exe -> loader; dll -> loader; loader -> process;

 process -> execution;
}