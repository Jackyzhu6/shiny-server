library(shiny)
shinyServer(function(input, output, session) {
  
  observe({
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
    }
    if (head_1 == "紫陌冠·素"){
      updateSelectInput(session, "head4", choices = c("无","会心","回避","身法","坚韧","定力","生命值","物防","法防"))
    }
    if (head_1 == "蓝沁冠"){
      updateSelectInput(session, "head4", choices = c("无","念","疾","体","物防","法防"))
    }
    if (head_1 == "秋水落霞冠"){
      updateSelectInput(session, "head4", choices = c("无"))
    }
    if (head_1 == "长天孤鹜冠"){
      updateSelectInput(session, "head4", choices = c("无"))
    }
    if (head_1 == "上净云水冠"){
      updateSelectInput(session, "head4", choices = c("无"))
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
      data[data[,1] == "骤雨",2] <- data[data[,1] == "骤雨",2] + 47
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
      data[data[,1] == "疾",2] <- data[data[,1] == "疾",2] + 16 + 5*as.numeric(input$head_zuan1)
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
      data[data[,1] == "御心",2] <- data[data[,1] == "御心",2] + 16 + as.numeric(input$head_zuan1)
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
    data[data[,1] == "最小物攻",2] <- floor(data[data[,1] == "最小物攻",2] + data[data[,1] == "力",2]*0.306)
    data[data[,1] == "最大物攻",2] <- floor(data[data[,1] == "最大物攻",2] + data[data[,1] == "力",2]*0.514)
    data[data[,1] == "最小法攻",2] <- floor(data[data[,1] == "最小法攻",2] + data[data[,1] == "魂",2]*0.54)
    data[data[,1] == "最大法攻",2] <- floor(data[data[,1] == "最大法攻",2] + data[data[,1] == "魂",2]*0.9)
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
    data
  })
  output$mytable <- renderDataTable({
    bang()
  })
})








