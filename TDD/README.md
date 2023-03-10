# TDD — это подход к разработке на через тестирование

### Robert C. Martin, известный как Дядюшка Боб, описал три главных правила TDD:

```swift

"You are not allowed to write any production code unless it is to make a failing unit test pass."

"You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures."

"You are not allowed to write any more production code than is sufficient to pass the one failing unit test."

```

## TDD, test-driven development или процесс разработки через тестирование — это методология разработки программного обеспечения, которая основывается на повторении коротких циклов разработки: изначально пишется тест, покрывающий желаемое изменение, затем пишется программный код, который реализует желаемое поведение системы и позволит пройти написанный тест, а затем проводится рефакторинг написанного кода с постоянной проверкой прохождения всех тестов.

## Unit Testing - это процесс покрытия кода тестами. 

### Unit Test (модульный тест) представляет из себя тестовый метод. Задача юнит теста заключается в том, чтобы протестировать работоспособность конкретного действия.


## Пять принципов чистых тестов (F.I.R.S.T. Principles)

- Быстрота (Fast). Тесты должны выполняться быстро. Все мы знаем, что разработчики люди, а люди ленивы, поскольку эти выражения являются “транзитивными”, то можно сделать вывод, что люди тоже ленивы. А ленивый человек не захочет запускать тесты при каждом изменении кода, если они будут долго выполняться.

- Независимость (Independent). Результаты выполнения одного теста не должны быть входными данными для другого. Все тесты должны выполняться в произвольном порядке, поскольку в противном случае при сбое одного теста каскадно “накроется” выполнение целой группы тестов.

- Повторяемость (Repeatable). Тесты должны давать одинаковые результаты не зависимо от среды выполнения. Результаты не должны зависеть от того, выполняются ли они на вашем локальном компьютере, на компьютере соседа или же на билд-сервере. В противном случае найти концы с концами будет весьма не просто.

- Очевидность (Self-Validating). Результатом выполнения теста должно быть булево значение. Тест либо прошел, либо не прошел и это должно быть легко понятно любому разработчику.  Не нужно заставлять людей читать логи только для того, чтобы определить прошел тест успешно или нет.

- Своевременность (Timely). Тесты должны создаваться своевременно. Несвоевременность написания тестов является главной причиной того, что они откладываются на потом, а это “потом” так никогда и не наступает. Даже если вы и не будете писать тесты перед кодом (хотя этот вариант уже доказал свою жизнеспособность) их нужно писать как минимум параллельно с кодом.


## Test Double - дубликат для тестирования, которое определяет объект для тестирования, дубликат для теста или просто "двойники". Это понятие имеет 5 типов:

- Фиктивные (Dummy) объекты передаются, но никогда не используются. Обычно они используются только для заполнения списков параметров.

- Поддельные (Fake) объекты на самом деле имеют рабочие реализации, но обычно используют какой-то ярлык, который делает их непригодными для производства (хорошим примером является база данных в памяти InMemory).

- Заглушки (Stubs) предоставляют готовые ответы на вызовы, сделанные во время теста, обычно вообще не реагируя ни на что, кроме того, что запрограммировано для теста.

- Шпионы (Spies) — это заглушки, которые также записывают некоторую информацию, основанную на том, как они были названы. Одной из форм этого может быть служба электронной почты, которая записывает, сколько сообщений было отправлено. Другими словами, это специальные Logger's.

- Макеты (Mocks) — это объекты, предварительно запрограммированные с ожиданиями, которые формируют спецификацию вызовов, которые они должны получать.
