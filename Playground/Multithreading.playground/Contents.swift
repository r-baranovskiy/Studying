import UIKit

/*
 Grand Central Dispatch (GCD)
 
 GCD - Низкоуровневое API для управления конкурентными операциями
 
 В iOS процесс или приложение состоит из одного или нескольких потоков.
 Потоки управляются независимо, этим занимается планировщик операционной системы. Каждый поток может выполняться конкурентно, но система решает будет ли он выполняться и как он будет выполняться.
 
 Одноядерные устройства могут обеспечить параллелизм посредством временного среза. Они будут запускать один поток, выполнять контекстный переключатель, а затем запускать другой поток
 
 
 Queues - Очереди
 
 GCD предоставляет нам механизм очередей, представленный в DispatchQueue. (Также существует OperationQueue и Operation, обычно используется в более сложных задачах по многопоточности)
 
 Очередь - это последовательность замыканий (closures), добавленных в очередь на выполнение.
 Различают два типа очередей: concurrent и serial.
 
 
 Queues Types
 
 Main - это главная очередь (serial) в приложении, все что связанно с UI ДОЛЖНО выполняться в этой очереди.
 
 Global - параллельные очереди, которые разделяются всей системой. Есть 4 таких очереди с разными приоритетами:
 high, default, low, background.
 
 Custom - создаваемые очереди, которые могут быть серийными или параллельными.
 
 
 
 Quality of Service (QoS) classes
 
 User-interactive - представляет собой задачи, которые необходимо выполнить немедленно, чтобы обеспечить приятный пользовательский интерфейс. Используется для обновления пользовательского интерфейса, обработки событий и небольших рабочих нагрузок, требующих низкой задержки. Общий объем работы, выполненной в этой очереди во время выполнения приложения, должен быть небольшим
 
 User-initiated - представляет собой задачи, которые инициируются из пользовательского интерфейса и могут выполняться асинхронно. Должно использоваться когда пользователь ждет немедленных результатов, необходимых для продолжения взаимодействия с пользователем.
 
 Utility - долгоиграющие задачи, обычно с индикатором прогресса, видимым пользователем. Используется для вычисления, ввода-вывода, сетей, непрерывных каналов передачи данных и аналогичных задач. Этот класс предназначен для обеспечения энергоэффективности.
 
 Background - задачи, о которых пользователь не знает. Используется для предварительной загрузки, обслуживания и других задач, которые не требуют взаимодействия с пользователем и не зависят от времени.
 */

/*

//MARK: - Получение очередей

let mainQueue = DispatchQueue.main
let backgroundQueue = DispatchQueue.global(qos: .default)
DispatchQoS.userInteractive
DispatchQoS.userInitiated
DispatchQoS.background
DispatchQoS.utility

//MARK: - Создание очередей

let serialQueue = DispatchQueue(label: "mySerialQueue")
let concurrentQueue = DispatchQueue(label: "myConcurrentQueue", attributes: .concurrent)

//MARK: - Synchronous and Asynchronous

DispatchQueue.main.async {
    print("Asynchronous")
}

DispatchQueue.main.sync {
    print("Synchronous")
}

 Добавление задачи на выполнение с задержкой

DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
    print("10 seconds")
}
 
*/

//MARK: - Пример частого использования

/*
Используем global очередь для загрузки данных, затем обновляем UI, на основе полученных данных

DispatchQueue.global(qos: .userInitiated).async {
    // Loading a lot of data
    DispatchQueue.main.async {
        // Update UI in main thread after loading
    }
}
*/

//MARK: - Practice

/*
DispatchQueue.global(qos: .userInitiated).async {
    for i in 1...20 {
        print("GL \(i)")
    }
}

print("End of task") // End of task, GL 1....
*/

//MARK: - Async

/*
DispatchQueue.global(qos: .userInitiated).async {
    for i in 1...100 {
        print("asyncUserInitiated \(i)")
    }
}

DispatchQueue.global(qos: .background).async {
    for i in 1...100 {
        print("asyncBackground \(i)")
    }
}

print("End of task") //End of task Background 1, UserInitiated 1, UserInitiated 2, Background 2, UserInitiated 3...
*/

//MARK: - Sync

/*
DispatchQueue.global(qos: .userInitiated).sync {
    for i in 1...100 {
        print("syncUserInitiated \(i)")
    }
}

DispatchQueue.global(qos: .background).sync {
    for i in 1...100 {
        print("syncBackground \(i)")
    }
}

print("End of task") // syncUserInitiated 1...100, syncBackground 1...100, End of task"
*/

//MARK: - myQueue

/*
let myQueue = DispatchQueue(label: "mySerialQueue")

for num in 1...100 {
    myQueue.async {
        print(num)
    }
}

print("End of task") // 1...100, End of task
*/


//MARK: - myQueueConcurrent

let myQueue = DispatchQueue(label: "mySerialQueueConcurrent", attributes: .concurrent)

for num in 1...1000 {
    myQueue.async {
        print(num)
    }
}

print("End of task") // 940, End of task, 1000, 942, 767...
