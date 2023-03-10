# iOS Guide


## Замыкания(Сlosures)

Замыкания – это блоки кода, которые могут быть многократно использованы, автономные блоки функциональности, которые можно передавать и использовать в вашем коде или блок кода, который вы можете присвоить переменной. Затем вы можете передать его в своем коде, например, в другую функцию.

### Замыкания и захват значений

В Swift замыкания захватывают переменные и константы из окружающей их области видимости.
Каждая переменная, функция и замыкание имеет свою область видимости. Область видимости определяет, где вы можете получить доступ к определенной переменной, функции или замыканию. Если переменная, функция или замыкание не находятся в области видимости, вы не можете получить к ним доступ. Область видимости иногда называется «контекстом».

Любой код имеет глобальные и локальные области видимости. К примеру:
- Свойство, определенное в классе, является частью глобальной области видимости. В любом месте этого класса вы можете установить и получить значение свойства.
- Переменная, как определено в функции, является частью локальной области действия функции. В любом месте этой функции вы можете установить и получить значение переменной.

### Escaping Closures (сбегающие замыкания)

Сбегающее замыкание (@escaping) - это ключевой термин, используемый для обозначения жизненного цикла замыкания, который передаётся в качестве аргумента функции. Добавляя к любому аргументу замыкания префикс @escaping, вы передаете сообщение вызывающему функцию, что это замыкание может «избежать» область вызова функции. Без префикса @escaping замыкание по умолчанию не является сбегающим, и его жизненный цикл заканчивается вместе с областью действия функции.

[Замыкания(Сlosures)](https://swiftblog.org/zamykanija-v-swift/)

[Escaping Closures (сбегающие замыкания)](https://swiftbook.ru/post/tutorials/escaping-in-closures-in-swift/)



## Классы и Структуры

### Структуры:

- Имеют встроенный инициализатор
- Структуры не могут наследовать
- Изменение типов данных в структуре осуществляется с помощью ключевого слово mutating
- Структуры хранятся в стеке

По умолчанию Apple рекомендует использовать структуры. Структуры также полезны в следующих сценариях:
- Используйте структуры для простых типов данных. Воспринимайте их как простые базы данных, которые вы можете использовать в своем коде. Поскольку они четко определены и часто не нуждаются в сложных отношениях между объектами.
- В многопоточной среде, например, с подключением к базе данных в другом потоке, структуры более безопасны. и могут быть безопасно скопированы из одного потока в другой. Классы не имеют присущей им безопасности, если только они не намеренно сделаны поточно-ориентированными.
- Когда свойства структуры в основном являются значимыми типами, например String, имеет смысл обернуть их в структуру вместо класса.

Использование структур имеет дополнительное преимущество - вам проще анализировать изменения данных в вашем коде. Когда тип является структурой, вы можете быть уверены, что никакая другая часть вашего кода не сможет удерживать ссылку на объект. То есть структура не может быть изменена какой-либо другой частью вашего кода.


### Классы:

У классов есть несколько дополнительных характеристик, которых нет у структур:
- Классы могут наследоваться друг от друга.
- Классы могут быть деинициализированы.
- Классы поставляются со встроенным понятием идентичности, потому что они
являются ссылочными типами.
- Классы хранятся в куче (heap)

С помощью оператора идентичности === вы можете проверить, ссылаются ли два экземпляра класса на один и тот же объект.
Наследование является наиболее важным различием между классом и структурой. С помощью классов вы можете четко определить родительско - дочернюю связь между подклассом и суперклассом.

[Классы и Структуры](https://swiftblog.org/klassy-i-struktury/)



## Инициализация

В Swift инициализатор – это специальная функция, которую мы используем для создания объектов определенного класса, структуры или перечисления.
Инициализаторы иногда называют конструкторами, потому что они «конструируют» объекты.

### Виды инициализаторов:

- Встроенный инициализатор - будет инициализировать объект со значениями свойств по умолчанию.
Если вы собираетесь предоставить значение по умолчанию, вы можете сделать ваш код более кратким.
Более того, вы можете использовать вывод типа, а объявление свойства и его значения по умолчанию облегчают чтение вашего кода.

- Поэлементный (memberwise) - инициализатор для структур, который будет автоматически инициализировать свойства структуры.
Поэлементный (memberwise) инициализатор доступен только для структур.
Swift будет автоматически синтезировать инициализатор для структур на основании свойств этой структуры, если вы не предоставите собственных инициализаторов init( ).

- Failable инициализаторы - могут возвращать nil на основании параметров, предоставленных инициализатору.
Failable инициализатор – это инициализатор, который может вернуть какое-либо значение или может вернуть nil.
Это своего рода иниализатор для опционалов.

- Обязательные (required) - это инициализатор, который обязательно должен быть реализован во всех подклассах данного класса.
Ключевое слово required подразумевает, что реализация инициализатора подкласса фактически переопределена.
Модификатор override для функции init() не требуется.

- Назначенные (designated) - предназначены для того, чтобы полностью инициализировать все свойства представленные классом и чтобы вызвать соответствующий инициализатор суперкласса для продолжения процесса инициализации цепочки наследований суперклассов.

- Вспомогательные (сonvenience) - являются вторичными, поддерживающими инициализаторами для класса.
Вы можете определить вспомогательный инициализатор для вызова назначенного инициализатора из того же класса, что и вспомогательный инициализатор с некоторыми параметрами назначенного инициализатора с установленными начальными значениями. Вы не обязаны обеспечивать вспомогательные инициализаторы, если ваш класс не нуждается в них.
Создавайте вспомогательный инициализатор всякий раз, когда это является наиболее рациональным путем общей инициализации и может сэкономить время и сделать саму инициализацию класса более чистой и краткой.

### Проблемы возникающие с инициализаторами:

- Необходимость вызывать назначенный инициализатор суперкласса.
При создании подклассов инициализаторы должны вызывать назначенный инициализатор суперкласса.

- В классе нет инициализаторов. Обычно это означает 2 вещи:

1. Вы не задали свойств класса значения по умолчанию, что означает, что они не были проинициализированы.
2. Вы не добавили инициализатор init().
- Свойство не инициализировано при вызове super.init.
Одно из правил работы с инициализаторами заключается в том, что назначенный (designated) инициализатор должен инициализировать каждое из своих свойств перед вызовом super.init(···).
Поскольку инициализатору суперкласса нельзя доверять для инициализации свойства подкласса, подкласс должен вначале убедиться, что инициализировал все свои свойства перед делегированием инициализации суперклассу.

[Инициализация](https://swiftbook.ru/content/languageguide/initialization/)

[Инициализаторы в Swift: подробное руководство](https://swiftblog.org/inicializatory-v-swift/)



## Объектно-ориентированное программирование (ООП)

ООП - помогает структурировать код с помощью классов. Классы имеют свойства и методы, которые могут наследоваться друг от друга.
ООП как стиль написания программ подразумевает построение структуры, состоящей из взаимодействующих объектов. В рамках ООП нужно мыслить объектами. Объекты расположены в иерархии, самостоятельны и как-то взаимодействуют. Программа состоит из модулей – блоков, которые решают какие-то задачи. Изменения в этих участках могут не отражаться на других участках.

Главные принципы в ООП – абстракция, полиморфизм, наследование, инкапсуляция.


### Абстракция 

У объекта есть «протокол»: у объекта есть методы и свойства, к которым мы можем обратиться извне этого объекта. Так же, как мы можем нажать кнопку на блендере. У блендера есть много всего внутри, что заставляет его работать, но на главной панели есть только кнопка. Вот эта кнопка и есть абстрактный интерфейс.

В программе мы можем сказать: «Удалить пользователя». На языке ООП это будет «пользователь.удалить ()» — то есть мы обращаемся к объекту «пользователь» и вызываем метод «удалить». Кайф в том, что нам не так важно, как именно будет происходить удаление: ООП позволяет нам не думать об этом в момент обращения. Например, над магазином работают два программиста: один пишет модуль заказа, а второй — модуль доставки. У первого в объекте «заказ» есть метод «отменить». И вот второму нужно из-за доставки отменить заказ. И он спокойно пишет: «заказ.отменить ()».
Ему неважно, как другой программист будет реализовывать отмену: какие он отправит письма, что запишет в базу данных, какие выведет предупреждения.


### Полиморфизм

Возможность объектов с одинаковым описанием метода иметь различную реализацию этого метода.

Полиморфизм - реализуется через
- базовый класс UIView у которого есть куча наследников, а функция принимает UIView, поэтому мы можем работать со всеми наследниками.
- Дженерики, функция принимает T тип и принт печатает его на экран
- Протоколы
Полиморфный код - код который может работать с различными типами.
Целью полиморфизма является использование одного имени для задания общих для класса действий. Выполнение каждого конкретного действия будет определяться типом данных. Концепцией полиморфизма является идея «один интерфейс, множество методов». Это означает, что можно создать общий интерфейс для группы близких по смыслу действий. Преимуществом полиморфизма является то, что он помогает понизить сложность разработки, разрешая использование того же интерфейса для задания единого класса действий. Выбор же конкретного действия, в зависимости от ситуации, возлагается на компилятор.


### Наследование

Cправляется с дублированием кода. Процесс, посредством которого один объект может приобретать свойства другого. Точнее, объект может наследовать основные свойства другого объекта и добавлять к ним черты, характерные только для него. Польза наследования в том, что оно дополняет идею абстракции. Абстракция позволяет представить объекты с разным уровнем детальности. Наследование упрощает программирование, позволяя создать универсальные методы для выполнения всего, что основано на общих свойствах, и затем написать специфические методы для выполнения специфических операций над конкретными типами данных.


### Агрегация

Тип отношений, когда у класса объект, позаимствовал где-то еще Композиция - это такой тип отношений, когда класс владеет объектом и несет ответственность за нее.


### Инкапсуляция

Заключение данных и функционала в оболочку. В объектно-ориентированном программировании в роли оболочки выступают классы: они не только собирают переменные и методы в одном месте, но и защищают их от вмешательства извне (сокрытие).


[Полиморфизм](https://forum.swiftbook.ru/t/polimorfizm-v-swift/2714/3)

[ООП](https://swiftblog.org/obektno-orientirovannoe-programmirovanie-v-swift/)



## Расширения(Extension)

Расширения позволяют дополнять функциональные возможности объекта без подклассов или изменения объекта. Расширения позволяют нам добавлять дополнительные функции в наш пользовательский класс.
Вот что могут делать расширения в Swift:

- Добавлять функции и вычисляемые свойства.
- Добавлять статистические константы.
- Создавать новые инициализаторы.
- Определять сабскрипты с помощью функции subscript().
- Определять новые вложенные типы.
- Добавлять соответствие протоколу.
- Добавить реализацию по умолчанию с помощью расширений протокола.

Ограничение:

-Они не могут переписывать существующий функционал, не можем использовать ovveride.
-Нельзя объявлять сторет проперти

[Extensions](https://swiftblog.org/rasshirenija-v-swift/)



## Модификаторы доступа

Swift предлагает 5 различных уровней доступа для объектов вашего кода. Эти уровни доступа относительны исходному файлу, в котором определен объект, и так же они относительны модулю, которому принадлежит исходный файл.

### Уровни доступа - позволяют ограничить доступ к частям кода и их 5 уровней доступа!
- Open -самый открытый уровень доступа, позволяющий наследовать свойства даже в другом модуле.
 Классы и члены класса могут быть подклассами и переопределены как внутри, так и вне определяющего модуля.
 
- Public - классы и члены класса могут быть подклассами и переопределены только внутри определяющего модуля.

- Internal - Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из их определяющего модуля, но не исходного файла не из этого модуля. Вы обычно указываете внутренний доступ, когда определяете внутреннюю структуру приложения или фреймворка. ПО УМОЛЧАНИЮ

- FilePrivate - этот уровень доступа ограничивает видимость метода и свойства в области файла, где находится код.
Этот уровень доступа позволяет использовать объект в пределах его исходного файла. Используйте файл-частный уровень доступа для того, чтобы спрятать детали реализации определенной части функциональности, когда эти части функциональности будут использоваться внутри другого файла.

- Private - Этот уровень доступа позволяет использовать сущность только в пределах области ее реализации. Используйте частный доступ для того, чтобы спрятать детали реализации конкретной части функциональности, когда они используются только внутри области объявления.

[Контроль доступа](https://swiftbook.ru/content/languageguide/access-control/)



## POP(Protocol-Oriented Programming), Протоколы(Protocols)

Использование протокола можно разделить на несколько сценариев:

- Протокол как тип - Аналогичен понятию интерфейс из ООП и контракту из контрактного
программирования.
Служит для описания функциональности объекта.
Может использоваться в качестве типа свойства, в качестве типа результата функции, типа элемента гетерогенной коллекции.
Из-за ограничений языка, протоколы имеющие associated types или Self-requirements не могут использоваться в качестве типов.
В extension можно сделать реализацию для функции, которые описаны в протоколе Хранимые проперти нельзя хранить в протоколе.

- Протокол как шаблон типа - Также служит для описания функциональности объекта, но в отличие от «протокол как тип», используется как требование к типу в обобщенных функциях. Может содержать associated types.
associated types — вспомогательные типы, имеющие некоторое отношение к моделирующему концепцию типу.
Четкой грани, в каком случае использовать протокол как тип, а в каком, как ограничение на тип - нет. Более того — иногда требуется использовать протокол в обоих сценариях. 
### Можно попытаться выделить случаи использования:

1. Классы, которые предоставляют функциональность для более высоких слоев приложения и передаются классам-потребителям как зависимости — это сервисы, репозитории, api-клиенты, пользовательские настройки, и прочее.
В этом случае удобнее использовать протокол как тип — его можно будет зарегистрировать в IOC контейнере, а без его использования — не потребуется в каждой функции, где используется этот сервис, добавлять тип-параметр.

2. Протокол с описанием математических операций, например сравнение, сложение, конкатенация и подобные вещи.
В этом случае удобно воспользоваться Self-requirement (когда в функции или свойстве протокола используется псевдотип Self), чтобы избежать опасного приведения и использования разных типов, когда операция допускает параметры только одного типа (и Int и String в Swift соответствуют протоколу Equatable, но если попытаться проверить их на равенство между собой, компилятор выдаст ошибку, поскольку оператор сравнения требует, чтобы параметры были одного типа).
Поэтому в этом случае протокол используется как шаблон типа.

3. Иногда требуется сохранить в приватном свойстве протокол имеющий associated types, но в этом случае мы не можем использовать протокол как тип.
Есть разные способы решения этой проблемы, например создание аналогичного протокола, в котором использование associated types будет заменено на конкретные типы; использование приёма type erasure — в этом случае associated types переедут в generic параметры типа Any(YourProtocolName).
Ещё варианты - сохранять не сам экземпляр, а его функции. Либо захватить экземпляр в замыкание, которое сохранить в свойство.

[Протоколы(Protocols)](https://habr.com/ru/post/358804/)



## Принципы SOLID

### DRY - Do not repeat yourself - Не повторяйся!
### KISS - Keep It Small and Simple - Будь проще!
### YAGNI - You aren't gonna need it - Вам это не понадобится!

Принципы SOLID - основополагающие принципы, на которых строятся архитектуры. Вот как расшифровывается акроним SOLID:


### S: Single Responsibility Principle (Принцип единой ответственности).
Один класс должен решать только какую-то одну задачу, одна ответственность на один класс. Он может иметь несколько методов, но они должны использоваться лишь для решения общей задачи. Все методы и свойства должны служить одной цели. Если класс имеет несколько назначений, его нужно разделить на отдельные классы.

### O: Open-Closed Principle (Принцип открытости-закрытости).
 Должны быть открыты для расширения, но закрыты для изменения.
 Программные сущности (классы, модули, функции и прочее) должны быть расширяемыми без изменения своего содержимого. Если строго соблюдать этот принцип, то можно регулировать поведение кода без изменения самого исходника.
 
### L: Liskov Substitution Principle (Принцип подстановки Барбары Лисков).
Функции, сущности которые используют родительский тип, должны так же работать с дочерними классами. Наследуемый класс должен дополнять, а не замещать поведение базового класса.

### I: Interface Segregation Principle (Принцип разделения интерфейса).
Программные сущности не должны зависеть от методов, которые они не используют Это означает, что нужно разбивать интерфейсы(протоколы) на более мелкие, лучше удовлетворяющие конкретным потребностям клиентов.

### D: Dependency Inversion Principle (Принцип инверсии зависимостей).
«Зависимость на Абстракциях. Нет зависимости на что-то конкретное.»
Проще говоря: зависьте от абстракций, а не от чего-то конкретного.
Применяя этот принцип, одни модули можно легко заменять другими, всего лишь меняя модуль зависимости, и тогда никакие перемены в низкоуровневом модуле не повлияют на высокоуровневый.


[Single Responsibility Principle (Принцип единой ответственности)](https://vmityuklyaev.medium.com/%D0%BA%D0%B0%D0%BA-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%8E%D1%82-%D0%BF%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF%D1%8B-solid-%D0%B2-swift-%D0%BF%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF-%D0%B5%D0%B4%D0%B8%D0%BD%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9-%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%D1%81%D1%82%D0%B8-f019d6daab2d)

[Open-Closed Principle (Принцип открытости-закрытости)](https://vmityuklyaev.medium.com/solid-%D0%BF%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF-%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%BE%D1%81%D1%82%D0%B8-%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D0%BE%D1%81%D1%82%D0%B8-%D0%B2-swift-open-closed-principle-in-swift-fd7290fe7456)

[Liskov Substitution Principle (Принцип подстановки Барбары Лисков)](https://vmityuklyaev.medium.com/%D0%BA%D0%B0%D0%BA-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%8E%D1%82-%D0%BF%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF%D1%8B-solid-%D0%B2-swift-%D0%BF%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF-%D0%BF%D0%BE%D0%B4%D1%81%D1%82%D0%B0%D0%B2%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8-%D0%B1%D0%B0%D1%80%D0%B1%D0%B0%D1%80%D1%8B-%D0%BB%D0%B8%D1%81%D0%BA%D0%BE%D0%B2-a6284b529456)

[Interface Segregation Principle (Принцип разделения интерфейса)](https://vmityuklyaev.medium.com/%D0%BA%D0%B0%D0%BA-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%8E%D1%82-%D0%BF%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF%D1%8B-solid-%D0%B2-swift-%D0%BF%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF-%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81%D0%BE%D0%B2-isp-1b0d1ea9f7c2)

[Dependency Inversion Principle (Принцип инверсии зависимостей)](https://apptractor.ru/info/articles/printsipy-solid-v-swift.html)

[Принципы чистого кода](https://habr.com/ru/company/itelma/blog/546372/)



## ARC и MRC

### MRC - Manual Reference Counting(система ручного подсчета ссылок)
При разработке iOS приложений на языке Objective-C используется MRC, то есть система ручного подсчета ссылок. При создании объектов с помощью методов new, copy, retain (и др.) счетчик ссылок на объект увеличивается на 1. При вызове метода release счетчик ссылок уменьшался на 1. Как только счетчик ссылок на объект становится равным нулю, он удаляется из кучи.
При многопоточной работе приложения объект удаляется на том потоке, где был произведен последний release.

### ARC - Automatic Reference Counting(система автоматического подсчета ссылок).

Swift использует ARC для отслеживания и управления памятью вашего приложения.
ARC автоматически освобождает память, которая использовалась экземплярами класса, когда эти экземпляры больше нам не нужны.
ARC применима только для экземпляров класса. Структуры и перечисления являются типами значений(value), а не ссылочными(reference) типами, и они не хранятся и не передают свои значения по ссылке. Каждый раз, когда вы создаете экземпляр класса, ARC выделяет фрагмент памяти для хранения информации этого экземпляра. Этот фрагмент памяти содержит информацию о типе экземпляра, о его значении и любых свойствах хранения, связанных с ним.

Дополнительно, когда экземпляр больше не нужен, ARC освобождает память, использованную под этот экземпляр, и направляет эту память туда, где она нужна. Это своего рода гарантия того, что ненужные экземпляры не будут занимать память.
Однако, если ARC освободит память используемого экземпляра, то доступ к свойствам или методам этого экземпляра будет невозможен. Если вы попробуете получить доступ к этому экземпляру, то ваше приложение скорее всего выдаст ошибку и будет остановлено.

Для того, чтобы нужный экземпляр не пропал, ARC ведет учет количества свойств, констант, переменных, которые ссылаются на каждый экземпляр класса. ARC не освободит экземпляр, если есть хотя бы одна активная ссылка.
Для того чтобы это было возможно, каждый раз как вы присваиваете экземпляр свойству, константе или переменной создается strong reference (сильная ссылка) с этим экземпляром. Такая связь называется “сильной”, так как она крепко держится за этот экземпляр и не позволяет ему освободится до тех пор, пока остаются сильные связи.

### SideTable (Боковая таблица)
SideTable - это область в памяти, содержащая дополнительную информацию объекта, которую не нужно хранить в нем самом. Она нужна для того, чтобы слабые ссылки ссылались не напрямую на обьект, а на боковую таблицу, которая указывает на обьект. Это решает две проблемы:

● 1.Экономие памяти. Объект удаляется из памяти, если на него больше нет сильных ссылок.
Это позволяет безопасно обнулять слабые ссылки, поскольку слабая ссылка теперь не указывает напрямую на объект и не является предметом race condition.

● Если счетчик strong ссылок становится равен нулю, то объект всегда переходит в состояние deiniting. Unowned ссылки выкидывают ошибку в runtime, а чтение weak ссылок возвращает nil.
Счетчик unowned ссылок получает +1 от счетчика strong ссылок, который впоследствие уменьшается после завершения функции deinit() объекта.
Счетчик weak ссылок получает +1 от счетчика unowned ссылок. Он уменьшается после освобождения (freed) объекта из памяти

### Виды ссылок:
- Strong - Сильная
- Weak - слабая ссылка:
1. Когда эĸземпляр освободится ссылĸа будет установлена на nil. 
2. Она всегда объявляется ĸаĸ необязательная (Опциональная).

- Unowned - Бесхозная ссылка Всегда не optional. Если я знаю что ссылка никогда не станет nil, если она была установлена во время инициализации:
1. Всегда должно быть значение.
2. Прямой доступ ĸ значению.
При создание объекта heap object - счетчик ссылок находится в самом объекте, а если добавим weak ссылку, то счетчик ссылок будет находится в sideTable, а объект heap object будет иметь ссылку на эту таблицу.


### AutorelesePool:
AutoreleasePool – это хранилище объектов ссылочного типа, которые необходимо уничтожить не прямо сейчас, а несколько позже. В некоторых случаях требуется отложить уменьшение счетчика, например при возвращении объекта из функции. Так, если в конце функции вызвать release у возвращаемого объекта, то он будет уничтожен еще до того, как функция завершит работу. Но нам требуется, чтобы объект продолжал жить даже после завершения работы функции.

[Управление памятью](https://swiftme.ru/upravlenie-pamyatyu-v-swift-8281/)

[AutorelesePool](https://medium.com/mediate-tech/cleaning-memory-footprint-with-the-autoreleasepool-in-swift-71ff983b22aa)



## Frame и Bounds

- Frame - положение и размер view с использованием системы координат родительского представления (важно для размещения представления в superview)

- Bounds - местоположение и размер view с использованием его собственной системы координат (важно для размещения содержимого View или subview внутри него)

- IntrinsicContentSize (свойство у View) - это размер ĸоторый описывает минимальное пространство для полного отображения ĸонтента.

- Content hugging prioriti - сопротивление на увеличение.

- Content compression resistance - сопротивление на уменьшение.

[Frame и Bounds](https://vmityuklyaev.medium.com/%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%B8%D0%B5-frame-%D0%B8-bounds-%D0%B2-ios-frame-vs-bounds-in-ios-4e5aee5ed477)



## AutoLayout

AutoLayout - занимается динамическим вычислением позиции и размера всех view в view иерархии, на основе constraints — правил заданных для того или иного view. Самый большой и очевидный плюс для разработчика в использовании Auto Layout в том, что исчезает необходимость в подгонке размеров приложения под определенные устройства — Auto Layout делает это за вас, динамически изменяя интерфейс в зависимости от внешних или внутренних изменений.
Настройка Auto Layout проходит через 3 этапа:

1) UPDATE: На этом шаге выполняется расчет frame для UIView на основании constraints. Система будет просматривать иерархию представлений сверху вниз и вызовет updateConstraints() для каждого UIView. - Этот процесс автоматический
- setNeedsUpdateConstraints() - отключает текущие ограничения и планирует обновления для пересчета в следующем цикле.
- updateConstraintsIfNeeded() - активирует updateConstraints() немедленно, если ограничения были ранее отключены.

2) LAYOUT: На этом этапе frame каждого UIView будут обновлены с параметрами, рассчитанными на этапе обновления. Это происходит снизу вверх
- layoutSubviews() - мы переопределяем этот метод, когда frame рассчитываются из кода
- setNeedsLayout() - отключает текущий макет
- layoutIfNeeded() - активирует layoutSubviews()
Если overriding layoutSubviews():
- обязательно вызвать super.layoutSubviews()
- нельзя вызывать setNeedsLayout() и setNeedsUpdateConstraints() в противном случае появится бесконечный цикл.

3) RENDERING - отвечает за отображение представлений на экране. Независимо от того, использует ли вид Auto Layout или нет, этот шаг выполняется всегда.
UIView перенесет это отображение в CALayer. Основной метод этого шага - drawRect ()

[AutoLayout](https://habr.com/ru/post/312782/)
