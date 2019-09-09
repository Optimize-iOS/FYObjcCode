# iOS 源码分析

[FYobjc-runtimeAnalysis](https://github.com/Optimize-iOS/FYObjcCode/tree/master/FYobjc-runtimeAnalysis) 是根据在 `github` 上的开源项目 `objc-runtime` 源代码的阅读。该项目是可以在 `Mac` 上运行，方便开发更容易的了解 `Runtime` 运行机制以及在实现过程中实现逻辑。

## 目前完成：

### 验证 **`+load`** 和 **`+initialize`** 如下特点实现逻辑：

#### **`+load`**

当类被引用进项目的时候就会执行load函数(在main函数开始执行之前）,与这个类是否被用到无关,每个类的load函数只会自动调用一次.由于load函数是系统自动加载的，因此不需要再调用[super load]，否则父类的load函数会多次执行。

> 1.当父类和子类都实现load函数时,父类的load方法执行顺序要优先于子类    
2.当一个类未实现load方法时,不会调用父类load方法    
3.类中的load方法执行顺序要优先于类别(Category)     
4.当有多个类别(Category)都实现了load方法,这几个load方法都会执行,但执行顺序不确定(其执行顺序与类别在Compile Sources中出现的顺序一致)    
5.当然当有多个不同的类的时候,每个类load 执行顺序与其在Compile Sources出现的顺序一致。

#### **`+ initialize `**

initialize在类或者其子类的第一个方法被调用前调用。即使类文件被引用进项目,但是没有使用,initialize不会被调用。由于是系统自动调用，也不需要显式的调用父类的initialize，否则父类的initialize会被多次执行。假如这个类放到代码中，而这段代码并没有被执行，这个函数是不会被执行的。

>1.父类的initialize方法会比子类先执行    
2.当子类不实现initialize方法，会把父类的实现继承过来调用一遍。在此之前，父类的方法会被优先调用一次    
3.当有多个Category都实现了initialize方法,会覆盖类中的方法,只执行一个(会执行Compile Sources 列表中最后一个Category 的initialize方法)   

**具体分析可以参考备注**   
[+load 在 main 函数之前实现调用原理和在 +load 子类、父类和分类调用实现。](https://github.com/Optimize-iOS/FYObjcCode/commit/aa4ec9d6c9ec1b976a7bf04735abea71cae065d2)     
[+ initialize 在收到 msg_objcSend 调用方式](https://github.com/Optimize-iOS/FYObjcCode/commit/891b00fc73e2da1cb0c09f1d1e5fb926dbd7f2b4)


