digraph G {
    " Начальное грубое значение (может не быть)" [shape="rectangle", color="blue"];
    " Аналоговый вход" [shape="rectangle", color="red"];
    " Аналоговый\nпромежуточный сигнал" [shape="rectangle", color="red"];
    " Конечное точное значение" [shape="rectangle", color="blue"]

    " Начальное грубое значение (может не быть)" -> " Управляющее устройство" [color="blue", label="Ц"];

    " ЦАП" [shape="ellipse"];
    " Управляющее устройство" [shape="ellipse"];
    " Компаратор" [shape="ellipse"];

    " Компаратор" -> " Управляющее устройство" [color="brown", label="Результат сравнения\n [<],[>],[=]"];

    " Управляющее устройство" -> " ЦАП" [color="blue", label="Ц"];
    " Управляющее устройство" -> " Конечное точное значение" [color="blue", label="Ц"];
    " ЦАП" -> " Аналоговый\nпромежуточный сигнал" -> " Компаратор" [color="red", label="А"];
    " Аналоговый вход" -> " Компаратор" [color="red", label="A"];
}