library(shiny)
shinyServer(function(input, output, session) {
  
  observe({
    ###########头部#################
    head_1 <- input$head1
  if (head_1 == "燕影之无极冠"){
    updateSelectInput(session, "head2_1",choices = c("回避","会心","命中","重击"))
    updateSelectInput(session, "head2_2",choices = c("抗性","技能状态命中力"))
    updateSelectInput(session, "head2_3",choices = c("神明","疾语","人祸"))
    observe({
      headx <- input$head2_1
      heady <- input$head2_2
      headz <- input$head2_3
      if (headx == "重击"){
        if (heady == "抗性"){
          updateSelectInput(session, "head4", choices = c("无","阴伤","毒重","身法","坚韧","定力","生命值","物防","法防"))
        } else {
          updateSelectInput(session, "head4", choices = c("无","阴伤","毒重","生命值","物防","法防"))
        } 
      } else {
        if (heady == "抗性"){
          updateSelectInput(session, "head4", choices = c("无",headx,"身法","坚韧","定力","生命值","物防","法防"))
        } else {
          updateSelectInput(session, "head4", choices = c("无",headx,"生命值","物防","法防"))
        }
      }
    })
  } else {
    updateSelectInput(session, "head2_1",choices = "无")
    updateSelectInput(session, "head2_2",choices = "无")
    updateSelectInput(session, "head2_3",choices = "无")
    if (head_1 == "妙手之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","念","疾","体","物防","法防"))
    }
    if (head_1 == "龙卷之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","敏","魂","体","附风","风重","物防","法防"))
    }
    if (head_1 == "元破之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","念","疾","体","附元","生命值","物防","法防"))
    }
    if (head_1 == "闇火之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","念","魂","体","附火","火重","物防","法防"))
    }
    if (head_1 == "轻焰之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","敏","魂","疾","附火","会心","物防","法防"))
    }
    if (head_1 == "罂散之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","敏","魂","疾","附毒","毒重","物防","法防"))
    }
    if (head_1 == "浩风之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","力","疾","白刃","物防","法防"))
    }
    if (head_1 == "寒雨之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","力","疾","附水","白刃","物防","法防"))
    }
    if (head_1 == "沉忧之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","魂","念","疾","体","附水","物防","法防"))
    }
    if (head_1 == "混元之古始冠"){
      updateSelectInput(session, "head4", choices = c("无","敏","魂","疾","附元","会心","物防","法防"))
    }
    if (head_1 == "紫陌冠·玄"){
      updateSelectInput(session, "head4", choices = c("无","命中","生命值","毒重","阴伤","物防","法防"))
      updateSelectInput(session, "head_zuan1", choices = c(0:19))
    }
    if (head_1 == "紫陌冠·素"){
      updateSelectInput(session, "head4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","物防","法防"))
      updateSelectInput(session, "head_zuan1", choices = c(0:19))
    }
    if (head_1 == "蓝沁冠"){
      updateSelectInput(session, "head4", choices = c("无","念","疾","体","物防","法防"))
      updateSelectInput(session, "head_zuan1", choices = c(0:19))
    }
    if (head_1 == "秋水落霞冠"){
      updateSelectInput(session, "head4", choices = c("无"))
      updateSelectInput(session, "head_zuan1", choices = c(0:15))
    }
    if (head_1 == "长天孤鹜冠"){
      updateSelectInput(session, "head4", choices = c("无"))
      updateSelectInput(session, "head_zuan1", choices = c(0:15))
    }
    if (head_1 == "上净云水冠"){
      updateSelectInput(session, "head4", choices = c("无"))
      updateSelectInput(session, "head_zuan1", choices = c(0:15))
    }
  }
    #################肩膀#################
    shoulder_1 <- input$shoulder1
    if (shoulder_1 == "燕影之无极肩"){
      updateSelectInput(session, "shoulder2_1",choices = c("回避","会心","命中","重击"))
      updateSelectInput(session, "shoulder2_2",choices = c("抗性","技能状态命中力"))
      updateSelectInput(session, "shoulder2_3",choices = c("神明","疾语","人祸"))
      observe({
        shoulderx <- input$shoulder2_1
        shouldery <- input$shoulder2_2
        shoulderz <- input$shoulder2_3
        if (shoulderx == "重击"){
          if (shouldery == "抗性"){
            updateSelectInput(session, "shoulder4", choices = c("无","阴伤","毒重","身法","坚韧","定力","生命值","物防","法防"))
          } else {
            updateSelectInput(session, "shoulder4", choices = c("无","阴伤","毒重","生命值","物防","法防"))
          } 
        } else {
          if (shouldery == "抗性"){
            updateSelectInput(session, "shoulder4", choices = c("无",shoulderx,"身法","坚韧","定力","生命值","物防","法防"))
          } else {
            updateSelectInput(session, "shoulder4", choices = c("无",shoulderx,"生命值","物防","法防"))
          }
        }
      })
    } else {
      updateSelectInput(session, "shoulder2_1",choices = "无")
      updateSelectInput(session, "shoulder2_2",choices = "无")
      updateSelectInput(session, "shoulder2_3",choices = "无")
      if (shoulder_1 == "妙手之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","念","疾","体","物防","法防"))
      }
      if (shoulder_1 == "龙卷之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","敏","魂","体","附风","风重","物防","法防"))
      }
      if (shoulder_1 == "元破之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","念","疾","体","附元","生命值","物防","法防"))
      }
      if (shoulder_1 == "闇火之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","念","魂","体","附火","火重","物防","法防"))
      }
      if (shoulder_1 == "轻焰之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","敏","魂","疾","附火","会心","物防","法防"))
      }
      if (shoulder_1 == "罂散之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","敏","魂","疾","附毒","毒重","物防","法防"))
      }
      if (shoulder_1 == "浩风之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","力","疾","白刃","物防","法防"))
      }
      if (shoulder_1 == "寒雨之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","力","疾","附水","白刃","物防","法防"))
      }
      if (shoulder_1 == "沉忧之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","魂","念","疾","体","附水","物防","法防"))
      }
      if (shoulder_1 == "混元之古始肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","敏","魂","疾","附元","会心","物防","法防"))
      }
      if (shoulder_1 == "紫陌肩·玄"){
        updateSelectInput(session, "shoulder4", choices = c("无","命中","生命值","毒重","阴伤","物防","法防"))
        updateSelectInput(session, "shoulder_zuan1", choices = c(0:19))
      }
      if (shoulder_1 == "紫陌肩·素"){
        updateSelectInput(session, "shoulder4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","物防","法防"))
        updateSelectInput(session, "shoulder_zuan1", choices = c(0:19))
      }
      if (shoulder_1 == "蓝沁肩"){
        updateSelectInput(session, "shoulder4", choices = c("无","敏","念","疾","体","物防","法防"))
        updateSelectInput(session, "shoulder_zuan1", choices = c(0:19))
      }
      if (shoulder_1 == "秋水落霞肩"){
        updateSelectInput(session, "shoulder4", choices = c("无"))
        updateSelectInput(session, "shoulder_zuan1", choices = c(0:15))
      }
      if (shoulder_1 == "长天孤鹜肩"){
        updateSelectInput(session, "shoulder4", choices = c("无"))
        updateSelectInput(session, "shoulder_zuan1", choices = c(0:15))
      }
      if (shoulder_1 == "上净云水肩"){
        updateSelectInput(session, "shoulder4", choices = c("无"))
        updateSelectInput(session, "shoulder_zuan1", choices = c(0:15))
      }
    }
    #################袍#################
    clothes_1 <- input$clothes1
    if (clothes_1 == "燕影之无极袍"){
      updateSelectInput(session, "clothes2_1",choices = c("回避","会心","命中","重击"))
      updateSelectInput(session, "clothes2_2",choices = c("抗性","技能状态命中力"))
      updateSelectInput(session, "clothes2_3",choices = c("神明","疾语","人祸"))
      observe({
        clothesx <- input$clothes2_1
        clothesy <- input$clothes2_2
        clothesz <- input$clothes2_3
        if (clothesx == "重击"){
          if (clothesy == "抗性"){
            updateSelectInput(session, "clothes4", choices = c("无","回避","阴伤","毒重","身法","坚韧","定力","生命值","物防","法防"))
          } else {
            updateSelectInput(session, "clothes4", choices = c("无","回避","阴伤","毒重","生命值","物防","法防"))
          } 
        } else {
          if (clothesy == "抗性"){
            updateSelectInput(session, "clothes4", choices = unique(c("无",clothesx,"回避","身法","坚韧","定力","生命值","物防","法防")))
          } else {
            updateSelectInput(session, "clothes4", choices = unique(c("无",clothesx,"回避","生命值","物防","法防")))
          }
        }
      })
    } else {
      updateSelectInput(session, "clothes2_1",choices = "无")
      updateSelectInput(session, "clothes2_2",choices = "无")
      updateSelectInput(session, "clothes2_3",choices = "无")
      if (clothes_1 == "妙手之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","念","疾","体","物防","法防"))
      }
      if (clothes_1 == "龙卷之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","敏","魂","体","附风","风重","物防","法防"))
      }
      if (clothes_1 == "元破之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","念","疾","体","附元","生命值","物防","法防"))
      }
      if (clothes_1 == "闇火之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","念","魂","体","附火","火重","物防","法防"))
      }
      if (clothes_1 == "轻焰之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","敏","魂","疾","附火","会心","物防","法防"))
      }
      if (clothes_1 == "罂散之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","敏","魂","疾","附毒","毒重","物防","法防"))
      }
      if (clothes_1 == "浩风之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","力","疾","白刃","物防","法防"))
      }
      if (clothes_1 == "寒雨之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","力","疾","附水","白刃","物防","法防"))
      }
      if (clothes_1 == "沉忧之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","魂","念","疾","体","附水","物防","法防"))
      }
      if (clothes_1 == "混元之古始袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","敏","魂","疾","附元","会心","物防","法防"))
      }
      if (clothes_1 == "紫陌袍·玄"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","命中","生命值","毒重","阴伤","物防","法防"))
        updateSelectInput(session, "clothes_zuan1", choices = c(0:19))
      }
      if (clothes_1 == "紫陌袍·素"){
        updateSelectInput(session, "clothes4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","物防","法防"))
        updateSelectInput(session, "clothes_zuan1", choices = c(0:19))
      }
      if (clothes_1 == "蓝沁袍"){
        updateSelectInput(session, "clothes4", choices = c("无","回避","敏","念","魂","力","体","物防","法防"))
        updateSelectInput(session, "clothes_zuan1", choices = c(0:19))
      }
      if (clothes_1 == "秋水落霞袍"){
        updateSelectInput(session, "clothes4", choices = c("无"))
        updateSelectInput(session, "clothes_zuan1", choices = c(0:15))
      }
      if (clothes_1 == "长天孤鹜袍"){
        updateSelectInput(session, "clothes4", choices = c("无"))
        updateSelectInput(session, "clothes_zuan1", choices = c(0:15))
      }
      if (clothes_1 == "上净云水袍"){
        updateSelectInput(session, "clothes4", choices = c("无"))
        updateSelectInput(session, "clothes_zuan1", choices = c(0:15))
      }
    }
    ###########腰带#################
    belt_1 <- input$belt1
    if (belt_1 == "燕影之无极带"){
      updateSelectInput(session, "belt2_1",choices = c("回避","会心","命中","重击"))
      updateSelectInput(session, "belt2_2",choices = c("抗性","技能状态命中力"))
      updateSelectInput(session, "belt2_3",choices = c("神明","疾语","人祸"))
      observe({
        beltx <- input$belt2_1
        belty <- input$belt2_2
        beltz <- input$belt2_3
        if (beltx == "重击"){
          if (belty == "抗性"){
            updateSelectInput(session, "belt4", choices = c("无","阴伤","毒重","身法","坚韧","定力","生命值","物防"))
          } else {
            updateSelectInput(session, "belt4", choices = c("无","阴伤","毒重","生命值","物防"))
          } 
        } else {
          if (belty == "抗性"){
            updateSelectInput(session, "belt4", choices = c("无",beltx,"身法","坚韧","定力","生命值","物防"))
          } else {
            updateSelectInput(session, "belt4", choices = c("无",beltx,"生命值","物防"))
          }
        }
      })
    } else {
      updateSelectInput(session, "belt2_1",choices = "无")
      updateSelectInput(session, "belt2_2",choices = "无")
      updateSelectInput(session, "belt2_3",choices = "无")
      if (belt_1 == "妙手之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","念","疾","体","物防"))
      }
      if (belt_1 == "龙卷之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","敏","魂","体","附风","风重","物防"))
      }
      if (belt_1 == "元破之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","念","疾","体","附元","生命值","物防"))
      }
      if (belt_1 == "闇火之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","念","魂","体","附火","火重","物防"))
      }
      if (belt_1 == "轻焰之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","敏","魂","疾","附火","会心","物防"))
      }
      if (belt_1 == "罂散之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","敏","魂","疾","附毒","毒重","物防"))
      }
      if (belt_1 == "浩风之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","力","疾","白刃","物防"))
      }
      if (belt_1 == "寒雨之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","力","疾","附水","白刃","物防"))
      }
      if (belt_1 == "沉忧之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","魂","念","疾","体","附水","物防"))
      }
      if (belt_1 == "混元之古始带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","敏","魂","疾","附元","会心","物防"))
      }
      if (belt_1 == "紫陌带·玄"){
        updateSelectInput(session, "belt4", choices = c("无","命中","生命值","毒重","阴伤","物防"))
        updateSelectInput(session, "belt_zuan1", choices = c(0:19))
      }
      if (belt_1 == "紫陌带·素"){
        updateSelectInput(session, "belt4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","物防"))
        updateSelectInput(session, "belt_zuan1", choices = c(0:19))
      }
      if (belt_1 == "蓝沁带"){
        updateSelectInput(session, "belt4", choices = c("无","生命值","魂","念","疾","体","物防"))
        updateSelectInput(session, "belt_zuan1", choices = c(0:19))
      }
      if (belt_1 == "秋水落霞带"){
        updateSelectInput(session, "belt4", choices = c("无"))
        updateSelectInput(session, "belt_zuan1", choices = c(0:15))
      }
      if (belt_1 == "长天孤鹜带"){
        updateSelectInput(session, "belt4", choices = c("无"))
        updateSelectInput(session, "belt_zuan1", choices = c(0:15))
      }
      if (belt_1 == "上净云水带"){
        updateSelectInput(session, "belt4", choices = c("无"))
        updateSelectInput(session, "belt_zuan1", choices = c(0:15))
      }
    }
    #################长裤#################
    pant_1 <- input$pant1
    if (pant_1 == "燕影之无极长裤"){
      updateSelectInput(session, "pant2_1",choices = c("回避","会心","命中","重击"))
      updateSelectInput(session, "pant2_2",choices = c("抗性","技能状态命中力"))
      updateSelectInput(session, "pant2_3",choices = c("神明","疾语","人祸"))
      observe({
        pantx <- input$pant2_1
        panty <- input$pant2_2
        pantz <- input$pant2_3
        if (pantx == "重击"){
          if (panty == "抗性"){
            updateSelectInput(session, "pant4", choices = c("无","回避","阴伤","毒重","身法","坚韧","定力","生命值","物防"))
          } else {
            updateSelectInput(session, "pant4", choices = c("无","回避","阴伤","毒重","生命值","物防"))
          } 
        } else {
          if (panty == "抗性"){
            updateSelectInput(session, "pant4", choices = unique(c("无",pantx,"回避","身法","坚韧","定力","生命值","物防")))
          } else {
            updateSelectInput(session, "pant4", choices = unique(c("无",pantx,"回避","生命值","物防")))
          }
        }
      })
    } else {
      updateSelectInput(session, "pant2_1",choices = "无")
      updateSelectInput(session, "pant2_2",choices = "无")
      updateSelectInput(session, "pant2_3",choices = "无")
      if (pant_1 == "妙手之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","念","疾","体","物防"))
      }
      if (pant_1 == "龙卷之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","敏","魂","体","附风","风重","物防"))
      }
      if (pant_1 == "元破之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","念","疾","体","附元","生命值","物防"))
      }
      if (pant_1 == "闇火之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","念","魂","体","附火","火重","物防"))
      }
      if (pant_1 == "轻焰之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","敏","魂","疾","附火","会心","物防"))
      }
      if (pant_1 == "罂散之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","敏","魂","疾","附毒","毒重","物防"))
      }
      if (pant_1 == "浩风之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","力","疾","白刃","物防"))
      }
      if (pant_1 == "寒雨之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","力","疾","附水","白刃","物防"))
      }
      if (pant_1 == "沉忧之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","魂","念","疾","体","附水","物防"))
      }
      if (pant_1 == "混元之古始长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","敏","魂","疾","附元","会心","物防"))
      }
      if (pant_1 == "紫陌长裤·玄"){
        updateSelectInput(session, "pant4", choices = c("无","回避","命中","生命值","毒重","阴伤","物防"))
        updateSelectInput(session, "pant_zuan1", choices = c(0:19))
      }
      if (pant_1 == "紫陌长裤·素"){
        updateSelectInput(session, "pant4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","物防"))
        updateSelectInput(session, "pant_zuan1", choices = c(0:19))
      }
      if (pant_1 == "蓝沁长裤"){
        updateSelectInput(session, "pant4", choices = c("无","回避","敏","念","疾","体","物防"))
        updateSelectInput(session, "pant_zuan1", choices = c(0:19))
      }
      if (pant_1 == "秋水落霞长裤"){
        updateSelectInput(session, "pant4", choices = c("无"))
        updateSelectInput(session, "pant_zuan1", choices = c(0:15))
      }
      if (pant_1 == "长天孤鹜长裤"){
        updateSelectInput(session, "pant4", choices = c("无"))
        updateSelectInput(session, "pant_zuan1", choices = c(0:15))
      }
      if (pant_1 == "上净云水长裤"){
        updateSelectInput(session, "pant4", choices = c("无"))
        updateSelectInput(session, "pant_zuan1", choices = c(0:15))
      }
    }
    #################摆#################
    short_1 <- input$short1
    if (short_1 == "燕影之无极摆"){
      updateSelectInput(session, "short2_1",choices = c("回避","会心","命中","重击"))
      updateSelectInput(session, "short2_2",choices = c("抗性","技能状态命中力"))
      updateSelectInput(session, "short2_3",choices = c("神明","疾语","人祸"))
      observe({
        shortx <- input$short2_1
        shorty <- input$short2_2
        shortz <- input$short2_3
        if (shortx == "重击"){
          if (shorty == "抗性"){
            updateSelectInput(session, "short4", choices = c("无","回避","阴伤","毒重","身法","坚韧","定力","生命值","法防"))
          } else {
            updateSelectInput(session, "short4", choices = c("无","回避","阴伤","毒重","生命值","法防"))
          } 
        } else {
          if (shorty == "抗性"){
            updateSelectInput(session, "short4", choices = unique(c("无",shortx,"回避","身法","坚韧","定力","生命值","法防")))
          } else {
            updateSelectInput(session, "short4", choices = unique(c("无",shortx,"回避","生命值","法防")))
          }
        }
      })
    } else {
      updateSelectInput(session, "short2_1",choices = "无")
      updateSelectInput(session, "short2_2",choices = "无")
      updateSelectInput(session, "short2_3",choices = "无")
      if (short_1 == "妙手之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","念","疾","体","法防"))
      }
      if (short_1 == "龙卷之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","敏","魂","体","附风","风重","法防"))
      }
      if (short_1 == "元破之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","念","疾","体","附元","生命值","法防"))
      }
      if (short_1 == "闇火之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","念","魂","体","附火","火重","法防"))
      }
      if (short_1 == "轻焰之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","敏","魂","疾","附火","会心","法防"))
      }
      if (short_1 == "罂散之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","敏","魂","疾","附毒","毒重","法防"))
      }
      if (short_1 == "浩风之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","力","疾","白刃","物防","法防"))
      }
      if (short_1 == "寒雨之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","力","疾","附水","白刃","法防"))
      }
      if (short_1 == "沉忧之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","魂","念","疾","体","附水","法防"))
      }
      if (short_1 == "混元之古始摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","敏","魂","疾","附元","会心","法防"))
      }
      if (short_1 == "紫陌摆·玄"){
        updateSelectInput(session, "short4", choices = c("无","回避","命中","生命值","毒重","阴伤","法防"))
        updateSelectInput(session, "short_zuan1", choices = c(0:19))
      }
      if (short_1 == "紫陌摆·素"){
        updateSelectInput(session, "short4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","法防"))
        updateSelectInput(session, "short_zuan1", choices = c(0:19))
      }
      if (short_1 == "蓝沁摆"){
        updateSelectInput(session, "short4", choices = c("无","回避","敏","念","疾","体","法防"))
        updateSelectInput(session, "short_zuan1", choices = c(0:19))
      }
      if (short_1 == "秋水落霞摆"){
        updateSelectInput(session, "short4", choices = c("无"))
        updateSelectInput(session, "short_zuan1", choices = c(0:15))
      }
      if (short_1 == "长天孤鹜摆"){
        updateSelectInput(session, "short4", choices = c("无"))
        updateSelectInput(session, "short_zuan1", choices = c(0:15))
      }
      if (short_1 == "上净云水摆"){
        updateSelectInput(session, "short4", choices = c("无"))
        updateSelectInput(session, "short_zuan1", choices = c(0:15))
      }
    }
    #################腕#################
    arm_1 <- input$arm1
    if (arm_1 == "燕影之无极腕"){
      updateSelectInput(session, "arm2_1",choices = c("回避","会心","命中","重击"))
      updateSelectInput(session, "arm2_2",choices = c("抗性","技能状态命中力"))
      updateSelectInput(session, "arm2_3",choices = c("神明","疾语","人祸"))
      observe({
        armx <- input$arm2_1
        army <- input$arm2_2
        armz <- input$arm2_3
        if (armx == "重击"){
          if (army == "抗性"){
            updateSelectInput(session, "arm4", choices = c("无","命中","阴伤","毒重","身法","坚韧","定力","生命值","会心"))
          } else {
            updateSelectInput(session, "arm4", choices = c("无","命中","阴伤","毒重","生命值","会心"))
          } 
        } else {
          if (army == "抗性"){
            updateSelectInput(session, "arm4", choices = unique(c("无",armx,"命中","身法","坚韧","定力","生命值","会心")))
          } else {
            updateSelectInput(session, "arm4", choices = unique(c("无",armx,"命中","生命值","会心")))
          }
        }
      })
    } else {
      updateSelectInput(session, "arm2_1",choices = "无")
      updateSelectInput(session, "arm2_2",choices = "无")
      updateSelectInput(session, "arm2_3",choices = "无")
      if (arm_1 == "妙手之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","念","疾","体","会心"))
      }
      if (arm_1 == "龙卷之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","敏","魂","体","附风","风重","会心"))
      }
      if (arm_1 == "元破之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","念","疾","体","附元","生命值","会心"))
      }
      if (arm_1 == "闇火之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","念","魂","体","附火","火重","会心"))
      }
      if (arm_1 == "轻焰之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","敏","魂","疾","附火","会心"))
      }
      if (arm_1 == "罂散之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","敏","魂","疾","附毒","毒重","会心"))
      }
      if (arm_1 == "浩风之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","力","疾","白刃","会心","物防"))
      }
      if (arm_1 == "寒雨之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","力","疾","附水","白刃","会心"))
      }
      if (arm_1 == "沉忧之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","魂","念","疾","体","附水","会心"))
      }
      if (arm_1 == "混元之古始腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","敏","魂","疾","附元","会心"))
      }
      if (arm_1 == "紫陌腕·玄"){
        updateSelectInput(session, "arm4", choices = c("无","命中","命中","生命值","毒重","阴伤"))
        updateSelectInput(session, "arm_zuan1", choices = c(0:19))
      }
      if (arm_1 == "紫陌腕·素"){
        updateSelectInput(session, "arm4", choices = c("无","会心","命中","身法","坚韧","定力","生命值"))
        updateSelectInput(session, "arm_zuan1", choices = c(0:19))
      }
      if (arm_1 == "蓝沁腕"){
        updateSelectInput(session, "arm4", choices = c("无","命中","魂","念","力","体","会心"))
        updateSelectInput(session, "arm_zuan1", choices = c(0:19))
      }
      if (arm_1 == "秋水落霞腕"){
        updateSelectInput(session, "arm4", choices = c("无"))
        updateSelectInput(session, "arm_zuan1", choices = c(0:15))
      }
      if (arm_1 == "长天孤鹜腕"){
        updateSelectInput(session, "arm4", choices = c("无"))
        updateSelectInput(session, "arm_zuan1", choices = c(0:15))
      }
      if (arm_1 == "上净云水腕"){
        updateSelectInput(session, "arm4", choices = c("无"))
        updateSelectInput(session, "arm_zuan1", choices = c(0:15))
      }
    } 
    #################履#################
    shoes_1 <- input$shoes1
    if (shoes_1 == "燕影之无极履"){
      updateSelectInput(session, "shoes2_1",choices = c("回避","会心","命中","重击"))
      updateSelectInput(session, "shoes2_2",choices = c("抗性","技能状态命中力"))
      updateSelectInput(session, "shoes2_3",choices = c("神明","疾语","人祸"))
      observe({
        shoesx <- input$shoes2_1
        shoesy <- input$shoes2_2
        shoesz <- input$shoes2_3
        if (shoesx == "重击"){
          if (shoesy == "抗性"){
            updateSelectInput(session, "shoes4", choices = c("无","回避","阴伤","毒重","身法","坚韧","定力","生命值","法防"))
          } else {
            updateSelectInput(session, "shoes4", choices = c("无","回避","阴伤","毒重","生命值","法防"))
          } 
        } else {
          if (shoesy == "抗性"){
            updateSelectInput(session, "shoes4", choices = unique(c("无",shoesx,"回避","身法","坚韧","定力","生命值","法防")))
          } else {
            updateSelectInput(session, "shoes4", choices = unique(c("无",shoesx,"回避","生命值","法防")))
          }
        }
      })
    } else {
      updateSelectInput(session, "shoes2_1",choices = "无")
      updateSelectInput(session, "shoes2_2",choices = "无")
      updateSelectInput(session, "shoes2_3",choices = "无")
      if (shoes_1 == "妙手之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","念","疾","体","法防"))
      }
      if (shoes_1 == "龙卷之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","敏","魂","体","附风","风重","法防"))
      }
      if (shoes_1 == "元破之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","念","疾","体","附元","生命值","法防"))
      }
      if (shoes_1 == "闇火之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","念","魂","体","附火","火重","法防"))
      }
      if (shoes_1 == "轻焰之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","敏","魂","疾","附火","会心","法防"))
      }
      if (shoes_1 == "罂散之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","敏","魂","疾","附毒","毒重","法防"))
      }
      if (shoes_1 == "浩风之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","力","疾","白刃","物防","法防"))
      }
      if (shoes_1 == "寒雨之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","力","疾","附水","白刃","法防"))
      }
      if (shoes_1 == "沉忧之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","魂","念","疾","体","附水","法防"))
      }
      if (shoes_1 == "混元之古始履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","敏","魂","疾","附元","会心","法防"))
      }
      if (shoes_1 == "紫陌履·玄"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","命中","生命值","毒重","阴伤","法防"))
        updateSelectInput(session, "shoes_zuan1", choices = c(0:19))
      }
      if (shoes_1 == "紫陌履·素"){
        updateSelectInput(session, "shoes4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","法防"))
        updateSelectInput(session, "shoes_zuan1", choices = c(0:19))
      }
      if (shoes_1 == "蓝沁履"){
        updateSelectInput(session, "shoes4", choices = c("无","回避","敏","念","疾","体","法防"))
        updateSelectInput(session, "shoes_zuan1", choices = c(0:19))
      }
      if (shoes_1 == "秋水落霞履"){
        updateSelectInput(session, "shoes4", choices = c("无"))
        updateSelectInput(session, "shoes_zuan1", choices = c(0:15))
      }
      if (shoes_1 == "长天孤鹜履"){
        updateSelectInput(session, "shoes4", choices = c("无"))
        updateSelectInput(session, "shoes_zuan1", choices = c(0:15))
      }
      if (shoes_1 == "上净云水履"){
        updateSelectInput(session, "shoes4", choices = c("无"))
        updateSelectInput(session, "shoes_zuan1", choices = c(0:15))
      }
    } 
    
})
  bang <- reactive({
    names <- c("生命值","技力值","力","魂","体","敏","疾","念","最小物攻","最大物攻","最小法攻",
               "最大法攻","物防","法防","命中","会心","附火","附水","附元","附风","附毒",
               "白刃","阴伤","崩击","水重","火重","风重",
               "元重","毒重","挥砍化解","钝系化解","穿刺化解","身法","坚韧","定力",
               "火系化解","水系化解","风系化解","元系化解","毒系化解",
               "诛心","御心","万钧","铁壁","人祸","疾语",
               "追电","神明","明思","回避","知彼")
    value <- rep(0,length(names))
    data <- data.frame(names,value)
    data[data[,1] == "念",2] <- 36
    data[data[,1] == "魂",2] <- 21
    data[data[,1] == "体",2] <- 14
    data[data[,1] == "力",2] <- 14
    data[data[,1] == "疾",2] <- 13
    data[data[,1] == "敏",2] <- 13
    data[data[,1] == "生命值",2] <- 9724
    data[data[,1] == "技力值",2] <- 1952
    data[data[,1] == "最小物攻",2] <- 105
    data[data[,1] == "最小法攻",2] <- 158
    if (input$base == "无"){
      data <- data
    } else {
      data[data[,1] == input$base,2] <- data[data[,1] == input$base,2] + 273
    }
    if (input$chengwei == "无"){
      data <- data
    }
    if (input$chengwei == "立悯常所慈"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 10
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 300
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 80
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 80
    }
    if (input$chengwei == "立才常所傲"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 10
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 300
      data[data[,1] == "最大物攻",2] <- data[data[,1] == "最大物攻",2] + 40
      data[data[,1] == "最小物攻",2] <- data[data[,1] == "最小物攻",2] + 70
    }
    if (input$chengwei == "立智常所明"){
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 10
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 300
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 40
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 70
    }
    ########头部###################
    if (input$head1 == "妙手之古始冠"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 40
    }
    if (input$head1 == "龙卷之古始冠"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 14 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "元破之古始冠"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 405 + 7*as.numeric(input$head_zuan1)
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$head1 == "闇火之古始冠"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 14 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "轻焰之古始冠"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 14 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "罂散之古始冠"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 14 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "浩风之古始冠"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 322 + 6*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$head1 == "寒雨之古始冠"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 40
    }
    if (input$head1 == "沉忧之古始冠"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 33
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "混元之古始冠"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 160 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 14 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "紫陌冠·玄"){
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 19 + as.numeric(input$head_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 255 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 21 + as.numeric(input$head_zuan1)
      data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 21 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 143 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 216 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 27
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
    }
    if (input$head1 == "紫陌冠·素"){
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 54 + as.numeric(input$head_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 255 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 19 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 143 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 216 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 19 + as.numeric(input$head_zuan1)
      data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 27 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "蓝沁冠"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 16 + as.numeric(input$head_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 32 + as.numeric(input$head_zuan1)
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 143 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 216 + 4*as.numeric(input$head_zuan1)
    }
    if (input$head1 == "秋水落霞冠"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$head_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 14 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 16 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 217 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 234 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 102 + 2*as.numeric(input$head_zuan1)
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
    }
    if (input$head1 == "长天孤鹜冠"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 16 + as.numeric(input$head_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 155 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 234 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 12 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "上净云水冠"){
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 13 + as.numeric(input$head_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 101 + 2*as.numeric(input$head_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 12 + as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 211 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 212 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 21
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 11 + as.numeric(input$head_zuan1)
    }
    if (input$head1 == "燕影之无极冠"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 253 + 5*as.numeric(input$head_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 153 + 3*as.numeric(input$head_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 231 + 4*as.numeric(input$head_zuan1)
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
      if (input$head2_1 == "重击"){
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 21 + as.numeric(input$head_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 21 + as.numeric(input$head_zuan1)
      }
      if (input$head2_1 == "回避"){
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 71 + 2*as.numeric(input$head_zuan1)
      }
      if (input$head2_1 == "命中"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 57 + as.numeric(input$head_zuan1)
      }
      if (input$head2_1 == "会心"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 42 + as.numeric(input$head_zuan1)
      }
      if (input$head2_2 == "抗性"){
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 30 + as.numeric(input$head_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 30 + as.numeric(input$head_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 40 + as.numeric(input$head_zuan1)
      } else {data <- data}
      if (input$head2_3 == "人祸"){
        data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
      }
      if (input$head2_3 == "疾语"){
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      }
      if (input$head2_3 == "神明"){
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 20
      }
    }
    if (input$head3_1 == "无"){
      data <- data
    } else {
      if (input$head1 %in% c("妙手之古始冠","元破之古始冠","浩风之古始冠","轻焰之古始冠",
                             "寒雨之古始冠","闇火之古始冠","龙卷之古始冠","沉忧之古始冠",
                             "混元之古始冠","罂散之古始冠")){
        data[data[,1] == input$head3_1,2] <- data[data[,1] == input$head3_1,2] + 35 + as.numeric(input$head_zuan2)
      } else if (input$head1 %in% c("秋水落霞冠","长天孤鹜冠","燕影之无极冠")){
        data[data[,1] == input$head3_1,2] <- data[data[,1] == input$head3_1,2] + 34 + as.numeric(input$head_zuan2)
      } else if (input$head1 %in% c("蓝沁冠","紫陌冠·玄","紫陌冠·素")){
        data[data[,1] == input$head3_1,2] <- data[data[,1] == input$head3_1,2] + 32 + as.numeric(input$head_zuan2)
      } else if (input$head1 == "上净云水冠"){
        data[data[,1] == input$head3_1,2] <- data[data[,1] == input$head3_1,2] + 31 + as.numeric(input$head_zuan2)
      }
    }
    if (input$head3_2 == "无"){
      data <- data
    } else {
      if (input$head1 %in% c("妙手之古始冠","元破之古始冠","浩风之古始冠","轻焰之古始冠",
                             "寒雨之古始冠","闇火之古始冠","龙卷之古始冠","沉忧之古始冠",
                             "混元之古始冠","罂散之古始冠")){
        if (input$head3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 17 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 35 + 2*as.numeric(input$head_zuan2)
        }
      } else if (input$head1 %in% c("秋水落霞冠","长天孤鹜冠","燕影之无极冠")){
        if (input$head3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 17 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 34 + 2*as.numeric(input$head_zuan2)
        }
      } else if (input$head1 %in% c("蓝沁冠","紫陌冠·玄","紫陌冠·素")){
        if (input$head3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 16 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 32 + 2*as.numeric(input$head_zuan2)
        }
      } else if (input$head1 == "上净云水冠"){
        if (input$head3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 15 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_2,2] <- data[data[,1] == input$head3_2,2] + 31 + 2*as.numeric(input$head_zuan2)
        }
      }
    }
    if (input$head3_3 == "无"){
      data <- data
    } else {
      if (input$head1 %in% c("妙手之古始冠","元破之古始冠","浩风之古始冠","轻焰之古始冠",
                             "寒雨之古始冠","闇火之古始冠","龙卷之古始冠","沉忧之古始冠",
                             "混元之古始冠","罂散之古始冠","秋水落霞冠","长天孤鹜冠","燕影之无极冠")){
        data[data[,1] == input$head3_3,2] <- data[data[,1] == input$head3_3,2] + 47 
      } else if (input$head1 %in% c("蓝沁冠","紫陌冠·玄","紫陌冠·素","上净云水冠")){
        data[data[,1] == input$head3_3,2] <- data[data[,1] == input$head3_3,2] + 43
      } 
    }
    if (input$head3_4 == "无"){
      data <- data
    } else {
      if (input$head1 %in% c("妙手之古始冠","元破之古始冠","浩风之古始冠","轻焰之古始冠",
                             "寒雨之古始冠","闇火之古始冠","龙卷之古始冠","沉忧之古始冠",
                             "混元之古始冠","罂散之古始冠")){
        if (input$head3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 17 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 35 + 2*as.numeric(input$head_zuan2)
        }
      } else if (input$head1 %in% c("秋水落霞冠","长天孤鹜冠","燕影之无极冠")){
        if (input$head3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 17 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 34 + 2*as.numeric(input$head_zuan2)
        }
      } else if (input$head1 %in% c("蓝沁冠","紫陌冠·玄","紫陌冠·素")){
        if (input$head3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 16 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 32 + 2*as.numeric(input$head_zuan2)
        }
      } else if (input$head1 == "上净云水冠"){
        if (input$head3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 15 + as.numeric(input$head_zuan2)
        } else {
          data[data[,1] == input$head3_4,2] <- data[data[,1] == input$head3_4,2] + 31 + 2*as.numeric(input$head_zuan2)
        }
      }
    }
    if (input$head4 == "无"){
      data <- data
    } else {
      data[data[,1] == input$head4,2] <- data[data[,1] == input$head4,2] + 9
    }
    ##############肩膀######################
    if (input$shoulder1 == "妙手之古始肩"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 54
    }
    if (input$shoulder1 == "龙卷之古始肩"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 18 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "元破之古始肩"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 540 + 9*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$shoulder1 == "闇火之古始肩"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 18 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "轻焰之古始肩"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 18 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "罂散之古始肩"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 3*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 18 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "浩风之古始肩"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 331 + 6*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$shoulder1 == "寒雨之古始肩"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 54
    }
    if (input$shoulder1 == "沉忧之古始肩"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 38
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "混元之古始肩"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 36 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 282 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 18 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 18 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "紫陌肩·玄"){
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 24 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 315 + 6*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 26 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 26 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 167 + 3*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 252 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 34
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
    }
    if (input$shoulder1 == "紫陌肩·素"){
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 68 + 2*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 315 + 6*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 34 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 24 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 167 + 3*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 252 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 24 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 34 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "蓝沁肩"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 5 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 33 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 17 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 39 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 167 + 3*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 252 + 5*as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "秋水落霞肩"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 25 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 17 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 19 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 253 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 273 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 110 + 2*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
    }
    if (input$shoulder1 == "长天孤鹜肩"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 19 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 25 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 25 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 181 + 4*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 273 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 11 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "上净云水肩"){
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 16 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 119 + 2*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 16 + as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 246 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 248 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 26
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 11 + as.numeric(input$shoulder_zuan1)
    }
    if (input$shoulder1 == "燕影之无极肩"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 310 + 6*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 178 + 3*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 269 + 5*as.numeric(input$shoulder_zuan1)
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
      if (input$shoulder2_1 == "重击"){
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 26 + as.numeric(input$shoulder_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 26 + as.numeric(input$shoulder_zuan1)
      }
      if (input$shoulder2_1 == "回避"){
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 87 + 2*as.numeric(input$shoulder_zuan1)
      }
      if (input$shoulder2_1 == "命中"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 70 + 2*as.numeric(input$shoulder_zuan1)
      }
      if (input$shoulder2_1 == "会心"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 52 + as.numeric(input$shoulder_zuan1)
      }
      if (input$shoulder2_2 == "抗性"){
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 37 + as.numeric(input$shoulder_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 37 + as.numeric(input$shoulder_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 49 + as.numeric(input$shoulder_zuan1)
      } else {data <- data}
      if (input$shoulder2_3 == "人祸"){
        data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
      }
      if (input$shoulder2_3 == "疾语"){
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      }
      if (input$shoulder2_3 == "神明"){
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 25
      }
    }
    if (input$shoulder3_1 == "无"){
      data <- data
    } else {
      if (input$shoulder1 %in% c("妙手之古始肩","元破之古始肩","浩风之古始肩","轻焰之古始肩",
                                 "寒雨之古始肩","闇火之古始肩","龙卷之古始肩","沉忧之古始肩",
                                 "混元之古始肩","罂散之古始肩")){
        data[data[,1] == input$shoulder3_1,2] <- data[data[,1] == input$shoulder3_1,2] + 35 + as.numeric(input$shoulder_zuan2)
      } else if (input$shoulder1 %in% c("秋水落霞肩","长天孤鹜肩","燕影之无极肩")){
        data[data[,1] == input$shoulder3_1,2] <- data[data[,1] == input$shoulder3_1,2] + 34 + as.numeric(input$shoulder_zuan2)
      } else if (input$shoulder1 %in% c("蓝沁肩","紫陌肩·玄","紫陌肩·素")){
        data[data[,1] == input$shoulder3_1,2] <- data[data[,1] == input$shoulder3_1,2] + 32 + as.numeric(input$shoulder_zuan2)
      } else if (input$shoulder1 == "上净云水肩"){
        data[data[,1] == input$shoulder3_1,2] <- data[data[,1] == input$shoulder3_1,2] + 31 + as.numeric(input$shoulder_zuan2)
      }
    }
    if (input$shoulder3_2 == "无"){
      data <- data
    } else {
      if (input$shoulder1 %in% c("妙手之古始肩","元破之古始肩","浩风之古始肩","轻焰之古始肩",
                                 "寒雨之古始肩","闇火之古始肩","龙卷之古始肩","沉忧之古始肩",
                                 "混元之古始肩","罂散之古始肩")){
        if (input$shoulder3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                     "元重","毒重")){
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 17 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 35 + 2*as.numeric(input$shoulder_zuan2)
        }
      } else if (input$shoulder1 %in% c("秋水落霞肩","长天孤鹜肩","燕影之无极肩")){
        if (input$shoulder3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                     "元重","毒重")){
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 17 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 34 + 2*as.numeric(input$shoulder_zuan2)
        }
      } else if (input$shoulder1 %in% c("蓝沁肩","紫陌肩·玄","紫陌肩·素")){
        if (input$shoulder3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                     "元重","毒重")){
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 16 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 32 + 2*as.numeric(input$shoulder_zuan2)
        }
      } else if (input$shoulder1 == "上净云水肩"){
        if (input$shoulder3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                     "元重","毒重")){
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 15 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_2,2] <- data[data[,1] == input$shoulder3_2,2] + 31 + 2*as.numeric(input$shoulder_zuan2)
        }
      }
    }
    if (input$shoulder3_3 == "无"){
      data <- data
    } else {
      if (input$shoulder1 %in% c("妙手之古始肩","元破之古始肩","浩风之古始肩","轻焰之古始肩",
                                 "寒雨之古始肩","闇火之古始肩","龙卷之古始肩","沉忧之古始肩",
                                 "混元之古始肩","罂散之古始肩","秋水落霞肩","长天孤鹜肩","燕影之无极肩")){
        data[data[,1] == input$shoulder3_3,2] <- data[data[,1] == input$shoulder3_3,2] + 47 
      } else if (input$shoulder1 %in% c("蓝沁肩","紫陌肩·玄","紫陌肩·素","上净云水肩")){
        data[data[,1] == input$shoulder3_3,2] <- data[data[,1] == input$shoulder3_3,2] + 43
      } 
    }
    if (input$shoulder3_4 == "无"){
      data <- data
    } else {
      if (input$shoulder1 %in% c("妙手之古始肩","元破之古始肩","浩风之古始肩","轻焰之古始肩",
                                 "寒雨之古始肩","闇火之古始肩","龙卷之古始肩","沉忧之古始肩",
                                 "混元之古始肩","罂散之古始肩")){
        if (input$shoulder3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 17 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 35 + 2*as.numeric(input$shoulder_zuan2)
        }
      } else if (input$shoulder1 %in% c("秋水落霞肩","长天孤鹜肩","燕影之无极肩")){
        if (input$shoulder3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 17 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 34 + 2*as.numeric(input$shoulder_zuan2)
        }
      } else if (input$shoulder1 %in% c("蓝沁肩","紫陌肩·玄","紫陌肩·素")){
        if (input$shoulder3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 16 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 32 + 2*as.numeric(input$shoulder_zuan2)
        }
      } else if (input$shoulder1 == "上净云水肩"){
        if (input$shoulder3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 15 + as.numeric(input$shoulder_zuan2)
        } else {
          data[data[,1] == input$shoulder3_4,2] <- data[data[,1] == input$shoulder3_4,2] + 31 + 2*as.numeric(input$shoulder_zuan2)
        }
      }
    }
    if (input$shoulder4 == "无"){
      data <- data
    } else {
      data[data[,1] == input$shoulder4,2] <- data[data[,1] == input$shoulder4,2] + 9
    }
      ##############袍######################
      if (input$clothes1 == "妙手之古始袍"){
        data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
        data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 64
      }
      if (input$clothes1 == "龙卷之古始袍"){
        data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
        data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 22 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "元破之古始袍"){
        data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 645 + 11*as.numeric(input$clothes_zuan1)
        data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      }
      if (input$clothes1 == "闇火之古始袍"){
        data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
        data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 22+ as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "轻焰之古始袍"){
        data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
        data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 22 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "罂散之古始袍"){
        data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 3*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
        data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 22 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "浩风之古始袍"){
        data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 412 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      }
      if (input$clothes1 == "寒雨之古始袍"){
        data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
        data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 64
      }
      if (input$clothes1 == "沉忧之古始袍"){
        data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 50
        data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "混元之古始袍"){
        data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 43 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 240 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 362 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 234 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
        data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 22 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "紫陌袍·玄"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 29 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 420 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 31 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 31 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 214 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 324 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 210 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 41
        data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
      }
      if (input$clothes1 == "紫陌袍·素"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 83 + 2*as.numeric(input$clothes_zuan1)
        data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 420 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 251 + 5*as.numeric(input$clothes_zuan1)
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 29 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 214 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 324 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 29 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 41 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "蓝沁袍"){
        data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 16 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 41 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "魂",2] + 6 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 46 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "力",2] + 5 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 210 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 214 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 324 + 6*as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "秋水落霞袍"){
        data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 29 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 325 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 351 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 227 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
        data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 110 + 2*as.numeric(input$clothes_zuan1)
        data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
      }
      if (input$clothes1 == "长天孤鹜袍"){
        data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 22 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 29 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 29 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 232 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 351 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 227 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
        data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 16 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "上净云水袍"){
        data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 19 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 147 + 3*as.numeric(input$clothes_zuan1)
        data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 19 + as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 316 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 318 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 206 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 32
        data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
        data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 16 + as.numeric(input$clothes_zuan1)
      }
      if (input$clothes1 == "燕影之无极袍"){
        data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 379 + 7*as.numeric(input$clothes_zuan1)
        data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 229 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 346 + 6*as.numeric(input$clothes_zuan1)
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 224 + 4*as.numeric(input$clothes_zuan1)
        data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
        if (input$clothes2_1 == "重击"){
          data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 32 + as.numeric(input$clothes_zuan1)
          data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 32 + as.numeric(input$clothes_zuan1)
        }
        if (input$clothes2_1 == "回避"){
          data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 107 + 2*as.numeric(input$clothes_zuan1)
        }
        if (input$clothes2_1 == "命中"){
          data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 85 + 2*as.numeric(input$clothes_zuan1)
        }
        if (input$clothes2_1 == "会心"){
          data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 52 + as.numeric(input$clothes_zuan1)
        }
        if (input$clothes2_2 == "抗性"){
          data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 46 + as.numeric(input$clothes_zuan1)
          data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 46 + as.numeric(input$clothes_zuan1)
          data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 60 + as.numeric(input$clothes_zuan1)
        } else {data <- data}
        if (input$clothes2_3 == "人祸"){
          data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
        }
        if (input$clothes2_3 == "疾语"){
          data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
        }
        if (input$clothes2_3 == "神明"){
          data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 30
        }
      }
      if (input$clothes3_1 == "无"){
        data <- data
      } else {
        if (input$clothes1 %in% c("妙手之古始袍","元破之古始袍","浩风之古始袍","轻焰之古始袍",
                                  "寒雨之古始袍","闇火之古始袍","龙卷之古始袍","沉忧之古始袍",
                                  "混元之古始袍","罂散之古始袍")){
          data[data[,1] == input$clothes3_1,2] <- data[data[,1] == input$clothes3_1,2] + 35 + as.numeric(input$clothes_zuan2)
        } else if (input$clothes1 %in% c("秋水落霞袍","长天孤鹜袍","燕影之无极袍")){
          data[data[,1] == input$clothes3_1,2] <- data[data[,1] == input$clothes3_1,2] + 34 + as.numeric(input$clothes_zuan2)
        } else if (input$clothes1 %in% c("蓝沁袍","紫陌袍·玄","紫陌袍·素")){
          data[data[,1] == input$clothes3_1,2] <- data[data[,1] == input$clothes3_1,2] + 32 + as.numeric(input$clothes_zuan2)
        } else if (input$clothes1 == "上净云水袍"){
          data[data[,1] == input$clothes3_1,2] <- data[data[,1] == input$clothes3_1,2] + 31 + as.numeric(input$clothes_zuan2)
        }
      }
      if (input$clothes3_2 == "无"){
        data <- data
      } else {
        if (input$clothes1 %in% c("妙手之古始袍","元破之古始袍","浩风之古始袍","轻焰之古始袍",
                                  "寒雨之古始袍","闇火之古始袍","龙卷之古始袍","沉忧之古始袍",
                                  "混元之古始袍","罂散之古始袍")){
          if (input$clothes3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                      "元重","毒重")){
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 17 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 35 + 2*as.numeric(input$clothes_zuan2)
          }
        } else if (input$clothes1 %in% c("秋水落霞袍","长天孤鹜袍","燕影之无极袍")){
          if (input$clothes3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                      "元重","毒重")){
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 17 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 34 + 2*as.numeric(input$clothes_zuan2)
          }
        } else if (input$clothes1 %in% c("蓝沁袍","紫陌袍·玄","紫陌袍·素")){
          if (input$clothes3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                      "元重","毒重")){
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 16 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 32 + 2*as.numeric(input$clothes_zuan2)
          }
        } else if (input$clothes1 == "上净云水袍"){
          if (input$clothes3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                      "元重","毒重")){
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 15 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_2,2] <- data[data[,1] == input$clothes3_2,2] + 31 + 2*as.numeric(input$clothes_zuan2)
          }
        }
      }
      if (input$clothes3_3 == "无"){
        data <- data
      } else {
        if (input$clothes1 %in% c("妙手之古始袍","元破之古始袍","浩风之古始袍","轻焰之古始袍",
                                  "寒雨之古始袍","闇火之古始袍","龙卷之古始袍","沉忧之古始袍",
                                  "混元之古始袍","罂散之古始袍","秋水落霞袍","长天孤鹜袍","燕影之无极袍")){
          data[data[,1] == input$clothes3_3,2] <- data[data[,1] == input$clothes3_3,2] + 47 
        } else if (input$clothes1 %in% c("蓝沁袍","紫陌袍·玄","紫陌袍·素","上净云水袍")){
          data[data[,1] == input$clothes3_3,2] <- data[data[,1] == input$clothes3_3,2] + 43
        } 
      }
      if (input$clothes3_4 == "无"){
        data <- data
      } else {
        if (input$clothes1 %in% c("妙手之古始袍","元破之古始袍","浩风之古始袍","轻焰之古始袍",
                                  "寒雨之古始袍","闇火之古始袍","龙卷之古始袍","沉忧之古始袍",
                                  "混元之古始袍","罂散之古始袍")){
          if (input$clothes3_4 %in% c("最大物攻","最大法攻")){
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 17 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 35 + 2*as.numeric(input$clothes_zuan2)
          }
        } else if (input$clothes1 %in% c("秋水落霞袍","长天孤鹜袍","燕影之无极袍")){
          if (input$clothes3_4 %in% c("最大物攻","最大法攻")){
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 17 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 34 + 2*as.numeric(input$clothes_zuan2)
          }
        } else if (input$clothes1 %in% c("蓝沁袍","紫陌袍·玄","紫陌袍·素")){
          if (input$clothes3_4 %in% c("最大物攻","最大法攻")){
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 16 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 32 + 2*as.numeric(input$clothes_zuan2)
          }
        } else if (input$clothes1 == "上净云水袍"){
          if (input$clothes3_4 %in% c("最大物攻","最大法攻")){
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 15 + as.numeric(input$clothes_zuan2)
          } else {
            data[data[,1] == input$clothes3_4,2] <- data[data[,1] == input$clothes3_4,2] + 31 + 2*as.numeric(input$clothes_zuan2)
          }
        }
      }
      if (input$clothes4 == "无"){
        data <- data
      } else {
        data[data[,1] == input$clothes4,2] <- data[data[,1] == input$clothes4,2] + 9
      }
    ##############带######################
    if (input$belt1 == "妙手之古始带"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 30
    }
    if (input$belt1 == "龙卷之古始带"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 10 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "元破之古始带"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 984 + 17*as.numeric(input$belt_zuan1)
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$belt1 == "闇火之古始带"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 10 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "轻焰之古始带"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 10 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "罂散之古始带"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 10 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "浩风之古始带"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 187 + 4*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$belt1 == "寒雨之古始带"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 30
    }
    if (input$belt1 == "沉忧之古始带"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 10 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "混元之古始带"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 107 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 684 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 10 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "紫陌带·玄"){
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 14 + as.numeric(input$belt_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 15 + as.numeric(input$belt_zuan1)
      data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 15 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 95 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 805 + 14*as.numeric(input$belt_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 20
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
    }
    if (input$belt1 == "紫陌带·素"){
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 40 + as.numeric(input$belt_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 20 + as.numeric(input$belt_zuan1)
      data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 14 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 95 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 805 + 14*as.numeric(input$belt_zuan1)
      data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 14 + as.numeric(input$belt_zuan1)
      data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 20 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "蓝沁带"){
      data[data[,1] == "敏",2] <- data[data[,1] == "疾",2] + 5 + as.numeric(input$belt_zuan1)
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 19 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "魂",2] + 6 + as.numeric(input$belt_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 24 + as.numeric(input$belt_zuan1)
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 95 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 610 + 11*as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "秋水落霞带"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 14 + as.numeric(input$belt_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 10 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 12 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 145 + 3*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 664 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
    }
    if (input$belt1 == "长天孤鹜带"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 12 + as.numeric(input$belt_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 14 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 14 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 104 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 662 + 12*as.numeric(input$belt_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 9 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "上净云水带"){
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 9 + as.numeric(input$belt_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 8 + as.numeric(input$belt_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 28 + as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 141 + 3*as.numeric(input$belt_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 600 + 10*as.numeric(input$belt_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 16
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 8 + as.numeric(input$belt_zuan1)
    }
    if (input$belt1 == "燕影之无极带"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 933 + 16*as.numeric(input$belt_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 102 + 2*as.numeric(input$belt_zuan1)
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
      if (input$belt2_1 == "重击"){
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 15 + as.numeric(input$belt_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 15 + as.numeric(input$belt_zuan1)
      }
      if (input$belt2_1 == "回避"){
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 52 + as.numeric(input$belt_zuan1)
      }
      if (input$belt2_1 == "命中"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 41 + as.numeric(input$belt_zuan1)
      }
      if (input$belt2_1 == "会心"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 31 + as.numeric(input$belt_zuan1)
      }
      if (input$belt2_2 == "抗性"){
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 28 + as.numeric(input$belt_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 28 + as.numeric(input$belt_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 36 + as.numeric(input$belt_zuan1)
      } else {data <- data}
      if (input$belt2_3 == "人祸"){
        data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
      }
      if (input$belt2_3 == "疾语"){
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      }
      if (input$belt2_3 == "神明"){
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 15
      }
    }
    if (input$belt4 == "无"){
      data <- data
    } else {
      data[data[,1] == input$belt4,2] <- data[data[,1] == input$belt4,2] + 9
    }
    ########长裤###################
    if (input$pant1 == "妙手之古始长裤"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 40
    }
    if (input$pant1 == "龙卷之古始长裤"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 14 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "元破之古始长裤"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 405 + 7*as.numeric(input$pant_zuan1)
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$pant1 == "闇火之古始长裤"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 14 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "轻焰之古始长裤"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 14 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "罂散之古始长裤"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 14 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "浩风之古始长裤"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 241 + 5*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$pant1 == "寒雨之古始长裤"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 40
    }
    if (input$pant1 == "沉忧之古始长裤"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "混元之古始长裤"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 133 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 14 + as.numeric(input$pant_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 14 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "紫陌长裤·玄"){
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 18 + as.numeric(input$pant_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 240 + 4*as.numeric(input$pant_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 20 + as.numeric(input$pant_zuan1)
      data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 20 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 119 + 2*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 117 + 2*as.numeric(input$pant_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 26
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
    }
    if (input$pant1 == "紫陌长裤·素"){
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 52 + as.numeric(input$pant_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 240 + 4*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 143 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 18 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 119 + 2*as.numeric(input$pant_zuan1)
      data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 18 + as.numeric(input$pant_zuan1)
      data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 26 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "蓝沁长裤"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 26 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 16 + as.numeric(input$pant_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 31 + as.numeric(input$pant_zuan1)
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 119 + 2*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 117 + 2*as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "秋水落霞长裤"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 18 + as.numeric(input$pant_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 11 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 13 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 181 + 4*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 126 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 79 + 2*as.numeric(input$pant_zuan1)
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
    }
    if (input$pant1 == "长天孤鹜长裤"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 13 + as.numeric(input$pant_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 18 + as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 18 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 129 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 126 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 11 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "上净云水长裤"){
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 12 + as.numeric(input$pant_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 92 + 2*as.numeric(input$pant_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 12 + as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 176 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 115 + 2*as.numeric(input$pant_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 20
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 11 + as.numeric(input$pant_zuan1)
    }
    if (input$pant1 == "燕影之无极长裤"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 241 + 5*as.numeric(input$pant_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 127 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 125 + 3*as.numeric(input$pant_zuan1)
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
      if (input$pant2_1 == "重击"){
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 20 + as.numeric(input$pant_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 20 + as.numeric(input$pant_zuan1)
      }
      if (input$pant2_1 == "回避"){
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 68 + as.numeric(input$pant_zuan1)
      }
      if (input$pant2_1 == "命中"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$pant_zuan1)
      }
      if (input$pant2_1 == "会心"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 40 + as.numeric(input$pant_zuan1)
      }
      if (input$pant2_2 == "抗性"){
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 29 + as.numeric(input$pant_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 29 + as.numeric(input$pant_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 38 + as.numeric(input$pant_zuan1)
      } else {data <- data}
      if (input$pant2_3 == "人祸"){
        data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
      }
      if (input$pant2_3 == "疾语"){
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      }
      if (input$pant2_3 == "神明"){
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 19
      }
    }
    if (input$pant3_1 == "无"){
      data <- data
    } else {
      if (input$pant1 %in% c("妙手之古始长裤","元破之古始长裤","浩风之古始长裤","轻焰之古始长裤",
                             "寒雨之古始长裤","闇火之古始长裤","龙卷之古始长裤","沉忧之古始长裤",
                             "混元之古始长裤","罂散之古始长裤")){
        data[data[,1] == input$pant3_1,2] <- data[data[,1] == input$pant3_1,2] + 35 + as.numeric(input$pant_zuan2)
      } else if (input$pant1 %in% c("秋水落霞长裤","长天孤鹜长裤","燕影之无极长裤")){
        data[data[,1] == input$pant3_1,2] <- data[data[,1] == input$pant3_1,2] + 34 + as.numeric(input$pant_zuan2)
      } else if (input$pant1 %in% c("蓝沁长裤","紫陌长裤·玄","紫陌长裤·素")){
        data[data[,1] == input$pant3_1,2] <- data[data[,1] == input$pant3_1,2] + 32 + as.numeric(input$pant_zuan2)
      } else if (input$pant1 == "上净云水长裤"){
        data[data[,1] == input$pant3_1,2] <- data[data[,1] == input$pant3_1,2] + 31 + as.numeric(input$pant_zuan2)
      }
    }
    if (input$pant3_2 == "无"){
      data <- data
    } else {
      if (input$pant1 %in% c("妙手之古始长裤","元破之古始长裤","浩风之古始长裤","轻焰之古始长裤",
                             "寒雨之古始长裤","闇火之古始长裤","龙卷之古始长裤","沉忧之古始长裤",
                             "混元之古始长裤","罂散之古始长裤")){
        if (input$pant3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 17 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 35 + 2*as.numeric(input$pant_zuan2)
        }
      } else if (input$pant1 %in% c("秋水落霞长裤","长天孤鹜长裤","燕影之无极长裤")){
        if (input$pant3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 17 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 34 + 2*as.numeric(input$pant_zuan2)
        }
      } else if (input$pant1 %in% c("蓝沁长裤","紫陌长裤·玄","紫陌长裤·素")){
        if (input$pant3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 16 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 32 + 2*as.numeric(input$pant_zuan2)
        }
      } else if (input$pant1 == "上净云水长裤"){
        if (input$pant3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                 "元重","毒重")){
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 15 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_2,2] <- data[data[,1] == input$pant3_2,2] + 31 + 2*as.numeric(input$pant_zuan2)
        }
      }
    }
    if (input$pant3_3 == "无"){
      data <- data
    } else {
      if (input$pant1 %in% c("妙手之古始长裤","元破之古始长裤","浩风之古始长裤","轻焰之古始长裤",
                             "寒雨之古始长裤","闇火之古始长裤","龙卷之古始长裤","沉忧之古始长裤",
                             "混元之古始长裤","罂散之古始长裤","秋水落霞长裤","长天孤鹜长裤","燕影之无极长裤")){
        data[data[,1] == input$pant3_3,2] <- data[data[,1] == input$pant3_3,2] + 47 
      } else if (input$pant1 %in% c("蓝沁长裤","紫陌长裤·玄","紫陌长裤·素","上净云水长裤")){
        data[data[,1] == input$pant3_3,2] <- data[data[,1] == input$pant3_3,2] + 43
      } 
    }
    if (input$pant3_4 == "无"){
      data <- data
    } else {
      if (input$pant1 %in% c("妙手之古始长裤","元破之古始长裤","浩风之古始长裤","轻焰之古始长裤",
                             "寒雨之古始长裤","闇火之古始长裤","龙卷之古始长裤","沉忧之古始长裤",
                             "混元之古始长裤","罂散之古始长裤")){
        if (input$pant3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 17 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 35 + 2*as.numeric(input$pant_zuan2)
        }
      } else if (input$pant1 %in% c("秋水落霞长裤","长天孤鹜长裤","燕影之无极长裤")){
        if (input$pant3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 17 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 34 + 2*as.numeric(input$pant_zuan2)
        }
      } else if (input$pant1 %in% c("蓝沁长裤","紫陌长裤·玄","紫陌长裤·素")){
        if (input$pant3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 16 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 32 + 2*as.numeric(input$pant_zuan2)
        }
      } else if (input$pant1 == "上净云水长裤"){
        if (input$pant3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 15 + as.numeric(input$pant_zuan2)
        } else {
          data[data[,1] == input$pant3_4,2] <- data[data[,1] == input$pant3_4,2] + 31 + 2*as.numeric(input$pant_zuan2)
        }
      }
    }
    if (input$pant4 == "无"){
      data <- data
    } else {
      data[data[,1] == input$pant4,2] <- data[data[,1] == input$pant4,2] + 9
    }
    ########摆###################
    if (input$short1 == "妙手之古始摆"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 45
    }
    if (input$short1 == "龙卷之古始摆"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 15 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "元破之古始摆"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 450 + 8*as.numeric(input$short_zuan1)
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$short1 == "闇火之古始摆"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 15 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "轻焰之古始摆"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 15 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "罂散之古始摆"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 15 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "浩风之古始摆"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 120 + 2*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$short1 == "寒雨之古始摆"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 45
    }
    if (input$short1 == "沉忧之古始摆"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 38
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "混元之古始摆"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 30 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 242 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 156 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 15 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "紫陌摆·玄"){
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 20 + as.numeric(input$short_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 285 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 21 + as.numeric(input$short_zuan1)
      data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 21 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 216 + 4*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 140 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 28
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
    }
    if (input$short1 == "紫陌摆·素"){
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 57 + as.numeric(input$short_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 285 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 168 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 20 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 216 + 4*as.numeric(input$short_zuan1)
      data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 20 + as.numeric(input$short_zuan1)
      data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 28 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "蓝沁摆"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 9 + as.numeric(input$short_zuan1)
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 28 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 9 + as.numeric(input$short_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 33 + as.numeric(input$short_zuan1)
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 216 + 4*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 140 + 3*as.numeric(input$short_zuan1)
    }
    if (input$short1 == "秋水落霞摆"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$short_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 13 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 234 + 4*as.numeric(input$short_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 75 + 2*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 152 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 52 + as.numeric(input$short_zuan1)
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
    }
    if (input$short1 == "长天孤鹜摆"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 15 + as.numeric(input$short_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 234 + 4*as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "回避",2] + 152 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 12 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "上净云水摆"){
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 13 + as.numeric(input$short_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 101 + 2*as.numeric(input$short_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 13 + as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 212 + 4*as.numeric(input$short_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 71 + 2*as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "回避",2] + 138 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 22
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 12 + as.numeric(input$short_zuan1)
    }
    if (input$short1 == "燕影之无极摆"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 264 + 5*as.numeric(input$short_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 231 + 4*as.numeric(input$short_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 149 + 3*as.numeric(input$short_zuan1)
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
      if (input$short2_1 == "重击"){
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 21 + as.numeric(input$short_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 21 + as.numeric(input$short_zuan1)
      }
      if (input$short2_1 == "回避"){
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 74 + as.numeric(input$short_zuan1)
      }
      if (input$short2_1 == "命中"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 59 + as.numeric(input$short_zuan1)
      }
      if (input$short2_1 == "会心"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 44 + as.numeric(input$short_zuan1)
      }
      if (input$short2_2 == "抗性"){
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 32 + as.numeric(input$short_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 32 + as.numeric(input$short_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 41 + as.numeric(input$short_zuan1)
      } else {data <- data}
      if (input$short2_3 == "人祸"){
        data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
      }
      if (input$short2_3 == "疾语"){
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      }
      if (input$short2_3 == "神明"){
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 21
      }
    }
    if (input$short4 == "无"){
      data <- data
    } else {
      data[data[,1] == input$short4,2] <- data[data[,1] == input$short4,2] + 9
    }
    ########腕###################
    if (input$arm1 == "妙手之古始腕"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 30
    }
    if (input$arm1 == "龙卷之古始腕"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 10 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "元破之古始腕"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 300 + 5*as.numeric(input$arm_zuan1)
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$arm1 == "闇火之古始腕"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 10 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "轻焰之古始腕"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 51 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 10 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "罂散之古始腕"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 10 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "浩风之古始腕"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 80 + 2*as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$arm1 == "寒雨之古始腕"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 30
    }
    if (input$arm1 == "沉忧之古始腕"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 41 + as.numeric(input$arm_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "混元之古始腕"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 54 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 51 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 10 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "紫陌腕·玄"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 195 + 4*as.numeric(input$arm_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 15 + as.numeric(input$arm_zuan1)
      data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 15 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 62 + 2*as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 37 + as.numeric(input$arm_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 20
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
    }
    if (input$arm1 == "紫陌腕·素"){
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 77 + 2*as.numeric(input$arm_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 195 + 4*as.numeric(input$arm_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 20 + as.numeric(input$arm_zuan1)
      data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 14 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 48 + as.numeric(input$arm_zuan1)
      data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 14 + as.numeric(input$arm_zuan1)
      data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 20 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "蓝沁腕"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 1 + as.numeric(input$arm_zuan1)
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 19 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 24 + as.numeric(input$arm_zuan1)
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 48 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 37 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "秋水落霞腕"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 14 + as.numeric(input$arm_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 10 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 12 + as.numeric(input$arm_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 50 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 52 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 40 + as.numeric(input$arm_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 63 + 2*as.numeric(input$arm_zuan1)
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
    }
    if (input$arm1 == "长天孤鹜腕"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 12 + as.numeric(input$arm_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 14 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 14 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 52 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 40 + as.numeric(input$arm_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 10 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "上净云水腕"){
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 9 + as.numeric(input$arm_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 69 + 2*as.numeric(input$arm_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 8 + as.numeric(input$arm_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 47 + as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 47 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 36 + as.numeric(input$arm_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 15
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 8 + as.numeric(input$arm_zuan1)
    }
    if (input$arm1 == "燕影之无极腕"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 172 + 3*as.numeric(input$arm_zuan1)
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 51 + as.numeric(input$arm_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 39 + as.numeric(input$arm_zuan1)
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
      if (input$arm2_1 == "重击"){
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 14 + as.numeric(input$arm_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 14 + as.numeric(input$arm_zuan1)
      }
      if (input$arm2_1 == "回避"){
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 48 + as.numeric(input$arm_zuan1)
      }
      if (input$arm2_1 == "命中"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 39 + as.numeric(input$arm_zuan1)
      }
      if (input$arm2_1 == "会心"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 29 + as.numeric(input$arm_zuan1)
      }
      if (input$arm2_2 == "抗性"){
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 21 + as.numeric(input$arm_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 21 + as.numeric(input$arm_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 27 + as.numeric(input$arm_zuan1)
      } else {data <- data}
      if (input$arm2_3 == "人祸"){
        data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
      }
      if (input$arm2_3 == "疾语"){
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      }
      if (input$arm2_3 == "神明"){
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 14
      }
    }
    if (input$arm3_1 == "无"){
      data <- data
    } else {
      if (input$arm1 %in% c("妙手之古始腕","元破之古始腕","浩风之古始腕","轻焰之古始腕",
                            "寒雨之古始腕","闇火之古始腕","龙卷之古始腕","沉忧之古始腕",
                            "混元之古始腕","罂散之古始腕")){
        data[data[,1] == input$arm3_1,2] <- data[data[,1] == input$arm3_1,2] + 35 + as.numeric(input$arm_zuan2)
      } else if (input$arm1 %in% c("秋水落霞腕","长天孤鹜腕","燕影之无极腕")){
        data[data[,1] == input$arm3_1,2] <- data[data[,1] == input$arm3_1,2] + 34 + as.numeric(input$arm_zuan2)
      } else if (input$arm1 %in% c("蓝沁腕","紫陌腕·玄","紫陌腕·素")){
        data[data[,1] == input$arm3_1,2] <- data[data[,1] == input$arm3_1,2] + 32 + as.numeric(input$arm_zuan2)
      } else if (input$arm1 == "上净云水腕"){
        data[data[,1] == input$arm3_1,2] <- data[data[,1] == input$arm3_1,2] + 31 + as.numeric(input$arm_zuan2)
      }
    }
    if (input$arm3_2 == "无"){
      data <- data
    } else {
      if (input$arm1 %in% c("妙手之古始腕","元破之古始腕","浩风之古始腕","轻焰之古始腕",
                            "寒雨之古始腕","闇火之古始腕","龙卷之古始腕","沉忧之古始腕",
                            "混元之古始腕","罂散之古始腕")){
        if (input$arm3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                "元重","毒重")){
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 17 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 35 + 2*as.numeric(input$arm_zuan2)
        }
      } else if (input$arm1 %in% c("秋水落霞腕","长天孤鹜腕","燕影之无极腕")){
        if (input$arm3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                "元重","毒重")){
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 17 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 34 + 2*as.numeric(input$arm_zuan2)
        }
      } else if (input$arm1 %in% c("蓝沁腕","紫陌腕·玄","紫陌腕·素")){
        if (input$arm3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                "元重","毒重")){
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 16 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 32 + 2*as.numeric(input$arm_zuan2)
        }
      } else if (input$arm1 == "上净云水腕"){
        if (input$arm3_2 %in% c("附火","附水","附元","附风","附毒","白刃","阴伤","崩击","水重","火重","风重",
                                "元重","毒重")){
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 15 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_2,2] <- data[data[,1] == input$arm3_2,2] + 31 + 2*as.numeric(input$arm_zuan2)
        }
      }
    }
    if (input$arm3_3 == "无"){
      data <- data
    } else {
      if (input$arm1 %in% c("妙手之古始腕","元破之古始腕","浩风之古始腕","轻焰之古始腕",
                            "寒雨之古始腕","闇火之古始腕","龙卷之古始腕","沉忧之古始腕",
                            "混元之古始腕","罂散之古始腕","秋水落霞腕","长天孤鹜腕","燕影之无极腕")){
        data[data[,1] == input$arm3_3,2] <- data[data[,1] == input$arm3_3,2] + 47 
      } else if (input$arm1 %in% c("蓝沁腕","紫陌腕·玄","紫陌腕·素","上净云水腕")){
        data[data[,1] == input$arm3_3,2] <- data[data[,1] == input$arm3_3,2] + 43
      } 
    }
    if (input$arm3_4 == "无"){
      data <- data
    } else {
      if (input$arm1 %in% c("妙手之古始腕","元破之古始腕","浩风之古始腕","轻焰之古始腕",
                            "寒雨之古始腕","闇火之古始腕","龙卷之古始腕","沉忧之古始腕",
                            "混元之古始腕","罂散之古始腕")){
        if (input$arm3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 17 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 35 + 2*as.numeric(input$arm_zuan2)
        }
      } else if (input$arm1 %in% c("秋水落霞腕","长天孤鹜腕","燕影之无极腕")){
        if (input$arm3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 17 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 34 + 2*as.numeric(input$arm_zuan2)
        }
      } else if (input$arm1 %in% c("蓝沁腕","紫陌腕·玄","紫陌腕·素")){
        if (input$arm3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 16 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 32 + 2*as.numeric(input$arm_zuan2)
        }
      } else if (input$arm1 == "上净云水腕"){
        if (input$arm3_4 %in% c("最大物攻","最大法攻")){
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 15 + as.numeric(input$arm_zuan2)
        } else {
          data[data[,1] == input$arm3_4,2] <- data[data[,1] == input$arm3_4,2] + 31 + 2*as.numeric(input$arm_zuan2)
        }
      }
    }
    if (input$arm4 == "无"){
      data <- data
    } else {
      data[data[,1] == input$arm4,2] <- data[data[,1] == input$arm4,2] + 9
    } 
    ########履###################
    if (input$shoes1 == "妙手之古始履"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 47
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 40
    }
    if (input$shoes1 == "龙卷之古始履"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附风",2] <- data[data[,1] == "附风",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "风重",2] <- data[data[,1] == "风重",2] + 10 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "元破之古始履"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 405 + 7*as.numeric(input$shoes_zuan1)
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$shoes1 == "闇火之古始履"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "火重",2] <- data[data[,1] == "火重",2] + 10 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "轻焰之古始履"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附火",2] <- data[data[,1] == "附火",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 10 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "罂散之古始履"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 5*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附毒",2] <- data[data[,1] == "附毒",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 10 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "浩风之古始履"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 108 + 2*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
    }
    if (input$shoes1 == "寒雨之古始履"){
      data[data[,1] == "力",2] <- data[data[,1] == "力",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "白刃",2] <- data[data[,1] == "白刃",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 40
    }
    if (input$shoes1 == "沉忧之古始履"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 32
      data[data[,1] == "附水",2] <- data[data[,1] == "附水",2] + 15 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "混元之古始履"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 27 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 202 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 130 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 32
      data[data[,1] == "附元",2] <- data[data[,1] == "附元",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 10 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "紫陌履·玄"){
      data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 18 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 240 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 20 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 20 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 180 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 117 + 2*as.numeric(input$shoes_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 26
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 29
    }
    if (input$shoes1 == "紫陌履·素"){
      data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 52 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 240 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 143 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 18 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 180 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 18 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 26 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "蓝沁履"){
      data[data[,1] == "敏",2] <- data[data[,1] == "敏",2] + 5 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 26 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 10 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 31 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 29
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 180 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 117 + 2*as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "秋水落霞履"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 18 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 12 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 14 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 195 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 65 + 2*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 126 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "追电",2] <- data[data[,1] == "追电",2] + 16
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 85 + 2*as.numeric(input$shoes_zuan1)
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16
    }
    if (input$shoes1 == "长天孤鹜履"){
      data[data[,1] == "念",2] <- data[data[,1] == "念",2] + 14 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "魂",2] <- data[data[,1] == "魂",2] + 18 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 18 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 195 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "回避",2] + 126 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最大法攻",2] + 11 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "上净云水履"){
      data[data[,1] == "体",2] <- data[data[,1] == "体",2] + 12 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 87 + 2*as.numeric(input$shoes_zuan1)
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 11 + as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 177 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "物防",2] <- data[data[,1] == "物防",2] + 59 +  as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "回避",2] + 115 + 2*as.numeric(input$shoes_zuan1)
      data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 19
      data[data[,1] == "明思",2] <- data[data[,1] == "明思",2] + 15
      data[data[,1] == "最小法攻",2] <- data[data[,1] == "最小法攻",2] + 11 + as.numeric(input$shoes_zuan1)
    }
    if (input$shoes1 == "燕影之无极履"){
      data[data[,1] == "生命值",2] <- data[data[,1] == "生命值",2] + 230 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "法防",2] <- data[data[,1] == "法防",2] + 192 + 4*as.numeric(input$shoes_zuan1)
      data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 125 + 3*as.numeric(input$shoes_zuan1)
      data[data[,1] == "知彼",2] <- data[data[,1] == "知彼",2] + 32
      if (input$shoes2_1 == "重击"){
        data[data[,1] == "毒重",2] <- data[data[,1] == "毒重",2] + 19 + as.numeric(input$shoes_zuan1)
        data[data[,1] == "阴伤",2] <- data[data[,1] == "阴伤",2] + 19 + as.numeric(input$shoes_zuan1)
      }
      if (input$shoes2_1 == "回避"){
        data[data[,1] == "回避",2] <- data[data[,1] == "回避",2] + 65 + as.numeric(input$shoes_zuan1)
      }
      if (input$shoes2_1 == "命中"){
        data[data[,1] == "命中",2] <- data[data[,1] == "命中",2] + 52 + as.numeric(input$shoes_zuan1)
      }
      if (input$shoes2_1 == "会心"){
        data[data[,1] == "会心",2] <- data[data[,1] == "会心",2] + 39 + as.numeric(input$shoes_zuan1)
      }
      if (input$shoes2_2 == "抗性"){
        data[data[,1] == "身法",2] <- data[data[,1] == "身法",2] + 28 + as.numeric(input$shoes_zuan1)
        data[data[,1] == "坚韧",2] <- data[data[,1] == "坚韧",2] + 28 + as.numeric(input$shoes_zuan1)
        data[data[,1] == "定力",2] <- data[data[,1] == "定力",2] + 36 + as.numeric(input$shoes_zuan1)
      } else {data <- data}
      if (input$shoes2_3 == "人祸"){
        data[data[,1] == "人祸",2] <- data[data[,1] == "人祸",2] + 16
      }
      if (input$shoes2_3 == "疾语"){
        data[data[,1] == "疾语",2] <- data[data[,1] == "疾语",2] + 16
      }
      if (input$shoes2_3 == "神明"){
        data[data[,1] == "神明",2] <- data[data[,1] == "神明",2] + 18
      }
    }
    if (input$shoes4 == "无"){
      data <- data
    } else {
      data[data[,1] == input$shoes4,2] <- data[data[,1] == input$shoes4,2] + 9
    } 
    
    
    
    
    
    
    
    data[data[,1] == "最小物攻",2] <- floor(data[data[,1] == "最小物攻",2] + data[data[,1] == "力",2]*0.306)
    data[data[,1] == "最大物攻",2] <- floor(data[data[,1] == "最大物攻",2] + data[data[,1] == "力",2]*0.514)
    if (data[data[,1] == "最小物攻",2] > data[data[,1] == "最大物攻",2]){
      data[data[,1] == "最大物攻",2] <- data[data[,1] == "最小物攻",2]
      }
    data[data[,1] == "最小法攻",2] <- floor(data[data[,1] == "最小法攻",2] + data[data[,1] == "魂",2]*0.54)
    data[data[,1] == "最大法攻",2] <- floor(data[data[,1] == "最大法攻",2] + data[data[,1] == "魂",2]*0.9)
    if (data[data[,1] == "最小法攻",2] > data[data[,1] == "最大法攻",2]){
      data[data[,1] == "最大法攻",2] <- data[data[,1] == "最小法攻",2]
    }
    data[data[,1] == "回避",2] <- floor(data[data[,1] == "回避",2] + data[data[,1] == "疾",2]*1.5)
    data[data[,1] == "身法",2] <- floor(data[data[,1] == "身法",2] + data[data[,1] == "疾",2]*0.5)
    data[data[,1] == "法防",2] <- floor(data[data[,1] == "法防",2] + data[data[,1] == "念",2])
    data[data[,1] == "神明",2] <- floor(data[data[,1] == "神明",2] + data[data[,1] == "念",2]*0.7)
    data[data[,1] == "技力值",2] <- floor(data[data[,1] == "技力值",2] + data[data[,1] == "念",2])
    data[data[,1] == "定力",2] <- floor(data[data[,1] == "定力",2] + data[data[,1] == "念",2]*0.5)
    data[data[,1] == "命中",2] <- floor(data[data[,1] == "命中",2] + data[data[,1] == "敏",2])
    data[data[,1] == "会心",2] <- floor(data[data[,1] == "会心",2] + data[data[,1] == "敏",2]*0.5)
    data[data[,1] == "坚韧",2] <- floor(data[data[,1] == "坚韧",2] + data[data[,1] == "体",2]*0.5)
    data[data[,1] == "物防",2] <- floor(data[data[,1] == "物防",2] + data[data[,1] == "体",2])
    data[data[,1] == "生命值",2] <- floor(data[data[,1] == "生命值",2] + data[data[,1] == "体",2]*3.8)
    data[data[,1] == "疾语",2] <- floor(data[data[,1] == "疾语",2]/16.83)
    data[data[,1] == "明思",2] <- floor(data[data[,1] == "明思",2]/16.83)
    data[data[,1] == "知彼",2] <- floor(data[data[,1] == "知彼",2]/17.1)
    data[data[,1] == "明思",2] <- floor(data[data[,1] == "明思",2]/16.83)
    data[data[,1] == "人祸",2] <- floor(data[data[,1] == "人祸",2]/17.1)
    data[data[,1] == "追电",2] <- floor(data[data[,1] == "追电",2]/5.10 + 330)
    data
  })
  output$mytable <- renderDataTable({
    bang()
  },options = list(aLengthMenu = c(5,10,25,51),iDisplayLength = 51))
})








