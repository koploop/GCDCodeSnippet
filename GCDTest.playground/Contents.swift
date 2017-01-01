//: Playground - noun: a place where people can play

/*
   _____                       __  __            _
  / ____|                     |  \/  |          (_)
 | (___  _   _ _ __   ___ _ __| \  / | __ _ _ __ _  ___
  \___ \| | | | '_ \ / _ \ '__| |\/| |/ _` | '__| |/ _ \
  ____) | |_| | |_) |  __/ |  | |  | | (_| | |  | | (_) |
 |_____/ \__,_| .__/ \___|_|  |_|  |_|\__,_|_|  |_|\___/
              | |
              |_|
 */

import UIKit
import Foundation

var str = "Hello, playground"

/*
  ____            _
 |  _ \          (_)
 | |_) | __ _ ___ _  ___
 |  _ < / _` / __| |/ __|
 | |_) | (_| \__ \ | (__
 |____/ \__,_|___/_|\___|
 */

// 创建一个串行队列
let serial_queue = DispatchQueue(label: "com.serial.queue")

// 创建一个并行队列
let concurrent_queue = DispatchQueue(label: "com.concurrent.queue", attributes: .concurrent)
/*
 * 这是Xcode会提示的初始化方法: DispatchQueue(label: , qos: , attributes: , autoreleaseFrequency: , target: )
 * 事实上,初始化方法中的五个参数并不是都需要的,当创建一个串行队列的时候,我们只需要一个参数label.
 * 而要指定为并行队列的时候,我们只需加上一个attributes参数即可😁
 */

// 获取全局队列
let globe_queue = DispatchQueue.global()
/*
 * 事实上,大多数时候都不需要我们自己手动创建队列.系统给我们提供了全局队列
 * 你照样可以指定全局队列的一些属性.
 * let globe_queue = DispatchQueue.global(qos: .userInitiated)
 */

// 获取主队列
let main_queue = DispatchQueue.main

/*
   ____  ____ ____    _____         _
  / ___|/ ___|  _ \  |_   _|__  ___| |_
 | |  _| |   | | | |   | |/ _ \/ __| __|
 | |_| | |___| |_| |   | |  __/\__ \ |_
  \____|\____|____/    |_|\___||___/\__|
 */

// 全局队列 + 异步任务
// End Here打印的时间随机. 打印的 i 的线程有多个
//print("Begin Here")
//for i in 0..<10 {
//    globe_queue.async {
//        sleep(UInt32(0.8))
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 Begin Here
 <NSThread: 0x6000002603c0>{number = 4, name = (null)} 0
 <NSThread: 0x600000261700>{number = 5, name = (null)} 1
 <NSThread: 0x6000002603c0>{number = 4, name = (null)} 2
 <NSThread: 0x6000002603c0>{number = 4, name = (null)} 3
 <NSThread: 0x600000261700>{number = 5, name = (null)} 4
 <NSThread: 0x600000261700>{number = 5, name = (null)} 5
 <NSThread: 0x600000262d00>{number = 6, name = (null)} 6
 <NSThread: 0x600000262d00>{number = 6, name = (null)} 7
 End Here
 <NSThread: 0x600000261700>{number = 5, name = (null)} 8
 <NSThread: 0x6000002603c0>{number = 4, name = (null)} 9
 */


// 全局队列 + 同步任务
// End Here最后打印.并且所有的 i 打印都在主线程顺序打印,没有开辟新的线程.
//print("Begin Here")
//for i in 0..<10 {
//    globe_queue.sync {
//        sleep(UInt32(0.8))
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 Begin Here
 <NSThread: 0x600000066780>{number = 1, name = main} 0
 <NSThread: 0x600000066780>{number = 1, name = main} 1
 <NSThread: 0x600000066780>{number = 1, name = main} 2
 <NSThread: 0x600000066780>{number = 1, name = main} 3
 <NSThread: 0x600000066780>{number = 1, name = main} 4
 <NSThread: 0x600000066780>{number = 1, name = main} 5
 <NSThread: 0x600000066780>{number = 1, name = main} 6
 <NSThread: 0x600000066780>{number = 1, name = main} 7
 <NSThread: 0x600000066780>{number = 1, name = main} 8
 <NSThread: 0x600000066780>{number = 1, name = main} 9
 End Here
 */


//同步队列 + 异步任务
//End Here打印时间随机. 可以看到系统只新开了一个新的线程,所有的 i 都在该线程顺序打印
//print("Begin Here")
//for i in 0..<10 {
//    serial_queue.async {
//        sleep(UInt32(0.8))
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 Begin Here
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 0
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 1
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 2
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 3
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 4
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 5
 End Here
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 6
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 7
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 8
 <NSThread: 0x60000006fc40>{number = 4, name = (null)} 9
 */


// 同步队列 + 同步任务
//print("Begin Here")
//for i in 0..<10 {
//    serial_queue.sync {
//        sleep(UInt32(0.8))
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 Begin Here
 <NSThread: 0x600000261180>{number = 1, name = main} 0
 <NSThread: 0x600000261180>{number = 1, name = main} 1
 <NSThread: 0x600000261180>{number = 1, name = main} 2
 <NSThread: 0x600000261180>{number = 1, name = main} 3
 <NSThread: 0x600000261180>{number = 1, name = main} 4
 <NSThread: 0x600000261180>{number = 1, name = main} 5
 <NSThread: 0x600000261180>{number = 1, name = main} 6
 <NSThread: 0x600000261180>{number = 1, name = main} 7
 <NSThread: 0x600000261180>{number = 1, name = main} 8
 <NSThread: 0x600000261180>{number = 1, name = main} 9
 End Here
 */


// 异步队列 + 异步任务
//print("Begin Here")
//for i in 0..<10 {
//    concurrent_queue.async {
//        sleep(UInt32(0.8))
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 Begin Here
 <NSThread: 0x604000075040>{number = 5, name = (null)} 1
 <NSThread: 0x600000074d40>{number = 4, name = (null)} 0
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 2
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 3
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 4
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 5
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 6
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 7
 End Here
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 8
 <NSThread: 0x604000074d40>{number = 6, name = (null)} 9
 */


// 异步队列 + 同步任务
//print("Begin Here")
//for i in 0..<10 {
//    concurrent_queue.sync {
//        sleep(UInt32(0.8))
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 Begin Here
 <NSThread: 0x60400006c080>{number = 1, name = main} 0
 <NSThread: 0x60400006c080>{number = 1, name = main} 1
 <NSThread: 0x60400006c080>{number = 1, name = main} 2
 <NSThread: 0x60400006c080>{number = 1, name = main} 3
 <NSThread: 0x60400006c080>{number = 1, name = main} 4
 <NSThread: 0x60400006c080>{number = 1, name = main} 5
 <NSThread: 0x60400006c080>{number = 1, name = main} 6
 <NSThread: 0x60400006c080>{number = 1, name = main} 7
 <NSThread: 0x60400006c080>{number = 1, name = main} 8
 <NSThread: 0x60400006c080>{number = 1, name = main} 9
 End Here
 */


// 主队列 + 异步执行
// 先执行了End Here, 循环会最后打印,因为主队列不允许新开线程,所有的任务都是在主线程执行的.
// 假如主线程此时有任务,则要等到主线程的任务完成后才会开始执行异步中的任务.
//print("Begin Here")
//for i in 0..<10 {
//    main_queue.async {
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 Begin Here
 End Here
 */


// 主队列 + 同步执行
// 这段代码如果运行会卡死,xcode因此报错.
// 因为主队列中只有一个主线程,同步任务会阻塞当前主线程,导致End Here 无法执行, 而End Here的执行又需要等待主线程空闲,所以造成了循环等待卡死.
//print("Begin Here")
//for i in 0..<10 {
//    main_queue.sync {
//        print(Thread.current, i)
//    }
//}
//print("End Here")
/*
 运行报错:
 error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)
 */


/*
 *   ______                           _
 *  |  ____|                         | |
 *  | |__  __  ____ _ _ __ ___  _ __ | | ___
 *  |  __| \ \/ / _` | '_ ` _ \| '_ \| |/ _ \
 *  | |____ >  < (_| | | | | | | |_) | |  __/
 *  |______/_/\_\__,_|_| |_| |_| .__/|_|\___|
 *                               | |
 *                               |_|
 */

// example 0x01
let concurrent_queue_1 = DispatchQueue(label: "com.concurrent.example1", attributes: .concurrent)
concurrent_queue_1.async {
    
    concurrent_queue_1.sync {
        sleep(UInt32(0.8))
        print("\(Thread.current), Task1 Run!")
    }
    
    concurrent_queue_1.async {
        print("\(Thread.current), Task2 Run!")
    }
    
    concurrent_queue_1.async {
        print("\(Thread.current), Task3 Run!")
    }
}
print("\(Thread.current), Task4 Run!")
/*
 <NSThread: 0x604000062f80>{number = 1, name = main}, Task4 Run!
 <NSThread: 0x60000006de00>{number = 4, name = (null)}, Task1 Run!
 <NSThread: 0x604000070240>{number = 5, name = (null)}, Task2 Run!
 <NSThread: 0x60000006de00>{number = 4, name = (null)}, Task3 Run!
 
 1. 最外层是并行队列, 所以可以开子线程, 因为是异步任务,所以铁定是在子线程(假定是002)中执行这些任务.这样一来,Task1, 2, 3都确定是在子线程.
 2. Task1处在并行队列, 有可能开子线程,也有可能不开, 再看Task1是同步任务,所以不会开子线程了,就是线程002上执行,并且后面的Task2, 3都要等待它完成.
 3. 在Task1执行完毕之后, Task2 和 Task3因为都是并行队列+异步任务,就在其他子线程中执行了,顺序也不定.
 4. 至于Task4, 执行顺序就不确定了,它并不受其他任务的干扰.

 */


