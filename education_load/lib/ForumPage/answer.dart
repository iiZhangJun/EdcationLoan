import 'package:flutter/material.dart';
import 'QuestionDetails.dart';

class answer extends StatefulWidget {
  @override
  _answerState createState() => _answerState();
}

class _answerState extends State<answer> {

  var question_list=[
    {
      "questioneName": "什么是JSON",
      "questionerName": "sunlum",
      "questionerPicture":"images/avatar1.jpeg",
      "readingNumber":"21",
      "answers":[
        {
          "answererName": "kk",
          "answererPicture":"images/avatar1.jpeg",
          "answerContents": "JSON (JavaScript Object Notation, JS 对象标记) 是一种轻量级的数据交换格式。它基于 ECMAScript (w3c制定的js规范)的一个子集，采用完全独立于编程语言的文本格式来存储和表示数据。简洁和清晰的层次结构使得 JSON 成为理想的数据交换语言。 易于人阅读和编写，同时也易于机器解析和生成，并有效地提升网络传输效率",
          "answerTime":"2019/8/30",
          "reviews":[
            {
              "reviewerName": "ring",
              "reviewerPicture":"images/avatar1.jpeg",
              "reviewContents": "受教了",
              "reviewTime":"2019/8/30",
              "praisePoints":"3",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
          ],
        },
        {
          "answererName": "smile",
          "answererPicture":"images/avatar2.png",
          "answerContents": " JSON概念很简单，JSON 是一种轻量级的数据格式，他基于 javascript 语法的子集，即数组和对象表示。由于使用的是 javascript 语法，因此JSON 定义可以包含在javascript 文件中，对其的访问无需通过基于 XML 的语言来额外解析。不过在使用 JSON 之前，很重要的一点是理解 javascript 中数组及对象字面量的特殊语法",
          "answerTime":"2019/8/31",
          "reviews":[
            {
              "reviewerName": "kk",
              "reviewerPicture":"images/avatar1.jpeg",
              "reviewContents": "受教了",
              "reviewTime":"2019/8/30",
              "praisePoints":"3",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
          ],
        },
      ]
    },
    {
      "questioneName": "什么是框架？框架的作用是什么",
      "questionerName": "zhasue",
      "questionerPicture":"images/avatar1.jpeg",
      "readingNumber":"34",
      "answers":[
        {
          "answererName": "kk",
          "answererPicture":"images/avatar1.jpeg",
          "answerContents": "框架就是一套规范。既然是规范，你使用这个框架就要遵守这个框架所规定的约束。在Java开发中，框架是用一套规则+一群jar包来表示的。框架不仅仅只完成这些简单的约束，更重要的是，框架为我们封装好了一些冗余，且重用率低的代码。并且使用反与动态代理机制，将代码实现了通用性。比如如果你说servlet开发，你需要在servlet获取表单的参数，每次都要获取很麻烦，而struts底层就使用反射机制和拦截器机制帮助我们获取表单的值，我们就不用每次都手写那些代码了，简化了开发，当然你必须遵守一些规定来配置。还有比如hibernate，它提供了一些通用性很强的对数据库的增删改差，如果你使用jdbc每次做一些简单的crud的时候都必须写sql，但使用hibernate就不需要这么麻烦了，直接save,update就可以了。。。当然，你还是要遵循其一些规范而配置。同理spring也是如此。",
          "answerTime":"2019/8/30",
          "reviews":[
            {
              "reviewerName": "kk",
              "reviewerPicture":"images/avatar1.jpeg",
              "reviewContents": "受教了",
              "reviewTime":"2019/8/30",
              "praisePoints":"3",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
          ],
        },
        {
          "answererName": "smile",
          "answererPicture":"images/avatar2.png",
          "answerContents": " 在编程领域，软件框架是指一种抽象形式，它提供了一个具有通用功能的软件，这些功能可以由使用者编写代码来有选择的进行更改，从而提供服务于特定应用的软件。软件框架提供了一种标准的方式来构建并部署应用",
          "answerTime":"2019/8/31",
          "reviews":[
            {
              "reviewerName": "kk",
              "reviewerPicture":"images/avatar1.jpeg",
              "reviewContents": "受教了",
              "reviewTime":"2019/8/30",
              "praisePoints":"3",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
            {
              "reviewerName": "smile",
              "reviewerPicture":"images/avatar2.png",
              "reviewContents": "非常有用",
              "reviewTime":"2019/8/31",
              "praisePoints":"5",
            },
          ],
        },
      ]
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: question_list.length,
        itemBuilder: (BuildContext context,int index){
          return Question(
            answers:question_list[index]["answers"],
            question_name: question_list[index]["questioneName"],
            questioner_name: question_list[index]["questionerName"],
            questioner_picture: question_list[index]["questionerPicture"],
            reading_number: question_list[index]["readingNumber"],
            answers_number: question_list[index]["answersNumber"],
          );
        },
      ),
    );
  }
}

class Question extends StatelessWidget {

  final answers;
  final question_name;
  final questioner_name;
  final questioner_picture;
  final questione_contents;
  final reading_number;
  final answers_number;

  Question({
    this.answers,
    this.answers_number,
    this.question_name,
    this.questione_contents,
    this.questioner_name,
    this.questioner_picture,
    this.reading_number,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) =>
                  QuestionDetails(
                    question_name: question_name,
                    answers: answers,
                  ))),
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Text(question_name,style: new TextStyle(fontSize: 17),),
                ],),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(answers[1]["answerContents"],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(color: Colors.black26),
                    ),
                  )
                ],),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(questioner_picture,width: 25.0,height: 25.0,),
                        ),
                        Padding(padding: EdgeInsets.all(3.0)),
                        Text(questioner_name,style: new TextStyle(fontSize: 16),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("阅读数"+ reading_number+" | 回答"+answers.length.toString(),style: new TextStyle(fontSize: 16),),
                        Padding(padding: EdgeInsets.all(3.0))
                      ],
                    )
                  ]),
            ),
            Container(height: 1.0,color: Colors.black12),
          ],),
      ),
    );
  }
}
